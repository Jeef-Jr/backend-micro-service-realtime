const { Router } = require("express");
const multer = require("multer");
const { NewGroupController } = require("./src/controller/NewGroup");
const path = require("path");
const { UserRepository } = require("./src/repository/UserRepository");
const router = Router();
const mercadopago = require("mercadopago");

mercadopago.configure({
  access_token:
    "TEST-5763239774736390-110802-6eacd99ce314754e2c097dd9b62c44ff-465602678",
});

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

router.post("/create_preference", (req, res) => {
  let preference = {
    items: [
      {
        title: req.body.description,
        unit_price: Number(req.body.price),
        quantity: Number(req.body.quantity),
      },
    ],
    back_urls: {
      success: "http://localhost:3000/jobs",
      failure: "http://localhost:3333/feedback",
      pending: "http://localhost:3333/feedback",
    },
    auto_return: "approved",
  };

  mercadopago.preferences
    .create(preference)
    .then(function (response) {
      res.json({
        id: response.body.id,
      });
    })
    .catch(function (error) {
      console.log(error);
    });
});

router.get("/feedback", function (req, res) {
  res.json({
    Payment: req.query.payment_id,
    Status: req.query.status,
    MerchantOrder: req.query.merchant_order_id,
  });
});

module.exports = { router };
