//Licence
//SPDX-License-Identifier: LGPL-3.0-only

//Solidity

pragma solidity 0.8.26;

// Contract

contract Result{

    // Variables

    uint256 public result;
    uint256 public fee;
    address public  feeAdmin;

    constructor(address feeAdmin_){

        fee = 5;
        feeAdmin = feeAdmin_;

    }


    //Functions

    function setResult(uint256 num_) external {

        result = num_;

    }

    
    function setFee(uint256 newFee_) external {
        if (tx.origin != feeAdmin) revert("Only feeAdmin can execute this function");
        fee = newFee_;

    }

}