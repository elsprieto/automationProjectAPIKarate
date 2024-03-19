function fn() {

  function read(file) {
    try {
      return karate.read(file);
    } catch (e) {
      karate.log("File not found: " + file)
      return {};
    }
  }

  karate.set(read('classpath:config.yml'));
  karate.configure('connectTimeout', 70000);
  karate.configure('readTimeout', 70000);

  return {
    utils: karate.call('classpath:karate-utils.js'),
  }
}