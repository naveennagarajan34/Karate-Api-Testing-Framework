function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log("karate.env system property was:", env);

  // If environment is not passed, dev while be executed by default
  if (!env) {
    env = "dev";
  }

  // Base url is configured
  var config = {
    // apiUrl: "https://conduit-api.bondaracademy.com/api",
  };

  // Below block for dev environment
  if (env == "dev") {
    config.userEmail = "naveennagarajan@gmail.com";
    config.userPassword = "Test@123";
  }
  // Below block for qa environment
  else if (env == "qa") {
    config.userEmail = "naveen@gmail.com";
    config.userPassword = "Test@123";
  }
  // call Single method to call feature file once.... karate-config.js file is execute for each scenario...so preferred callSingle() method
  // var accessToken = karate.callSingle(
  //   "classpath:helpers/CreateToken.feature",config
  // ).authToken;

  // Configuring header globally
  // karate.configure("headers", { Authorization: "Token " + accessToken });
  return config;
}
