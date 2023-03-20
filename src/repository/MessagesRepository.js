const { QueryTypes } = require("sequelize");
const MessageModel = require("../model/MessageModel");



class MessagesRepository extends MessageModel {

    static async listMessagesOnePerson(id) {


        const messages = await this.sequelize.query(
            `
            SELECT M.idSender, M.idReceiver, M.message, M.createdAt, M.updatedAt FROM messages AS M 
            WHERE M.idSender = '${id}'
            OR M.idReceiver = '${id}' ORDER BY M.createdAt ASC
            
            `,
            {
                type: QueryTypes.SELECT
            }
        );
        return messages;
    }
}

module.exports = { MessagesRepository };