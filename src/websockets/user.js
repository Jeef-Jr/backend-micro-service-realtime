// socketIO.to(globalOnline[0]).emit("message", "mensagem para você!");

const AttStateMessageActive = require("../controller/AttStateMessageActive");
const ConviteConexao = require("../controller/ConviteConexao");
const EventConexao = require("../controller/EventConexao");
const FetchAllListPerson = require("../controller/FetchAllListPerson");
const ListMessagesPerson = require("../controller/ListMessagesPerson");
const ListNotification = require("../controller/ListNotification");
const MessagesVisualized = require("../controller/MessagesVisualized");
const MyInformation = require("../controller/MyInformation");
const NewGroup = require("../controller/NewGroup");
const NewsConexaoes = require("../controller/NewsConexaoes");
const NotificationVisualized = require("../controller/NotificationVisualized");
const SendMessage = require("../controller/SendMessage");
const UpdateSocketId = require("../controller/UpdateSocketId");
const UsersAll = require("../controller/UsersAll");

module.exports = () => {
  global.socketIO.on("connect", (socket) => {
    socket.on("updateSocketId", async (params, callback) => {
      await UpdateSocketId(socket, params, callback);
    });

    socket.on("allFriends", UsersAll);

    socket.on("listMessagesPerson", ListMessagesPerson);

    socket.on("sendMessage", SendMessage);

    socket.on("messagesVisualized", MessagesVisualized);

    socket.on("atualizarStateMessageActive", AttStateMessageActive);

    socket.on("newGroup", NewGroup);

    socket.on("listAllNotifications", ListNotification);

    socket.on("updateNotifyVisualized", NotificationVisualized);

    socket.on("myInformation", MyInformation);
    
    socket.on("eventConexao", EventConexao);

    socket.on("fetchAllListPersons", FetchAllListPerson);

    socket.on("conviteConexao", ConviteConexao);

    socket.on("newConexao", NewsConexaoes);
  });
};
