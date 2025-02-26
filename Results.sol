//Licence
//SPDX-License-Identifier: LGPL-3.0-only

//Solidity

pragma solidity 0.8.26;

// Contract

contract Result{

    // Variables

    uint256 public result;

    //Functions

    function setResult(uint256 num_) external {

        result = num_;

    }

}