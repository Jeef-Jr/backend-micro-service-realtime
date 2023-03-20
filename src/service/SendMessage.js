const { MessagesRepository } = require("../repository/MessagesRepository");


class SendMessage {
    async handle(idSender, idReceiver, message){
        
        const newMessage = await MessagesRepository.create({
            idSender,
            idReceiver,
            message
        })

        return newMessage;
    }

}

module.exports = { SendMessage };