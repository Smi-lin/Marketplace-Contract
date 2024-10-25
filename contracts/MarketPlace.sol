// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.27;

contract MarketPlace {
    address public owner;
    address public buyer;

    enum ItemStatus {
        None,
        Created,
        Pending,
        Sold
    }

    struct Item {
        string name;
        uint16 price;
        ItemStatus status;
    }

    Item[] public items;
    mapping(uint256 => bool) public isSoldOut;

    event ItemListed(string indexed name, uint16 price);
    event ItemSold(string indexed name, uint16 price, address buyer);

    constructor() {
        owner = msg.sender;
    }

    function listItem(string memory _name, uint16 _price) external {
        require(msg.sender != address(0), "Zero address is not allowed");

        Item memory newItem;
        newItem.name = _name;
        newItem.price = _price;
        newItem.status = ItemStatus.Created;

        items.push(newItem);

        emit ItemListed(_name, _price);
    }

    function purchaseItem(uint8 _index) external {
        require(msg.sender != address(0), "Zero address is not allowed");
        require(_index < items.length, "Out of bound!");
        require(!isSoldOut[_index], "Item already sold out");

        
        items[_index].status = ItemStatus.Sold;
        isSoldOut[_index] = true;
        buyer = msg.sender;

        emit ItemSold(items[_index].name, items[_index].price, msg.sender);
    }
}