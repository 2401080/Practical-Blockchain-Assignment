// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EditableData {
    int256 public number;
    string public text;
    address public owner;

    event DataUpdated(int256 newNumber, string newText);

    constructor(int256 _number, string memory _text) {
        number = _number;
        text = _text;
        owner = msg.sender;
    }

    function updateData(int256 _newNumber, string memory _newText) public {
        require(msg.sender == owner, "Only the owner can update the data.");
        number = _newNumber;
        text = _newText;
        emit DataUpdated(_newNumber, _newText);
    }
}