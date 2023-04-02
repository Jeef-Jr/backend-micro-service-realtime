const { UserGroupRepository } = require("../../repository/UserGroupRepository");

class AddParticipante {
  async handle(idGroup, idUser, isAdmin, role, isActive) {
    await UserGroupRepository.create({
      idGroup: idGroup,
      idUser: idUser,
      isAdmin: isAdmin,
      role: role,
      isActive: isActive
    });
  }
}

module.exports = { AddParticipante };
