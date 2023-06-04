const { UserRepository } = require("../repository/UserRepository");

class FetchAllListPersonService {
  async handle() {
    const persons = UserRepository.findAll();

    return persons;
  }
}

module.exports = { FetchAllListPersonService };
