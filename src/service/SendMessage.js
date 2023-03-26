const { MessagesRepository } = require("../repository/MessagesRepository");


class SendMessage {
    async handle(idSender, idReceiver, idFriend, message){
        
        const newMessage = await MessagesRepository.create({
            idSender,
            idReceiver,
            idFriend,
            message
        })

        return newMessage;
    }

}

module.exports = { SendMessage };