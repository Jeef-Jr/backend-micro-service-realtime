const Sequelize = require('sequelize');
const sequelize = new Sequelize('chat', 'root', '', {
    dialect: 'mysql',
    host: "localhost",
    port: 3306,
    charset: "utf8mb4",
    collate: "utf8mb4_unicode_ci",
    timezone: '-03:00',
    useUTC: false
})

module.exports = sequelize;