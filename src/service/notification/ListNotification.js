const { NotificationRepository } = require("../../repository/NotificationRepository");

class ListNotification {
  async handle(idUser) {
    const notifications = await NotificationRepository.findAll({
      where: { idReceiver: idUser },
      order: [
        ['createdAt', 'DESC']
      ]
    });

    return notifications;
  }
}

module.exports = { ListNotification };
