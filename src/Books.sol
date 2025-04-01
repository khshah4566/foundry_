// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract Books {
    address owner;

    struct Book {
        string title;
        string author;
        uint256 pages;
    }

    Book public book;

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the Owner");
        _;
    }

    // Constructor to initialize the book details and owner
    constructor(string memory _title, string memory _author, uint256 _pages) {
        book.title = _title;
        book.author = _author;
        book.pages = _pages;
        owner = msg.sender;
    }

    // Function to update the pages, accessible only by the owner
    function update_pages(uint256 _pages) public onlyOwner {
        book.pages = _pages;
    }

    // Function to retrieve the book details
    function get_book() public view returns (Book memory) {
        return book;
    }
}
