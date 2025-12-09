Feature: Tests for the Sign in and posting articles and deleting the same

Background: Sign in and get the Authorization token
    Given url 'https://conduit-api.bondaracademy.com/api'
    * def responseToken = callonce read('classpath:helpers/CreateToken.feature') {"email":"naveennagarajan@gmail.com","password":"Test@123"}
    * def token = responseToken.authToken

Scenario: Create an Article using POST and delete it using DELETE
    Given header Authorization = 'Token '+ token
    Given path 'articles'
    And request {"article":{"title":"This is an Article","description":"Article about karate framework","body":"NA","tagList":["test, qa"]}}
    When method post
    Then status 201
    * def slugId = response.article.slug
    
    Given header Authorization = 'Token '+ token
    Given path 'articles',slugId
    When method delete
    Then status 204