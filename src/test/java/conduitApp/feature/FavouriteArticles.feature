Feature: Favorite Counts

Background: Sign in and get the Authorization token
    Given url apiUrl

@favorite
Scenario: Add to Favorites with Article Id

    Given path 'articles'
    When method Get
    Then status 200
    * def slugId = response.articles[0].slug
    * def initialCount = response.articles[0].favoritesCount
    * print slugId
    * print initialCount

    Given path 'articles',slugId,'favorite'
    And request {}
    When method post
    Then status 200
    * def afterFavCount = response.article.favoritesCount
    Then match afterFavCount == initialCount+1
    Then match response.article ==
    """
    {
        "id": '#number',
        "slug": '#string',
        "title": '#string',
        "description": '#string',
        "body": '#string',
        "createdAt": '#string',
        "updatedAt": '#string',
        "authorId": '#number',
        "tagList": '#array',
        "author": {
            "username": '#string',
            "bio": '##string',
            "image": '#string',
            "following": '#boolean'
        },
        "favoritedBy": [
            {
                "id": '#number',
                "email": '#string',
                "username": '#string',
                "password": '#string',
                "image": '#string',
                "bio": "##string",
                "demo": '#boolean'
            }
        ],
        "favorited": true,
        "favoritesCount": '#number'
}
    """

    Given path 'articles',slugId,'favorite'
    When method delete
    Then status 200
    * def afterUnfavcount = response.article.favoritesCount
    Then match afterUnfavcount == afterFavCount - 1
    Then match response.article.favorited == false