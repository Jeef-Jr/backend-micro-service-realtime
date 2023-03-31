(async () => {
  const database = require("./src/database/db");
  const User = require("./src/model/UserModel");
  const Message = require("./src/model/MessageModel");
  const Group = require("./src/model/GroupModel");
  const UserGroup = require("./src/model/UserGroup");
  const Friend = require("./src/model/FriendModel");
  await database.sync();

  // const Users = User.create({
  //   nome: "Jefferson",
  //   email: "jefferson@gmail.com",
  //   senha: "1234",
  //   img: "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  //   socketId: "",
  // });

  // const Users2 = User.create({
  //   nome: "Iris",
  //   email: "iris@gmail.com",
  //   senha: "1234",
  //   img: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  //   socketId: "",
  // });

  // const Users3 = User.create({
  //   nome: "Igor",
  //   email: "igor@gmail.com",
  //   senha: "1234",
  //   img: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  //   socketId: "",
  // });


  // const Friends = Friend.create({
  //   idSender: "68ba3718-5d7a-4ebd-86c4-61789fef49bf",
  //   idReceiver: "b0083bac-d4ee-43d7-bccc-67e458fd10d2",
  //   active: true,
  // });

  // const Message1 = Message.create({
  //   idSender: "09b07c04-88de-4b3f-80a3-43853195f3e5",
  //   idReceiver: "7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1",
  //   message: "Olá vidinha!",
  // });

  // const Message2 = Message.create({
  //   idSender: "7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1",
  //   idReceiver: "09b07c04-88de-4b3f-80a3-43853195f3e5",
  //   message: "Olá, tudo bem contigo?",
  // });

  // const Message3 = Message.create({
  //   idSender: "09b07c04-88de-4b3f-80a3-43853195f3e5",
  //   idReceiver: "7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1",
  //   message: "Olá, sim e contigo?",
  // });

  // const Message4 = Message.create({
  //   idSender: "7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1",
  //   idReceiver: "09b07c04-88de-4b3f-80a3-43853195f3e5",
  //   message: "Estou bem.",
  // });

  // const Message5 = Message.create({
  //   idSender: "09b07c04-88de-4b3f-80a3-43853195f3e5",
  //   idReceiver: "7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1",
  //   message: "Que bom :)",
  // });

  // const Message7 = Message.create({
  //   idSender: "09b07c04-88de-4b3f-80a3-43853195f3e5",
  //   idReceiver: "7a1d51bb-f2c3-4dfd-98f1-ad8f46fea9c1",
  //   message: "O que está fazendo?",
  // });

})();
