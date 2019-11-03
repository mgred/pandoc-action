const actions = require("@actions/exec");

async function run() {
  await actions.exec("sh", ["install.sh"]);
}

run();
