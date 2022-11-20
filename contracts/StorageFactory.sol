// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; // anything in the 8 range

import "./SimpleStorage.sol";

// is type 'SimpleStorage' contract inherits all the functions from 'SimpleStorage' --> can access w/o explicit code in contract
contract StorageFactory is SimpleStorage {
    
    SimpleStorage[] public sStorageArray;
    
    function createSimpleStorageContract() public { 
        SimpleStorage sStorage = new SimpleStorage(); // {variable type} {variable name} = new SimpleStorage contract w/ no input params
        sStorageArray.push(sStorage); // appends sStorage to the array
    }

    // index is used to select contract from sStorageArray
    // # is used in place of '_favoriteNumber' from the 'store' function in the 'SimpleStorage.sol' file
    function sfStore (uint256 _sStorageIndex, uint256 _sStorageNumber) public {
        // return index of array, convert to address, return sStorage contract for that address
        SimpleStorage sStorage = SimpleStorage(address(sStorageArray[_sStorageIndex])); 
        sStorage.store(_sStorageNumber); // using 'store' function from 'SimpleStorage.sol' file
    }

    // able to return the # inputted from the 'sfStore' function
    // just reading state so 'public view' function
    function sfGet(uint256 _sStorageIndex) public view returns (uint256) {
        return SimpleStorage(address(sStorageArray[_sStorageIndex])).retrieve(); // using 'retrieve' function from 'SimpleStorage.sol' file 
    }
}
