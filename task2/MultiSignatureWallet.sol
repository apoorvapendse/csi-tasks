// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// TASK 2 - Apoorva Pendse
//This smart contract helps create transactions that have to be validated by a minimum number of owners that are set during contract deployment
//Useful for collaborating on transactions among organizations in a trustless fashion
//makes use of structs, payable functions, require statements, modifiers and other solidity fundamentals
contract MultiSignatureWallet {
    address[] public walletOwners;
    uint public minimumValidators;

    constructor(address[] memory _walletOwners, uint _validatorCount) {
        require(
            _walletOwners.length > 0,
            "Require at least one owner for the wallet"
        );
        require(
            _validatorCount <= _walletOwners.length,
            "Required validator count is more than the quantity of wallet owners"
        );
        minimumValidators = _validatorCount;
        walletOwners = _walletOwners;
    }

    struct Transaction {
        address to;
        uint value;
        uint validations;
        bool executed;
    }

    modifier checkOwner() {
        bool verified = false;
        for (uint i = 0; i < walletOwners.length; i++) {
            if (msg.sender == walletOwners[i]) {
                verified = true;
                break; // Add this break statement to exit the loop
            }
        }
        require(
            verified == true,
            "Only wallet owners can initiate transactions"
        );
        _;
    }

    // Creating an array of Transaction type
    Transaction[] public transactions;

    function createTransaction(
        address _to,
        uint256 _value
    ) external payable checkOwner {
        require(
            _value <= address(this).balance,
            "Insufficient balance in the wallet"
        );

        Transaction memory newTransaction = Transaction({
            executed: false,
            value: _value,
            validations: 0,
            to: _to
        });

        transactions.push(newTransaction);
    }

    function validateTransaction(uint _txIndex) external checkOwner {
        require(
            _txIndex < transactions.length,
            "Given transaction does not exist"
        );
        require(
            transactions[_txIndex].executed == false,
            "Given transaction is already executed"
        );
        transactions[_txIndex].validations++;

        if (transactions[_txIndex].validations == minimumValidators) {
            executeTxn(_txIndex);
        }
    }

    function executeTxn(uint _txIndex) internal {
        Transaction memory transaction = transactions[_txIndex];
        bool success = payable(transaction.to).send(transaction.value);

        if (success) {
            transactions[_txIndex].executed = true;
        }
    }
}
