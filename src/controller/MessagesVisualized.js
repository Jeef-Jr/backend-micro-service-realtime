const { AttMessagesVisualizedService } = require("../service/AttMessagesVisualizedService");
const { ListMessagesPendentService } = require("../service/ListMessagesPendentService");
const { ListMessagesRecentesService } = require("../service/ListMessagesRecentesService");

module.exports = async (params, callback) => {
  const { idFriend, myId } = params;

  await new AttMessagesVisualizedService().handle(idFriend, myId);

  const listConversationsRecentes =
    await new ListMessagesRecentesService().handle(myId);

  let messagePedentes = [];

  for (const element of listConversationsRecentes) {
    const pendentes = await new ListMessagesPendentService().handle(
      element.idFriend,
      myId
    );

    // Verifica se cada objeto individual em pendentes já está presente na lista
    for (const p of pendentes) {
      if (!messagePedentes.includes(p)) {
        messagePedentes.push(p);
      }
    }
  }


  callback(messagePedentes);
};
