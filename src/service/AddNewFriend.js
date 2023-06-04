const { FriendsRepository } = require("../repository/FriendsRepository");

class AddNewFriend {
  async handle(idSender, idReceiver) {
    await FriendsRepository.create({
      idSender: idSender,
      idReceiver: idReceiver,
      active: true,
    });
  }
}

module.exports = { AddNewFriend };
