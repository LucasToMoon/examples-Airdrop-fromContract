// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Airdrop {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getSum(uint256[] calldata _arr) public pure returns(uint sum) {
        for(uint i = 0; i < _arr.length; i++)
        sum = sum + _arr[i];
    }

    function multiTransferToken(
        address _token,
        address[] calldata _addresses,
        uint[] calldata _amounts
    ) external {
        require(msg.sender == owner, "Only owner can transfer funds");
        require(_addresses.length == _amounts.length, "Lengths of Addresses and Amounts NOT EQUAL");
        IERC20 token = IERC20(_token);
        uint erc20balance = token.balanceOf(address(this));
        uint _amountSum = getSum(_amounts);
        // require(token.allowance(msg.sender,  address(this)) >= _amountSum, "Need Approve ERC20 token");
        require(erc20balance >= _amountSum, "lack of balance");

        for (uint8 i; i < _addresses.length; i++) {
           token.transfer(_addresses[i], _amounts[i]);
        }
    }
    
}
