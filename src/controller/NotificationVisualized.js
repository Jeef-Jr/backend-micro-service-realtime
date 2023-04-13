const {
  NotificationVisualized,
} = require("../service/notification/NotificationVisualized");

module.exports = async (params, callback) => {
  const { arrayNotify } = params;

  for (const notify of arrayNotify) {
    await new NotificationVisualized().handle(notify.id);
  }

  callback(params);
};
