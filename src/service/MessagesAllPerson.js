const { MessagesRepository } = require("../repository/MessagesRepository");

class MessagesAllPerson {
  async handle(myId, otherPeploe) {
    const messages = await MessagesRepository.listMessagesOnePerson(myId, otherPeploe);

    return messages;
  }
}

module.exports = { MessagesAllPerson };
