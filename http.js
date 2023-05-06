const express = require("express");
const { createServer } = require("http");
const path = require("path");
const { Server } = require("socket.io");
const cors = require("cors");

const app = express();
const { router } = require("./routes");

const http = createServer(app);
const userSocket = require("./src/websockets/user");

const io = new Server(http, {
  cors: "*",
});

io.on("connection", socket => {
  console.log(socket.id);
  socket.on("disconnect", () => {
    console.log(socket.id + " disconnected.");
  });
});

global.socketIO = io;

userSocket();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());
app.use(router);

app.use("/images", express.static(path.join(__dirname, "..", "imagem/")));

app.use((err, req, res, next) => {
  if (err instanceof Error) {
    return res.status(400).json({ error: err.message });
  }

  return res
    .status(500)
    .json({ status: "erorr", message: "Internal Server Error" });
});

module.exports = { http };
