// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "../src/Books.sol"; // Path to your Books contract
import "forge-std/Script.sol"; // Import Foundry Script functionality

contract UpdateBookScript is Script {
    function run() public {
        // Deploy the contract
        Books books = new Books("Programming Foundry", "Khushil", 100);

        // Simulate the deployment
        vm.startBroadcast(); // Start broadcasting to the blockchain
        books.update_pages(250); // Update book pages to 250
        vm.stopBroadcast(); // End broadcasting to the blockchain

        // Log the updated book details
        Books.Book memory updatedBook = books.get_book();
        console.log("Updated Book Title:", updatedBook.title);
        console.log("Updated Book Author:", updatedBook.author);
        console.log("Updated Book Pages:", updatedBook.pages);
    }
}
