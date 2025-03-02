//Licence
//SPDX-License-Identifier: LGPL-3.0-only

//Solidity

pragma solidity 0.8.26;

// Import Interface

import "./interfaces/IResult.sol";

//Custom Error

error SenderNotMod(string message, address caller);

// Contract

contract Adder{

    //Object: Interface + SC Address
    address result;
    address public owner;
    uint256 private opResult;

    constructor(address result_){

        result = result_;
        owner = msg.sender;
    }

    //Modifiers

    modifier onlyMod{
        
        if (msg.sender != owner) revert SenderNotMod("Only owner can execute this function", msg.sender);
        _;
    }

    modifier feeLimit(uint256 feeLimit_){
        require(feeLimit_ > 0 && feeLimit_ < 100, "Fee must be between 1 and 100.");
        _;
    }

    //Functions

    // External

    function addNumbers(uint256 num1_, uint256 num2_) external {
        
        opResult = num1_ + num2_;

        IResult(result).setResult(opResult);
       

    }

   
    function multiplyNumbers(uint256 num1_, uint256 num2_) external onlyMod{

        opResult = num1_ * num2_;

        IResult(result).setResult(opResult);


    }

     
    function setFee(uint256 newFee_) external feeLimit(newFee_){

        IResult(result).setFee(newFee_);

    }

}

