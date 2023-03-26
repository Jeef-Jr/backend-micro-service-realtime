const { FindAllFriends } = require("../service/FindAllFriends");
const { FindPersonMessage } = require("../service/FindPersonMessage");
const {
  ListMessagesPendentService,
} = require("../service/ListMessagesPendentService");
const {
  ListMessagesRecentesService,
} = require("../service/ListMessagesRecentesService");

module.exports = async (params, callback) => {
  const { idUser } = params;

  const friends = await new FindAllFriends().handle(idUser);

  const listConversationsRecentes =
    await new ListMessagesRecentesService().handle(idUser);

  let messagePedentes = [];

  for (const element of listConversationsRecentes) {
    const pendentes = await new ListMessagesPendentService().handle(
      element.idFriend,
      idUser
    );

    // Verifica se cada objeto individual em pendentes já está presente na lista
    for (const p of pendentes) {
      if (!messagePedentes.includes(p)) {
        messagePedentes.push(p);
      }
    }
  }

  callback(friends, listConversationsRecentes, messagePedentes);
};
