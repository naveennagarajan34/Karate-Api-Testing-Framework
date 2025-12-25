Feature: Login to Application

Background:
    * url 'https://rahulshettyacademy.com/api/ecom/'

Scenario: Login
    Given path 'auth/login'
    Given request {"userEmail":"naveennagarajan34@gmail.com","userPassword":"Test@123"}
    When method post
    Then status 200
    Then match response.message == "Login Successfully"
    Then match response.token == "#notnull"
    * def token = response.token
