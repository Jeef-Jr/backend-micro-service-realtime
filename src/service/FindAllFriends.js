const { FriendsRepository } = require("../repository/FriendsRepository");

class FindAllFriends {
  async handle(idUser) {
    const friends = await FriendsRepository.listAllFriends(idUser);

    return friends;
  }
}

module.exports = { FindAllFriends };
