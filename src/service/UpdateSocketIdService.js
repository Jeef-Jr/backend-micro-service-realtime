const { UserRepository } = require("../repository/UserRepository");

class UpdateSocketIdService {
  async handle(idUser, idSocket) {
    const user = await UserRepository.update(
      { socketId: idSocket },
      {
        where: {
          id: idUser,
        },
        
      }
    );
      return user;
  }
}

module.exports = { UpdateSocketIdService };
