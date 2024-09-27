// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PNetworkV4Nodes {
    mapping(address => string) public endpoints;

    function setEndpoint(string memory endpoint) public {
        endpoints[msg.sender] = endpoint;
    }

    function removeEndpoint() public {
        endpoints[msg.sender] = "";
    }
}
