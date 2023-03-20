// socketIO.to(globalOnline[0]).emit("message", "mensagem para você!");

const ListMessagesPerson = require("../controller/ListMessagesPerson");
const SendMessage = require("../controller/SendMessage");
const UpdateSocketId = require("../controller/UpdateSocketId");
const UsersAll = require("../controller/UsersAll");

module.exports = () => {

global.socketIO.on("connect", (socket) => {

    socket.on("updateSocketId", async (params, callback) => {
      await UpdateSocketId(socket, params, callback);
    });
    
    socket.on("allFriends", UsersAll);

    socket.on("listMessagesPerson", ListMessagesPerson)

    socket.on("sendMessage", SendMessage)

  });
};
