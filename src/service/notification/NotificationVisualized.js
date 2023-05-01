const {
  NotificationRepository,
} = require("../../repository/NotificationRepository");

class NotificationVisualized {
  async handle(idReceiver) {
    await NotificationRepository.update(
      {
        isVisualizado: true,
      },
      {
        where: { idReceiver: idReceiver },
      }
    );
  }
}

module.exports = {
  NotificationVisualized,
};
