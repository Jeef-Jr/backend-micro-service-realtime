const { FindPersonMessage } = require("../service/FindPersonMessage");
const {
  ListNotification,
} = require("../service/notification/ListNotification");

module.exports = async (params, callback) => {
  const { idUser } = params;

  const notifications = await new ListNotification().handle(idUser);

  let prevNotifications = [];

  for (const notify of notifications) {
    const response = notify.dataValues;
    const id = response.idSender;
    const { nome, img } = await new FindPersonMessage().handle(id);

    const dados = {
      type: "GROUP",
      id: response.id,
      nomeSender: nome,
      imgSender: img,
      idReceiver: idUser,
      title: response.title,
      description: response.description,
      img: response.img,
      isVisualizado: response.isVisualizado,
      isAcepty: response.isAcepty,
    };

    prevNotifications.push(dados);
  }

  callback(prevNotifications);
};
