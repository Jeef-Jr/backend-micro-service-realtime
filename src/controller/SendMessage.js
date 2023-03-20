const { FindPersonMessage } = require("../service/FindPersonMessage");
const { SendMessage } = require("../service/SendMessage");


module.exports = async (params, callback) => {

    const { idSender, idReceiver, message } = params;

    const newMessage = await new SendMessage().handle(idSender, idReceiver, message);

    const {socketId} = await new FindPersonMessage().handle(idReceiver);

    if(socketId.length > 0){
        console.log('enviar mensagem para', socketId);
        global.socketIO.to(socketId).emit("newMessage", newMessage);
    }

    callback(newMessage)



}