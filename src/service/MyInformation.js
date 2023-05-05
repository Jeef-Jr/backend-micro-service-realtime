const { UserRepository } = require("../repository/UserRepository");

class MyInformation {
  async handle(id) {
    const response = await UserRepository.findOne({
      where: { idRelacionado: id },
    });

    return response;
  }
}

module.exports = { MyInformation };
