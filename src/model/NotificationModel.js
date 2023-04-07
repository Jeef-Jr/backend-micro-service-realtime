const Sequelize = require("sequelize");
const database = require("../database/db");

const NotificationModel = database.define(
  "notification",
  {
    id: {
      type: Sequelize.UUID,
      defaultValue: Sequelize.DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    type: {
      type: Sequelize.ENUM("SOLO", "GROUP", "SERVER"),
      allowNull: false,
    },
    idSender: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    idReceiver: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    title: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    description: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    img: {
      type: Sequelize.STRING,
      allowNull: true,
    },
    isVisualizado: {
      type: Sequelize.BOOLEAN,
      defaultValue: false,
      allowNull: false,
    },
    isAcepty: {
      type: Sequelize.BOOLEAN,
      defaultValue: false,
      allowNull: true,
    },
  },
  {
    charset: "utf8mb4",
    collate: "utf8mb4_unicode_ci",
  }
);

module.exports = NotificationModel;
