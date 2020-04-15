function getBinary() {
  try {
      const getBinary = require('./getBinary');
      return getBinary();
  } catch (err) { }
}

getBinary().uninstall();
