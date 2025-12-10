Feature: Signup functionality

Background: Define BaseUrl
    Given url apiUrl

@test
Scenario: Signup with Embedded expression
    Given def userData = {"user":{"email":"angrybird4@test.com","username":"angrybird4"}}
    Given path 'users'
    And request {"user":{"email":"#(userData.user.email)","password":"Test@123","username":"#(userData.user.username)"}}
    And request
    """
    {
    "user": {
        "email": "#(userData.user.email)",
        "password": "Test@123",
        "username": "#(userData.user.username)"
        }
    }
    """
    When method post
    Then status 201