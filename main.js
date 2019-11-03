const actions = require("@actions/exec");

async function run() {
  const options = {};
  let output;
  let error;
  options.listeners = {
    stdout: (data: Buffer) => {
      output += data.toString();
    },
    stderr: (data: Buffer) => {
      error += data.toString();
    }
  };
  await actions.exec("ls", ["-l"], options);
  await actions.exec("sh", ["install.sh"], options);
}

run().finally(() => console.log(output, error));
