const { QueryTypes } = require("sequelize");
const MessageModel = require("../model/MessageModel");

class MessagesRepository extends MessageModel {
  static async listMessagesOnePerson(myId, otherPepleo) {
    const messages = await this.sequelize.query(
      `
            SELECT M.idSender, M.idReceiver, M.message, M.visualizado, M.createdAt, M.updatedAt FROM messages AS M 
            WHERE M.idSender = '${myId}' AND M.idReceiver = '${otherPepleo}'
            OR M.idReceiver = '${myId}' AND M.idSender = '${otherPepleo}' ORDER BY M.createdAt ASC
            `,
      {
        type: QueryTypes.SELECT,
      }
    );
    return messages;
  }

  static async listMessagesRecentes(myId) {
    const messages = await this.sequelize.query(
      `
      SELECT u.id AS "idEnviou", u.nome AS "nomeEnviou", u.img AS "imagemEnviou", u.socketId AS "socketEnviou", u2.socketId AS "socketRecebeu",
      m.message,m.idFriend, m.createdAt, u2.id AS "idRecebeu", u2.nome AS  "nomeRecebeu", u2.img AS "imagemRecebeu",
      m.visualizado AS "isVisualizado"
      FROM messages AS m
      INNER JOIN users AS u ON u.id = m.idSender
      INNER JOIN users AS u2 ON u2.id = m.idReceiver
      WHERE m.idFriend IN (SELECT f2.id FROM friends AS f2 INNER JOIN users AS u ON
      u.id = f2.idSender OR u.id = f2.idReceiver
      WHERE u.id = '${myId}')
      AND m.createdAt = (SELECT m2.createdAt FROM messages AS m2 WHERE m2.idFriend = m.idFriend ORDER BY m2.createdAt DESC LIMIT 1)
      ;
            `,
      {
        type: QueryTypes.SELECT,
      }
    );
    return messages;
  }

  static async listQtdMessagesPedente(idFriend, myId) {
    const messagesPendente = await this.sequelize.query(
      `
      SELECT m.idFriend, COUNT(visualizado) AS qtdNaoVisualizados
      FROM messages AS m
      INNER JOIN users AS u ON u.id = m.idSender
      INNER JOIN users AS u2 ON u2.id = m.idReceiver
      WHERE m.idFriend = '${idFriend}'
      AND m.visualizado IN (SELECT M2.visualizado FROM messages AS M2 WHERE m.idReceiver = '${myId}' AND M2.visualizado = 0 )
      `,
      {
        type: QueryTypes.SELECT,
      }
    );
    return messagesPendente;
  }

  static async attMessagesVisualized(idFriend, myId) {

    const atualizar = await this.sequelize.query(
      `
      UPDATE messages AS M SET M.visualizado = 1 
      WHERE M.idFriend = '${idFriend}' 
      AND M.idReceiver = '${myId}';
      `,
      {
        type: QueryTypes.UPDATE,
      }
    )

    return atualizar;
  }
}

module.exports = { MessagesRepository };
