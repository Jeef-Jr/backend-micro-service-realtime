const { MessagesRepository } = require("../repository/MessagesRepository");

class ListMessagesRecentesService {

    async handle(idUser){

        const messages = await MessagesRepository.listMessagesRecentes(idUser);

        return messages;

    }



}

module.exports = { ListMessagesRecentesService };
