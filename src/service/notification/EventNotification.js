const {
  NotificationRepository,
} = require("../../repository/NotificationRepository");

class EventNotification {
  async acepty(id) {
    await NotificationRepository.upsert({
      id: id,
      isAcepty: true,
    });
  }

  async remove(id) {
    await NotificationRepository.destroy({
        where: {
            id: id
        }
    })
  }
}

module.exports = { EventNotification };
