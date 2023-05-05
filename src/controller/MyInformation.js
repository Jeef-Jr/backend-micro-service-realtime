const { MyInformation } = require("../service/MyInformation");

module.exports = async (params, callback) => {
  const { id } = params;

  const response = await new MyInformation().handle(id);

  callback(response);
};
