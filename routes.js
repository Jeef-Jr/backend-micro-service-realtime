const { Router } = require("express");
const multer = require("multer");
const { NewGroupController } = require("./src/controller/NewGroup");
const path = require('path');
const router = Router();

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./src/uploads/perfils");
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

router.get('/imagem/perfil/:nomeDoArquivo', (req, res) => {
  const nomeDoArquivo = req.params.nomeDoArquivo;
  const caminhoDaImagem = path.resolve(__dirname, 'src/uploads/perfils', nomeDoArquivo);

  res.sendFile(caminhoDaImagem);
});

module.exports = { router };
