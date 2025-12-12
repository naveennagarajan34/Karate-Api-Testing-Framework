
Feature: Tags

Background:
    Given url apiUrl

Scenario: Get tags

    Given path 'tags'
    When method Get
    Then status 200
    Then match response.tags == "#array"
    Then match response.tags contains "Test"
    Then match response.tags !contains "Test1"
    Then match response.tags contains ["Test", "Zoom"]
    Then match response.tags contains any
    """
    [
        "Test",
        "Git",
        "YouTube",
        "Blog",
        "Bondar Academy",
        "GitHub",
        "Zoom",
        "qa career",
        "QA Skills",
        "Value-Focused"
    ]
    """


Scenario: Get articles

    Given params {limit:10, offset:0}
    Given path 'articles'
    When method Get
    Then status 200
    Then match response.articles == '#array'
    Then match response.articlesCount == '#number'
    Then match response.articlesCount == 10

@test
Scenario: Sign in

    * def createToken = call read('classpath:helpers/CreateToken.feature')
    * def token = createToken.authToken

    Given path 'articles'
    Given header Authorization = 'Token '+ token
    And request 
    """
    {
        "article": {
            "title": "Dummy article",
            "description": "Learning API",
            "body": "This is an article",
            "tagList": [
                "kya",
                "test"
            ]
        }
    }   
    """
    When method post 
    Then status 201