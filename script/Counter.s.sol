// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Vm} from "forge-std/Vm.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {

    uint256 constant PRIVATE_KEY = uint256(bytes32(0xdcad7272912112bb9a52c3d140cd975f19ec66623e1bfcac27f9d6a5071a3c15));
    address constant SENDER = 0x8D726E3092E7F92234f8463e8Bf3ddFde7d89341;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(PRIVATE_KEY);

        Counter counter = new Counter();

        vm.stopBroadcast();

        Vm.SignedDelegation memory signedDelegation = vm.signAndAttachDelegation(address(counter), PRIVATE_KEY);

        vm.startBroadcast(PRIVATE_KEY);
        
        Counter(SENDER).increment();

        vm.stopBroadcast();
    }
}
