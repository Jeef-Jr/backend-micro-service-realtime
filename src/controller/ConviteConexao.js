const { FetchUserTag } = require("../service/FetchUserTag");
const { MyInformationToID } = require("../service/MyInformationToID");
const {
  SendNotification,
} = require("../service/notification/SendNotification");

module.exports = async (params, callback) => {
  const { idUser, dados } = params;

  const dadosMyPerson = await new MyInformationToID().handle(idUser);

  const saveNotification = {
    type: "SERVER",
    idSender: idUser,
    idReceiver: dados.id,
    title: "Convite de conexão",
    description: `Você recebeu um convite de conexão do ${dadosMyPerson.nome} deseja aceita-lo?.`,
    img: "",
    isVisualizado: false,
    isAcepty: false,
  };

  const enviarMessage = {
    type: "SERVER",
    nomeSender: dadosMyPerson.nome,
    imgSender: dadosMyPerson.img,
    idReceiver: dados.id,
    idSender: idUser,
    title: "Convite de conexão",
    description: `Você recebeu um convite de conexão do ${dadosMyPerson.nome} deseja aceita-lo?.`,
    img: "",
    isVisualizado: false,
    isAcepty: false,
  };

  await new SendNotification().handle(saveNotification);

  global.socketIO.to(dados.socketId).emit("notifications", enviarMessage);

  callback({ message: "Convite enviado" });
};
