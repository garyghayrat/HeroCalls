//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.5;

contract Storage {
    address headquarters;

    Ambush public ambush;

    struct Ambush {
        bool alerted;
        uint256 enemies;
        bool armed;
    }
}

contract Sidekick is Storage {
    address behavior;

    constructor(address _headquarters, address _behavior) {
        headquarters = _headquarters;
        behavior = _behavior;
    }

    function alert(uint256 enemies, bool armed) external {
//      require(msg.sender == headquarters);
        // TODO: use the behavior's recordAmbush to store the ambush
        bytes memory args = abi.encodeWithSignature("recordAmbush(uint256,bool)", enemies, armed);
        (bool success, ) = behavior.delegatecall(args);
        require(success);
    }
}

contract Behavior is Storage {
    function recordAmbush(uint256 enemies, bool armed) external {
        // TODO: ensure that only headquarters can send this message, otherwise revert
        require(msg.sender == headquarters);
        ambush = Ambush(true, enemies, armed);
    }
}
