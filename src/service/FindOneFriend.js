const { FriendsRepository } = require("../repository/FriendsRepository")

class FindOneFriend {

    async handle(idSender, idReveicer){

        const idFriend = await FriendsRepository.listOneFriend(idSender, idReveicer);

        return idFriend;
    }

}

module.exports = {FindOneFriend}