const { QueryTypes } = require("sequelize");
const Friend = require("../model/FriendModel");

class FriendsRepository extends Friend {


  static async listAllFriends(idUser) {


    const friends = await this.sequelize.query(
      `
            SELECT U.id, U.idRelacionado, nome, img, socketId FROM Users AS U 
            INNER JOIN Friends AS F 
            ON U.id = F.idSender OR U.id = F.idReceiver 
            WHERE F.idSender = '${idUser}' AND U.id != '${idUser}' 
            OR F.idReceiver = '${idUser}' AND U.id != '${idUser}'
            GROUP BY U.id;
            `,
      {
        type: QueryTypes.SELECT,
      }
    );

    return friends;
  }

  static async listOneFriend(idSender, idReceiver) {

    const friend = await this.sequelize.query(
      `
      SELECT F.id FROM friends AS F 
      WHERE F.idReceiver = '${idReceiver}' 
      AND F.idSender = '${idSender}' OR
      F.idReceiver = '${idSender}' 
      AND F.idSender = '${idReceiver}'
      `,
      {
        type: QueryTypes.SELECT
      }
    );
      
      return friend;
  }

}

module.exports = { FriendsRepository };
