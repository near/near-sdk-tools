#!/usr/bin/env node

const getBinary = require('./getBinary');
const join = require("path").join;
const fs = require("fs");

const binary = getBinary();
const binPath = join(binary.installDirectory, "bin", binary.name);

function binExists() {
  return fs.existsSync(binPath);
}

if (!binExists()) {
  binary.install();
  if (!binExists()) {
    throw new Error("binary failed to be installed to " + binPath);
  }
}

if (process.argv.length < 3) {
  process.argv.push("--help");
}

binary.run();
