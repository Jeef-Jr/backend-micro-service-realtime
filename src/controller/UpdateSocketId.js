const { UpdateSocketIdService } = require("../service/UpdateSocketIdService");

module.exports = async (socket, params, callback) => {
  const { idUser } = params;

  const user = await new UpdateSocketIdService().handle(idUser, socket.id);

  callback(user);
};
