const Sequelize = require("sequelize");
const database = require("../database/db");

const Group = database.define("group", {
  id: {
    type: Sequelize.UUID,
    defaultValue: Sequelize.DataTypes.UUIDV4,
    allowNull: false,
    primaryKey: true,
  },
  nome: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  img: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  descricao: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  isPrivate: {
    type: Sequelize.BOOLEAN,
    allowNull: false,
    defaultValue: false
  }
});

module.exports = Group;
