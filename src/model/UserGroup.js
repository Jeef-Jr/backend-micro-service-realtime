const Sequelize = require("sequelize");
const database = require("../database/db");

const UserGroup = database.define(
  "user_group",
  {
    id: {
      type: Sequelize.UUID,
      defaultValue: Sequelize.DataTypes.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    idGroup: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    idUser: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    isAdmin: {
      type: Sequelize.BOOLEAN,
      defaultValue: false,
      allowNull: false,
    },
    role: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    isActive: {
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

module.exports = UserGroup;
