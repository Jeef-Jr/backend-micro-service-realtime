const Sequelize = require("sequelize");
const database = require("../database/db");

const MessageGroupModel = database.define(
  "message_group",
  {
    id: {
      type: Sequelize.UUID,
      defaultValue: Sequelize.DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    idUser: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    idGroup: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    message: {
      type: Sequelize.STRING,
      allowNull: false,
    },
  },
  {
    charset: "utf8mb4",
    collate: "utf8mb4_unicode_ci",
  }
);

module.exports = MessageGroupModel;
