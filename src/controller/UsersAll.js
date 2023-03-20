const { FindAllFriends } = require("../service/FindAllFriends");

module.exports = async (params, callback) => {
  const { idUser } = params;

  const friends = await new FindAllFriends().handle(idUser);

  callback(friends);
};
