const Sequelize = require("sequelize");
const database = require("../database/db");

const MessageModel = database.define(
  "message",
  {
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
    idFriend: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    message: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    visualizado: {
      type: Sequelize.BOOLEAN,
      defaultValue: false,
      allowNull: false,
    },
  },
  {
    charset: "utf8mb4",
    collate: "utf8mb4_unicode_ci",
  }
);

module.exports = MessageModel;
