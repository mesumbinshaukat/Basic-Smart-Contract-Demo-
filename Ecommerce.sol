// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Ecommerce {
    uint constant DECIMALS_FACTOR = 100; // Factor to support 2 decimal places
    uint minBudget;
    uint maxBudget;
    uint accountBalance;
    string[3] products;

    constructor () public 
    {
        minBudget = 500 * DECIMALS_FACTOR; // Set minBudget with decimal support
        maxBudget = 250000 * DECIMALS_FACTOR; // Set maxBudget with decimal support
        accountBalance = 0;
    }

    function checkBalance() view public returns (uint) {
        return accountBalance / DECIMALS_FACTOR; // Return balance with decimal places
    }

    function depositAmount(uint dep) public returns (uint bal, string memory err) {
        if (accountBalance + dep * DECIMALS_FACTOR <= maxBudget) { // Adjusted for decimal support
            accountBalance += dep * DECIMALS_FACTOR; // Adjusted for decimal support
            return (accountBalance / DECIMALS_FACTOR, ""); // Return balance with decimal places
        } else {
            err = "You're trying to deposit more than max value";
            return (accountBalance / DECIMALS_FACTOR, err); // Return balance with decimal places
        }
    }
    
    function checkAccountLimit () view public returns (uint){
        return (maxBudget - accountBalance) / DECIMALS_FACTOR; // Return limit with decimal places
    }

    function productList(string memory p1, string memory p2, string memory p3) public {
        products = [p1, p2, p3];
    }

    function displayProducts() public view returns (string memory){
        uint len = products.length;
        string memory allProducts;
        for (uint i = 0; i < len; i++) 
        {
            allProducts = string(abi.encodePacked(allProducts, products[i], " | "));       
        }
        return allProducts;
    }
}
