const { AddParticipante } = require("../service/group/AddParticipante");
const { CreateNewGroup } = require("../service/group/CreateNewGroup");

module.exports = async (params, callback) => {
  console.log("🚀 ~ file: NewGroup.js:4 ~ params:", [params]);

  const { nome, describe, img, participantes, myId } = params.dados;

  const dados = await new CreateNewGroup().handle(nome, describe, img, false);
  const idGrupo = dados.dataValues.id;

  await new AddParticipante().handle(idGrupo, myId, true, "Owner", true);

  const participants = [...participantes];

  participants.forEach(async (d) => {
    await new AddParticipante().handle(idGrupo, d.id, false, "Usuário", false);
    // Emitir socket.TO para os usuários um convite para o grupo
  });

  callback(params);
};
