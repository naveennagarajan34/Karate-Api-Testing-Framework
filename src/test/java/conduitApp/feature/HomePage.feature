Feature: Tests for the conduit Homepage

Background: Define Url
        Given url 'https://conduit-api.bondaracademy.com/api'
@debug
Scenario: Get all tags
    Given url 'https://conduit-api.bondaracademy.com/api' 
    Given path '/tags'
    When method Get
    Then status 200
    And match response.tags contains ['Test', 'Git']
    And match response.tags !contains 'Truck'
    And match response.tags == "#array"
    And match each response.tags == "#string"

Scenario: Get 10 articles on the page
    Given url 'https://conduit-api.bondaracademy.com/api/articles?limit=10&offset=0'
    When method Get
    Then status 200
@ignore
Scenario: Get 10 articles on the page
    Given param limit = 10
    Given param offset = 0
    Given url 'https://conduit-api.bondaracademy.com/api/articles'
    When method Get
    Then status 200

Scenario: Get 10 articles on the page
    Given params {limit: 10, offset: 0}
    Given path '/articles'
    When method Get
    Then status 200
    And match response.articles == "#[10]"
    And match response.articlesCount == 10