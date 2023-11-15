// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;  
import "./GradeStorage.sol";

contract StorageFactory {
    GradeStorage[] public GradeStorageArray;

    function createGradeStorageContract() public {
        GradeStorage gradeStorage = new GradeStorage();
        GradeStorageArray.push(gradeStorage);
    }

    function sfStore(uint256 _GradeStorageindex, string memory _course, uint256 _cg) public {
        GradeStorageArray[_GradeStorageindex].addGrade(_course, _cg);
    }

    function sfGetGrade(uint256 _GradeStorageindex, string memory _course) view public returns(uint256) {
        return GradeStorageArray[_GradeStorageindex].courseToCg(_course);
    }
}