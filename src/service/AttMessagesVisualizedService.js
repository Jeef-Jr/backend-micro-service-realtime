const { MessagesRepository } = require("../repository/MessagesRepository");


class AttMessagesVisualizedService {

    async handle(idFriend, myId){

        const att = await MessagesRepository.attMessagesVisualized(idFriend, myId);

        return att;

    }

}

module.exports = {AttMessagesVisualizedService}
