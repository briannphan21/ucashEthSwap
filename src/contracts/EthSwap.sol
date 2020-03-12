pragma solidity ^0.5.0;

import "./Token.sol";

contract EthSwap {
    string public name = "UCASH-ETH Instant Exchange";
    Token public token;
    uint256 public rate = 100;

    event TokenPurchased(
        address account,
        address token,
        uint256 amount,
        uint256 rate
    );

    constructor(Token _token) public {
        token = _token;
    }

    function buyTokens() public payable {
        // Calculate the number of tokens to buy
        uint256 tokenAmount = msg.value * rate;
        //Require that ethSwap has enough tokens
        require(token.balanceOf(address(this)) >= tokenAmount);
        // Transfer token to user
        token.transfer(msg.sender, tokenAmount);

        // Emit an event
        emit TokenPurchased(msg.sender, address(token), tokenAmount, rate);
    }

}
