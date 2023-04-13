const { FindPersonMessage } = require("../service/FindPersonMessage");
const { AddParticipante } = require("../service/group/AddParticipante");
const { CreateNewGroup } = require("../service/group/CreateNewGroup");
const {
  SendNotification,
} = require("../service/notification/SendNotification");

module.exports = async (params, callback) => {
  console.log("🚀 ~ file: NewGroup.js:4 ~ params:", [params]);

  const { nome, describe, img, participantes, myId } = params.dados;

  const dados = await new CreateNewGroup().handle(nome, describe, img, false);
  const idGrupo = dados.dataValues.id;

  await new AddParticipante().handle(idGrupo, myId, true, "Owner", true);

  const participants = [...participantes];

  const dadosMyPerson = await new FindPersonMessage().handle(myId);

  for (const d of participants) {
    const { socketId } = await new FindPersonMessage().handle(d.id);
    await new AddParticipante().handle(idGrupo, d.id, false, "Usuário", false);

    const saveNotification = {
      type: "GROUP",
      idSender: myId,
      idReceiver: d.id,
      title: nome,
      description: `Você foi convidado para participar de um novo grupo, (${nome}) para entrar basta aceita-lo.`,
      img: img,
      isVisualizado: false,
      isAcepty: false,
    };

    const dados = {
      type: "GROUP",
      nomeSender: dadosMyPerson.nome,
      imgSender: dadosMyPerson.img,
      idReceiver: d.id,
      title: nome,
      description: `Você foi convidado para participar de um novo grupo, (${nome}) para entrar basta aceita-lo.`,
      img: img,
      isVisualizado: false,
      isAcepty: false,
    };

    await new SendNotification().handle(saveNotification);

    global.socketIO.to(socketId).emit("notifications", dados);
  }

  callback(params);
};
