const { UserRepository } = require("../repository/UserRepository");

class MyInformationToID {
  async handle(id) {
    const response = await UserRepository.findOne({
      where: { id: id },
    });

    return response;
  }
}

module.exports = { MyInformationToID };
