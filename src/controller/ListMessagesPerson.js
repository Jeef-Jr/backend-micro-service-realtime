const { MessagesAllPerson } = require("../service/MessagesAllPerson");


module.exports = async (params, callback) => {

    const {myId, otherPeploe} = params;

    const messages = await new MessagesAllPerson().handle(myId, otherPeploe);

    callback(messages)
}