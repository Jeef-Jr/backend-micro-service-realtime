const {
  NotificationRepository,
} = require("../../repository/NotificationRepository");

class NotificationVisualized {
  async handle(idNotify) {
    await NotificationRepository.update(
      {
        isVisualizado: true,
      },
      {
        where: { id: idNotify },
      }
    );
  }
}

module.exports = {
  NotificationVisualized,
};
