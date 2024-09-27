// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PNetworkV4Nodes} from "../src/PNetworkV4Nodes.sol";

contract PNetworkV4NodesScript is Script {
    function setEndpoint(address pnetwork, string memory endpoint) public {
        vm.startBroadcast(msg.sender);
        PNetworkV4Nodes(pnetwork).setEndpoint(endpoint);
        vm.stopBroadcast();
    }

    function removeEndpoint(address pnetwork) public {
        vm.broadcast();
        PNetworkV4Nodes(pnetwork).removeEndpoint();
    }

    function getEndpoint(address pnetwork) public {
        vm.startBroadcast();
        string memory endpoint = PNetworkV4Nodes(pnetwork).endpoints(msg.sender);
        console.log("Node:", msg.sender);
        console.log("Endpoint:", endpoint);
    }

    function getEndpoint(address pnetwork, address node) public {
        vm.startBroadcast();
        string memory endpoint = PNetworkV4Nodes(pnetwork).endpoints(node);
        console.log("Node:", node);
        console.log("Endpoint:", endpoint);
    }
}
