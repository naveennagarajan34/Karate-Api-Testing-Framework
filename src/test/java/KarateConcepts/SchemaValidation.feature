Feature: Schema Validation

Background:
    * def mock = call read('classpath:helpers/MockResponse.feature')
    * def response = mock.mockResponse

Scenario: Verify Schema of response
    * match response.user == 
    """
    {
        "id": "#number",
        "name": "#string",
        "role": "#string",
        "active": '#boolean',
        "salary": '#number',
        "address": {
        "city": "#string",
        "country": "#string",
        "pin": '#number'
        },
        "skills": [
        {
            "name": "#string",
            "level": "#string",
            "years": '#number'
        },
        {
            "name": "#string",
            "level": "#string",
            "years": '#number'
        },
        {
            "name": "#string",
            "level": "#string",
            "years": '#number'
        }
        ],
        "projects": {
        "activeProjects": '#number',
        "completedProjects": '#array'
        }
    }
    """