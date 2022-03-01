//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.5;

interface Interface {
    function alert(uint, bool) external;
}

contract Sidekick {
    function sendAlert(address hero, uint enemies, bool armed) external {
        Interface(hero).alert(enemies, armed);// TODO: alert the hero! 
    }
}

contract Hero {
    Ambush public ambush;

    struct Ambush {
        bool alerted;
        uint enemies;
        bool armed;
    }

    function alert(uint enemies, bool armed) external {
        ambush = Ambush(true, enemies, armed);
    }
}
