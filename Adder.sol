//Licence
//SPDX-License-Identifier: LGPL-3.0-only

//Solidity

pragma solidity 0.8.26;

// Import Interface

import "./interfaces/IResult.sol";

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
        
        if (msg.sender != owner) revert("Only owner can execute this function");
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

}

