const express = require("express");
const { createServer } = require("http");
const path = require("path");
const { Server } = require("socket.io");

const app = express();

const http = createServer(app);
const userSocket = require("./src/websockets/user");

const io = new Server(http, {
  cors: "*",
});

io.on("connection", (socket) => {
  socket.on("disconnect", () => {

   console.log(socket.id + " disconnected.");

  });
});

global.socketIO = io;

userSocket();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use((err, req, res, next) => {
  if (err instanceof Error) {
    return res.status(400).json({ error: err.message });
  }

  return res
    .status(500)
    .json({ status: "erorr", message: "Internal Server Error" });
});

module.exports = { http };
