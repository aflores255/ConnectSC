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
    uint256 public fee;
    address public  feeAdmin;

    constructor(address result_, address feeAdmin_){

        result = result_;
        owner = msg.sender;
        fee = 5;
        feeAdmin = feeAdmin_;

    }

    //Modifiers

    modifier onlyMod{
        
        if (msg.sender != owner) revert("Only owner can execute this function");
        _;
    }

    modifier  onlyFeeAdmin{

        if (msg.sender != feeAdmin) revert("Only feeAdmin can execute this function");
        _;

    }
    //Functions

    // External

    function addNumbers(uint256 num1_, uint256 num2_) external {
        
        opResult = num1_ + num2_;

        IResult(result).setResult(opResult);
       

    }

    function setFee(uint256 newFee_) external onlyFeeAdmin {

        fee = newFee_;

    }

    function multiplyNumbers(uint256 num1_, uint256 num2_) external onlyMod{

        opResult = num1_ * num2_;

        IResult(result).setResult(opResult);


    }

}

