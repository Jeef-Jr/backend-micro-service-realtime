const { http } = require("./http");

http.listen(3333, () => {
  console.log("listening on");
});
