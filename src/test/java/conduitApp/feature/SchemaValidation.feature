Feature: Schema validation for list of articles

  Background:
    * url apiUrl
    * path 'articles'

    # Load the custom date validator
    * def timeValidator =
    """
    function(s) {
      var SimpleDateFormat = Java.type("java.text.SimpleDateFormat");
      var sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
      try {
        sdf.parse(s).time;
        return true;
      } catch (e) {
        karate.log("*** invalid date string:", s);
        return false;
      }
    }
    """

  Scenario: Verify the schema validation for the articles response
    Given param limit = 10
    When method get
    Then status 200

    # First validate only the top-level JSON structure
Then match response ==
"""
{
  "articles": "#[]",
  "articlesCount": "#number"
}
"""


    # Now define schema for each article object
    * def articleSchema =
    """
    {
      slug: '#string',
      title: '#string',
      description: '#string',
      body: '#string',
      tagList: '#array',
      createdAt: '#? timeValidator(_)',
      updatedAt: '#? timeValidator(_)',
      favorited: '#boolean',
      favoritesCount: '#number',
      author: {
        username: '#string',
        bio: '##string',
        image: '#string',
        following: '#boolean'
      }
    }
    """

    # Validate each article object in the array
    Then match each response.articles == articleSchema
