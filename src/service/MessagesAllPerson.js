const { MessagesRepository } = require("../repository/MessagesRepository");

class MessagesAllPerson {
  async handle(id) {
    const messages = await MessagesRepository.listMessagesOnePerson(id);

    return messages;
  }
}

module.exports = { MessagesAllPerson };
