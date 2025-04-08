// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "forge-std/Test.sol"; // Ensure you have foundry-rs/forge-std installed
import "../src/Books.sol"; // Adjust path if needed

contract BooksTest is Test {
    Books public books;

    // The address of the deployer (owner)
    address owner;

    // Set up the initial book for each test
    function setUp() public {
        owner = address(this); // Use the contract deployer as the owner
        books = new Books("Programming Foundry", "Khushil", 100);
    }

    // Test the get_book function
    function test_get_book() public view {
        Books.Book memory retrievedBook = books.get_book();
        assertEq(retrievedBook.title, "Programming Foundry");
        assertEq(retrievedBook.author, "Khushil");
        assertEq(retrievedBook.pages, 100);
    }

    // Test the update_pages function by the owner
    function test_updatePages() public {
        // Updating pages to 200
        books.update_pages(200);
        Books.Book memory retrievedBook = books.get_book();
        assertEq(retrievedBook.pages, 200);
    }

    // Test the update_pages function by a non-owner (should revert)
    function test_updatePagesAsNonOwner() public {
        address nonOwner = address(0x123);
        vm.prank(nonOwner); // Pretend the sender is a non-owner
        vm.expectRevert("You are not the Owner");
        books.update_pages(300); // This should revert
    }
}
