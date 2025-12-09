Feature: Tests for the Sign in and posting articles and deleting the same

Background: Sign in and get the Authorization token
    Given url apiUrl

Scenario: Create an Article using POST and delete it using DELETE

    Given path 'articles'
    And request {"article":{"title":"This is an Article","description":"Article about karate framework","body":"NA","tagList":["test, qa"]}}
    When method post
    Then status 201
    * def slugId = response.article.slug
    
    Given path 'articles',slugId
    When method delete
    Then status 204