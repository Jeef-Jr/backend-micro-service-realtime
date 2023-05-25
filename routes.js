const { Router } = require("express");
const multer = require("multer");
const { NewGroupController } = require("./src/controller/NewGroup");
const path = require("path");
const { UserRepository } = require("./src/repository/UserRepository");
const router = Router();

function geraStringAleatoria(tamanho) {
  var stringAleatoria = "";
  var caracteres =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  for (var i = 0; i < tamanho; i++) {
    stringAleatoria += caracteres.charAt(
      Math.floor(Math.random() * caracteres.length)
    );
  }
  return stringAleatoria;
}

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./src/uploads/imgs");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});
const upload = multer({ storage: storage });

router.post("/newImgGroup", upload.single("img"), async (req, res) => {
  const nameFile = req.file.filename;

  res.status(200).json({
    imageFile: nameFile,
  });
});

router.get("/imagem/:nomeDoArquivo", (req, res) => {
  const nomeDoArquivo = req.params.nomeDoArquivo;
  const caminhoDaImagem = path.resolve(
    __dirname,
    "src/uploads/imgs",
    nomeDoArquivo
  );

  res.sendFile(caminhoDaImagem);
});

router.post("/adduser", async (req, res) => {
  const id = req.body.id;
  const nome = req.body.nome;
  const tag = geraStringAleatoria(5);

  const response = await UserRepository.create({
    idRelacionado: id,
    nome,
    tag,
    img: "userDefult.png",
    socketId: null,
  });

  res.json({
    response,
  });
});

module.exports = { router };
