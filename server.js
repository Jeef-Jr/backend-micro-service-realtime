const {http} = require('./http');


http.listen(80, () => {
    console.log('listening on');
});