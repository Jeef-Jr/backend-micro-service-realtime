// socketIO.to(globalOnline[0]).emit("message", "mensagem para você!");

const AttStateMessageActive = require("../controller/AttStateMessageActive");
const EventGroup = require("../controller/EventGroup");
const ListMessagesPerson = require("../controller/ListMessagesPerson");
const ListNotification = require("../controller/ListNotification");
const MessagesVisualized = require("../controller/MessagesVisualized");
const MyInformation = require("../controller/MyInformation");
const NewGroup = require("../controller/NewGroup");
const NotificationVisualized = require("../controller/NotificationVisualized");
const SendMessage = require("../controller/SendMessage");
const UpdateSocketId = require("../controller/UpdateSocketId");
const UsersAll = require("../controller/UsersAll");

module.exports = () => {
  global.socketIO.on("connect", socket => {
    socket.on("updateSocketId", async (params, callback) => {
      await UpdateSocketId(socket, params, callback);
    });

    socket.on("allFriends", UsersAll);

    socket.on("listMessagesPerson", ListMessagesPerson);

    socket.on("sendMessage", SendMessage);

    socket.on("messagesVisualized", MessagesVisualized);

    socket.on("atualizarStateMessageActive", AttStateMessageActive);

    socket.on("newGroup", NewGroup);

    socket.on("eventGroup", EventGroup);

    socket.on("listAllNotifications", ListNotification);

    socket.on("updateNotifyVisualized", NotificationVisualized);

    socket.on("myInformation", MyInformation);
  });
};
