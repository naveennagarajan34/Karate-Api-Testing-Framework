Feature: Conditional Logic

Background:
    Given url apiUrl

Scenario: Get First article and Like if it is not already Liked
    Given params {limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    * def favCount = response.articles[0].favoritesCount
    * def slugId = response.articles[0].slug
    * def articleObject = response.articles[0]

    # condtional logic
    # * if (favCount == 0) karate.call('classpath:helpers/AddFavourite.feature', articleObject)

    # Another method using conditional operator or ternary operator (?:)
        # This method will return the value from the called feature file
    * def likeCount = favCount == 0 ? karate.call('classpath:helpers/AddFavourite.feature', articleObject).someValue : favCount

    Given params {limit: 10, offset: 0}
    Given path '/articles'
    When method Get
    Then status 200
    Then match response.articles[0].favoritesCount == 1