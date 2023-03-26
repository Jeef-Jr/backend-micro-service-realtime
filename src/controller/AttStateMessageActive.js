const { FindPersonMessage } = require("../service/FindPersonMessage");
const { MessagesAllPerson } = require("../service/MessagesAllPerson");

module.exports = async (params) => {
  const { idFriend, myId, idSender } = params;

  const messages = await new MessagesAllPerson().handle(myId, idSender);


  const { socketId } = await new FindPersonMessage().handle(idSender);

  if (socketId.length > 0) {
    global.socketIO.to(socketId).emit("atualizandoState", { messages, idReciver: myId });
  }

};
