//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract CrowdfundingCampaign is AccessControl, Pausable {
    //using
    using SafeMath for uint256;

    //state variables
    IERC20 token;
    address public manager;
    mapping(address => uint256) public pledges;
    uint256 public fundingGoal;
    uint256 public totalRaised;
    bool public funded;
    bool public goalMet;
    bool public createNewGoal;

    // Events
    event FundingGoalMet();
    event FundingGoalNotMet();
    event NewFundingGoal(uint256 indexed amount);
    event Pledged(address indexed pledger, uint256 amount);
    event Refunded(address indexed refundee, uint256 amount);
    event Withdrawn(address indexed withdrawer, uint256 amount);
    event Upgraded(address newContract);
    event ReceivedETH(address indexed sender, uint256 amount);
    event ReceivedData(address indexed sender, uint256 amount, bytes data);

    //Errors
    error AlreadyRefunded();

    constructor(address _tokenAddress, uint256 _fundingGoal) {
        require(isContract(_tokenAddress), "Token address must be a contract.");
        require(_fundingGoal > 0, "Funding goal must be greater than 0.");
        token = IERC20(_tokenAddress);
        manager = msg.sender;
        fundingGoal = _fundingGoal;
        createNewGoal = false;
        // set access control
        _grantRole("admin", manager);
        emit NewFundingGoal(_fundingGoal);
    }

    function newGoal(uint256 _newFundingGoal)
        public
        whenNotPaused
        onlyRole("admin")
    {
        require(
            createNewGoal,
            "Current goal has not been reached, solicit more pledges"
        );
        fundingGoal = _newFundingGoal;
        createNewGoal = false;
        emit NewFundingGoal(_newFundingGoal);
    }

    function pledge(uint256 _amount) public payable whenNotPaused {
        require(_amount > 0, "You cannot pledge zero");
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(
            allowance >= _amount,
            "This contract cannot pledge that amount on your behalf"
        );
        require(
            token.transferFrom(msg.sender, address(this), _amount),
            "Pledge Failed"
        );
        pledges[msg.sender] = pledges[msg.sender].add(_amount);
        totalRaised = totalRaised.add(_amount);
        emit Pledged(msg.sender, _amount);
        checkFundingGoal();
    }

    function refund() public whenNotPaused {
        require(!goalMet);
        uint256 refundAmount = pledges[msg.sender];
        if (refundAmount == 0) revert AlreadyRefunded();
        else {
            pledges[msg.sender] = 0;
            totalRaised = totalRaised.sub(refundAmount);
        }
        require(token.transfer(msg.sender, refundAmount));
        emit Refunded(msg.sender, refundAmount);
    }

    function withdraw(address receiver) public onlyRole("admin") {
        require(goalMet, "Solicit more pledges");
        require(token.transfer(receiver, totalRaised));
        createNewGoal = true;
        emit Withdrawn(receiver, totalRaised);
    }

    function upgrade(address _newContract) public onlyRole("admin") {
        CrowdfundingCampaign upgraded = CrowdfundingCampaign(
            payable(_newContract)
        );
        token.transfer(address(upgraded), totalRaised);
        emit Upgraded(_newContract);
        selfdestruct(payable(msg.sender));
    }

    //Helpers

    function isContract(address _addr)
        private
        view
        returns (bool isItAContract)
    {
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }

    function checkFundingGoal() internal {
        if (totalRaised >= fundingGoal) {
            funded = true;
            goalMet = true;
            emit FundingGoalMet();
        } else if (totalRaised < fundingGoal && funded) {
            goalMet = false;
            emit FundingGoalNotMet();
        }
    }

    function pause() public onlyRole("admin") {
        _pause();
    }

    function unpause() public onlyRole("admin") {
        _unpause();
    }

    //Fallback
    fallback() external payable {
        emit ReceivedData(msg.sender, msg.value, msg.data);
    }

    //Receive
    receive() external payable {
        emit ReceivedETH(msg.sender, msg.value);
    }
}
