// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Script.sol";
import "../src/Books.sol";

contract UpdateBookScript is Script {
    function run() public {
        vm.startBroadcast(); // Start broadcasting to simulate deployment

        // Deploy the contract with initial values
        Books books = new Books("Programming Foundry", "Khushil", 100);

        // Update book pages to 250
        books.update_pages(250);

        vm.stopBroadcast(); // End the broadcast

        // Log the updated book details
        Books.Book memory updatedBook = books.get_book();
        console.log("Updated Book Title: ", updatedBook.title);
        console.log("Updated Book Author: ", updatedBook.author);
        console.log("Updated Book Pages: ", updatedBook.pages);
    }
}
