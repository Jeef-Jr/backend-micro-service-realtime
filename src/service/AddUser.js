import { UserRepository } from "../repository/UserRepository";

class AddUser {
  async handle(id, nome, tag) {
    const response = await UserRepository.create({
      idRelacionado: id,
      nome,
      tag,
      img: "userDefult.png",
      socketId: null,
    });

    return response;
  }
}

module.exports = { AddUser };
