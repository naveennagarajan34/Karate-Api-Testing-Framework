Feature: Tests for the Sign in and posting articles

Background: Sign in and get the Authorization token
    Given url 'https://conduit-api.bondaracademy.com/api'
    Given path '/users/login'
    And request {"user":{"email":"naveennagarajan@gmail.com","password":"Test@123"}}
    When method post
    Then status 200
    * def token = response.user.token

Scenario: Create an Article using POST
    Given header Authorization = 'Token '+ token
    Given path '/articles'
    And request {"article":{"title":"This is an Article","description":"Article about karate framework","body":"NA","tagList":["test, qa"]}}
    When method post
    Then status 201
     
