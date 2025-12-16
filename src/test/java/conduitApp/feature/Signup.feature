Feature: Signup functionality

Background: Define BaseUrl
    # apiUrl is defined in karate-config.js
    # Java file doesn't need extension to be mentioned
    Given url apiUrl
    * def randomData = Java.type('helpers.DataGenerator')

@test
Scenario: Signup with Embedded expression
    * def emailId = randomData.getRandomEmail();
    * def userId = randomData.getRandomUserName()
    Given def userData = {"user":{"email":"angrybird4@test.com","username":"angrybird4"}}
    Given path 'users'
    And request {"user":{"email":"#(userData.user.email)","password":"Test@123","username":"#(userData.user.username)"}}
    
    #  Request is passed as multi line comments using (""" """)
    And request
    """
    {
    "user": {
        "email": "#(emailId)",
        "password": "Test@123",
        "username": "#(userId)"
        }
    }
    """
    When method post
    Then status 201