const { UserRepository } = require("../repository/UserRepository");

class FetchUserTag {
  async handle(tag) {
    const user = await UserRepository.findOne({
      where: { tag: tag },
    });

    return user;
  }
}

module.exports = { FetchUserTag };
