contract ScientificArticle {

    address public author;
    int public score;
    mapping(address => bool) public hasReviewed;

    modifier onlyAuthor() {
        require(msg.sender == author, "Only the author can call this function");
        _;
    }

    function publish() public {
        author = msg.sender;
    }

    function review(bool isPositive) public {
        require(!hasReviewed[msg.sender], "User has already reviewed");
        hasReviewed[msg.sender] = true;

        if (isPositive) {
            score++;
        } else {
            score--;
        }
    }

    function remove() public onlyAuthor {
        require(score <= 0, "Score must be negative to remove the article");
        // Additional logic for removing the article from the blockchain
    }
}
