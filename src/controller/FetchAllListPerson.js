const {
  FetchAllListPersonService,
} = require("../service/FetchAllListPersonService");

module.exports = async (params, callback) => {
  const persons = await new FetchAllListPersonService().handle();

  callback(persons);
};
