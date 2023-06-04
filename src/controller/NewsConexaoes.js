const { FetchUserTag } = require("../service/FetchUserTag");
const {
  SendNotification,
} = require("../service/notification/SendNotification");

module.exports = async (params, callback) => {
  const { idSender, tag } = params;

  const pessoaReceberInvite = await new FetchUserTag().handle(tag);
  console.log(
    "🚀 ~ file: NewsConexaoes.js:8 ~ module.exports= ~ pessoaReceberInvite:",
    [pessoaReceberInvite]
  );

  //   const saveNotification = {
  //     type: "SERVER",
  //     idSender: idSender,
  //     idReceiver: d.id,
  //     title: nome,
  //     description: `Você foi convidado para participar de um novo grupo, (${nome}) para entrar basta aceita-lo.`,
  //     img: img,
  //     isVisualizado: false,
  //     isAcepty: false,
  //   };

  //   await new SendNotification().handle(saveNotification);
};
