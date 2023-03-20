const { QueryTypes } = require("sequelize");
const MessageModel = require("../model/MessageModel");



class MessagesRepository extends MessageModel {

    static async listMessagesOnePerson(myId, otherPepleo) {


        const messages = await this.sequelize.query(
            `
            SELECT M.idSender, M.idReceiver, M.message, M.createdAt, M.updatedAt FROM messages AS M 
            WHERE M.idSender = '${myId}' AND M.idReceiver = '${otherPepleo}'
            OR M.idReceiver = '${myId}' AND M.idSender = '${otherPepleo}' ORDER BY M.createdAt ASC
            `,
            {
                type: QueryTypes.SELECT
            }
        );
        return messages;
    }
}

module.exports = { MessagesRepository };