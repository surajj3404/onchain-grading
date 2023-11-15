// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GradeStorage {
    //this get initialized to zero
    //this is by default of type storage it stoes the data permanently
    //adding somenumber to test how it works on type int
    uint256 public someNumber;

    //creating a mapping for course to cg
    mapping(string => uint256) public courseToCg;

    //creating a schema for the drades
    struct Grade {
        string course;
        uint256 cg; //ik cg isnt for a grade, but it is what it is
    }

    //creating an array of objects which are of type grade
    Grade[] public grades;

    function store(uint256 _someNumber) public virtual {
        someNumber = _someNumber;
    }

    //call data and memory only stores the data for a very little amount of time
    //the only diff here is that the memory gives us the permission to modify the data
    //and calldata doesnt
    //note that the data location type can only
    //be specified for the string(array of bytes), struct, arrray and mapping data types
    function addGrade(string memory _course, uint256 _cg) public {
        grades.push(Grade(_course, _cg));
        courseToCg[_course] = _cg;
    }

    //note that this function os of type view
    //that means that this will not consume any gas
    //also note that gas will apply when it is called inside a contract
    function getSomeNumber() public view returns (uint256) {
        return someNumber;
    }

    function getGrade(
        uint256 _index
    ) public view returns (string memory, uint256) {
        return (grades[_index].course, grades[_index].cg);
    }
}

// my smart contact address 0xd9145CCE52D386f254917e481eB44e9943F39138
