const { FindOneFriend } = require("../service/FindOneFriend");
const { FindPersonMessage } = require("../service/FindPersonMessage");
const {
  ListMessagesPendentService,
} = require("../service/ListMessagesPendentService");
const {
  ListMessagesRecentesService,
} = require("../service/ListMessagesRecentesService");
const { SendMessage } = require("../service/SendMessage");

module.exports = async (params, callback) => {
  const { idSender, idReceiver, message } = params;

  const idFriend = await new FindOneFriend().handle(idSender, idReceiver);

  const idF = idFriend[0].id;

  const newMessage = await new SendMessage().handle(
    idSender,
    idReceiver,
    idF,
    message
  );
  const { socketId } = await new FindPersonMessage().handle(idReceiver);

  const listConversationsRecentes =
    await new ListMessagesRecentesService().handle(idSender);
  const listConversationsRecentesReceiver =
    await new ListMessagesRecentesService().handle(idReceiver);

  let messagePedentes = [];

  for (const element of listConversationsRecentesReceiver) {
    const pendentes = await new ListMessagesPendentService().handle(
      element.idFriend,
      idReceiver
    );

    // Verifica se cada objeto individual em pendentes já está presente na lista
    for (const p of pendentes) {
      if (!messagePedentes.includes(p)) {
        messagePedentes.push(p);
      }
    }
  }

  if (socketId !== null && socketId.length > 0) {
    console.log("enviar mensagem para", socketId);
    global.socketIO.to(socketId).emit("newMessage", {
      dados: newMessage,
      listRecentes: listConversationsRecentesReceiver,
      messagePedentes: messagePedentes,
    });
  }

  callback(newMessage, listConversationsRecentes);
};
