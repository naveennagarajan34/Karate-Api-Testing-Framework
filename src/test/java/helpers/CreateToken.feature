Feature: Create a token

Scenario: Sign in and get the Authorization token
    Given url apiUrl
    Given path '/users/login'
    And request {"user":{"email":"#(userEmail)","password":"#(userPassword)"}}
    When method post
    Then status 200
    * def authToken = response.user.token