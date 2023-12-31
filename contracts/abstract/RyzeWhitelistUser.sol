// SPDX-License-Identifier: BUSL-1.1

pragma solidity 0.8.19;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

import "../RyzeWhitelist.sol";

abstract contract RyzeWhitelistUser is Initializable {
    address public whitelist;

    error Unauthorized();

    // solhint-disable-next-line func-name-mixedcase
    function __WhitelistUser_init(address _whitelist) internal onlyInitializing {
        whitelist = _whitelist;
    }

    modifier onlyWhitelisted() {
        if (!RyzeWhitelist(whitelist).isWhitelisted(msg.sender))
            revert Unauthorized();

        _;
    }
}
