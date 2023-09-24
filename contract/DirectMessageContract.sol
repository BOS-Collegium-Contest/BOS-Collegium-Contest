// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DirectMessageContract {
    struct Message {
        address sender;
        string receiver;
        string content;
        uint256 timestamp;
    }

    mapping(address => Message[]) public inbox;

    event MessageSent(address indexed sender, string indexed receiver, string content);

    function sendMessage(string memory receiver, string memory content) public {
        require(bytes(receiver).length > 0, "Receiver address cannot be empty");
        require(msg.sender != address(0), "Invalid sender address");
        inbox[msg.sender].push(Message(msg.sender, receiver, content, block.timestamp));
        emit MessageSent(msg.sender, receiver, content);
    }

    function getInboxCount(address user) public view returns (uint256) {
        return inbox[user].length;
    }

    function getMessage(address user, uint256 index) public view returns (string memory, string memory, uint256) {
        require(index < inbox[user].length, "Message index out of bounds");
        Message memory message = inbox[user][index];
        return (message.receiver, message.content, message.timestamp);
    }
}
