const { GroupRepository } = require("../../repository/GroupRepository");

class CreateNewGroup {
  async handle(nome, descricao, img, isPrivate) {
   const dados = await GroupRepository.create({
      nome: nome,
      img: img,
      descricao: descricao,
      isPrivate: isPrivate,
    });

    return dados;
  }
}

module.exports = { CreateNewGroup };
