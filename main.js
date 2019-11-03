const actions = require("@actions/exec");

async function run() {
  await actions.exec("ls -l");
  await actions.exec("/bin/sh", ["./install.sh"]);
}

run();
