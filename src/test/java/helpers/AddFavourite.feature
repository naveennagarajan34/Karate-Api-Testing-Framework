Feature: Add Like to the Article

Background: Sign in and get the Authorization token
    Given url apiUrl

Scenario: Add to Favorites with Article Slug Id
    Given path 'articles',slugId,'favorite'
    And request {}
    When method post
    Then status 200
    * print 'check Add Like feature is called'
    * def someValue = 123