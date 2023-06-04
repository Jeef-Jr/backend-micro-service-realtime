const { AddNewFriend } = require("../service/AddNewFriend");
const {
  EventNotification,
} = require("../service/notification/EventNotification");

module.exports = async (params, callback) => {
  const { idNotification, idReceiver, idSender, isAccpty } = params;

  if (isAccpty) {
    await new EventNotification().acepty(idNotification);
    await new AddNewFriend().handle(idSender, idReceiver);
  } else {
    await new EventNotification().remove(idNotification);
  }
};
