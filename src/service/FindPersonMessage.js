const { UserRepository } = require("../repository/UserRepository");

class FindPersonMessage {
  async handle(idReceiver) {
    const idSocketReceiver = await UserRepository.findOne({
      where: { id: idReceiver },
    });

    return idSocketReceiver;
  }
}

module.exports = { FindPersonMessage };
