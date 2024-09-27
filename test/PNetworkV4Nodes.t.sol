// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PNetworkV4Nodes} from "../src/PNetworkV4Nodes.sol";

contract PNetworkV4NodesTest is Test {
    PNetworkV4Nodes public pnetworkNodes;
    address public deployer = vm.addr(1);
    address public node = vm.addr(2);
    string url = "https://hello-pnetwork-v4.wow";

    function setUp() public {
        vm.prank(deployer);
        pnetworkNodes = new PNetworkV4Nodes();
    }

    function test_setEndpoint() public {
        assertEq(pnetworkNodes.endpoints(node), "");

        vm.prank(node);
        pnetworkNodes.setEndpoint(url);

        assertEq(pnetworkNodes.endpoints(node), url);
    }

    function test_removeEndpoint() public {
        vm.startPrank(node);
        pnetworkNodes.setEndpoint(url);

        pnetworkNodes.removeEndpoint();

        assertEq(pnetworkNodes.endpoints(node), "");
        vm.stopPrank();
    }
}
