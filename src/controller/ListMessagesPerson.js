const { MessagesAllPerson } = require("../service/MessagesAllPerson");


module.exports = async (params, callback) => {

    const {id} = params;

    const messages = await new MessagesAllPerson().handle(id);

    callback(messages)
}