const Sequelize = require("sequelize");
const database = require("../database/db");

const Friend = database.define("friends", {
  id: {
    type: Sequelize.UUID,
    defaultValue: Sequelize.DataTypes.UUIDV4,
    allowNull: false,
    primaryKey: true,
  },
  idSender: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  idReceiver: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  active: {
    type: Sequelize.BOOLEAN,
    allowNull: false,
    
  }
});


module.exports = Friend;
