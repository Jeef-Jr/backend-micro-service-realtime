const { MessagesRepository } = require("../repository/MessagesRepository");

class ListMessagesPendentService {
  async handle(idFriend, myId) {
    const messagesPedente = await MessagesRepository.listQtdMessagesPedente(
      idFriend,
      myId
    );

    return messagesPedente;
  }
}

module.exports = { ListMessagesPendentService };
