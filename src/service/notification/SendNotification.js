const {
  NotificationRepository,
} = require("../../repository/NotificationRepository");

class SendNotification {
  async handle(dados) {
    const newNotification = await NotificationRepository.create({
      type: dados.type,
      idSender: dados.idSender,
      idReceiver: dados.idReceiver,
      title: dados.title,
      description: dados.description,
      img: dados.img,
      isVisualizado: dados.isVisualizado,
      isAcepty: dados.isAcepty,
    });

    return newNotification;
  }
}

module.exports = { SendNotification };
