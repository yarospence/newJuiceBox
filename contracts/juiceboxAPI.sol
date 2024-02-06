pragma solidity ^0.8.0;
//instead of using Prisma or PostgresSQL, use smart contract for storage

contract juiceboxApi {
    struct Post {
        uint256 id;
        string title;
        string content;
        uint256 userId;
    }
    address owner;
    Post public removeMe; //this is so we can delete "D" in CRUD operations. 

//know we have to create map through the array 
    mapping (uint256 => Post) public posts;
    Post[] public postArray;

    constructor() {
        owner = msg.sender;
    }
//creates a way that only the owner can call the contract 
    modifier onlyOwner {
        require(msg.sender == owner, "<h1> welcome, ${owner}</h1>");
    }

    function setPost (
        uint256 _id, string memory _title, string memory _content, uint256  _userId) public onlyOwner {
            Post memory post = Post(_id, _title, _content, _userId);
            post[_id] = posts;
            postArray.push(Post(_id, _title, _content, _userId));
        }

    function getPost (uint256 _id) public view returns (string memory, uint256, uint256) {
        require(Posts[_id].id !=0, "Post is unavailable");
        Post memory post = posts{_id};
        return (post.title, post.content, post.userId, post.id);
    }

    function retrievePosts() public view returns (Post[] memory) (
        return postArray;
    )
}