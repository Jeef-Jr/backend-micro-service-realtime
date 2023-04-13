const { FindPersonMessage } = require("../service/FindPersonMessage");
const {
  ListNotification,
} = require("../service/notification/ListNotification");

module.exports = async (params, callback) => {
  const { idUser } = params;

  const notifications = await new ListNotification().handle(idUser);

  let prevNotifications = [];

  for (const notify of notifications) {
    const id = notify.idSender;
    const { nome, img } = await new FindPersonMessage().handle(idUser);

    const dados = {
      type: "GROUP",
      id: notify.id,
      nomeSender: nome,
      imgSender: img,
      idReceiver: idUser,
      title: notify.title,
      description: notify.description,
      img: notify.img,
      isVisualizado: notify.isVisualizado,
      isAcepty: notify.isAcepty,
    };

    prevNotifications.push(dados);
  }

  callback(prevNotifications);
};
