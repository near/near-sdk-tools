#!/usr/bin/env node

const getBinary = require('./getBinary');

if (process.argv.length < 3) {
  process.argv.push("--help");
}

getBinary().run();
