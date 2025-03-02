# Smart Contract Connection Project

## 📝 Overview
This project demonstrates the interaction between two smart contracts, `Adder.sol` and `Result.sol`, through an interface `IResult.sol`. The `Adder` contract performs arithmetic operations and updates the result in the `Result` contract using the interface.

## 🚀 Features

| Feature | Description |
|---------|-------------|
| Smart Contract Interaction | Demonstrates communication between smart contracts via an interface. |
| Arithmetic Operations | Provides addition and multiplication functionalities. |
| Access Control | Restricts certain functions to the contract owner or feeAdmin. |
| External Calls | Uses an external contract (`Result.sol`) to store operation results and change the fee. |

## 📜 Contract Details

### ⚙️ Contracts & Inheritance

#### **Result.sol**
- Stores the result of arithmetic operations.
- Provides a `setResult` function to update the stored result.
- Change fee if the original caller is feeAdmin

#### **Adder.sol**
- Performs addition and multiplication.
- Calls `setResult` on the `Result` contract to store computed values.
- Calls `setFee` on the `Result` contract to change the fee using access control.
- Implements an access control modifier (`onlyMod`) restricting multiplication to the contract owner.
- Implements fee checker modifier (`feeLimit`) restricting fee value between 1 and 100.

#### **IResult.sol** (Interface)
- Defines `setResult(uint256 num_)` function to be implemented by `Result.sol`.
- Defines `setFee(uint256 newFee_)` function to be implemented by `Result.sol`.

### 📡 Key Functions

#### **Result.sol**
| Function | Description |
|----------|-------------|
| setResult(uint256 num_) | Updates the stored result with the given number. |
| setFee(uint256 newFee_) | Updates the fee with the given number. |

#### **Adder.sol**
| Function | Description |
|----------|-------------|
| addNumbers(uint256 num1_, uint256 num2_) | Adds two numbers and stores the result in `Result.sol`. |
| multiplyNumbers(uint256 num1_, uint256 num2_) | Multiplies two numbers and stores the result in `Result.sol`. Restricted to the contract owner. |
| setFee(uint256 newFee_) | Updates the fee with the given number via `Result.sol` checking fee number previously. |

## 🛠️ How to Use

### 🔧 Prerequisites
- Solidity version: 0.8.26
- Remix IDE or any compatible Solidity development environment
- A blockchain development environment (e.g., Hardhat, Foundry, or Truffle)

### 🚀 Deployment Steps
1. Open Remix IDE.
2. Create three files: `Result.sol`, `Adder.sol`, and `IResult.sol`.
3. Copy and paste the corresponding contract codes into their respective files.
4. Compile all contracts using Solidity 0.8.26.
5. Deploy `Result.sol` first to obtain its contract address.
6. Deploy `Adder.sol`, passing the deployed `Result.sol` contract address to its constructor.

### 🖱️ Interacting with the Contracts
1. **Set Result:** `setResult(uint256 num_)` (Only for `Result.sol`, but called externally by `Adder.sol`).
2. **Addition:** `addNumbers(uint256 num1_, uint256 num2_)` to store the sum in `Result.sol`.
3. **Multiplication:** `multiplyNumbers(uint256 num1_, uint256 num2_)` (Restricted to owner) to store the product in `Result.sol`.
4. **SetFee** `setFee(uint256 newFee_)` (Restricted to feeAdmin) to change the fee.
5. **Check Stored Result:** Call `result()` on `Result.sol` to get the stored value.

## 📄 License
This project is licensed under LGPL-3.0-only. Refer to the contract headers or the GNU Lesser General Public License documentation for more details.
