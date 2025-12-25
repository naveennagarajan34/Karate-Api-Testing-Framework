Feature: Mock Json response Data

Scenario:
    
    * def mockResponse = 
    
    """
        {
        "user": {
            "id": 101,
            "name": "Naveen",
            "role": "SDET",
            "active": true,
            "salary": 85000.5,
            "address": {
            "city": "Coimbatore",
            "country": "India",
            "pin": 641004
            },
            "skills": [
            {
                "name": "Karate",
                "level": "Advanced",
                "years": 3
            },
            {
                "name": "Selenium",
                "level": "Expert",
                "years": 4
            },
            {
                "name": "Playwright",
                "level": "Intermediate",
                "years": 2
            }
            ],
            "projects": {
            "activeProjects": 2,
            "completedProjects": [
                {
                "name": "Ecommerce",
                "status": "delivered"
                },
                {
                "name": "BankingApp",
                "status": "delivered"
                }
            ]
            }
        }
        }
    """

    * return mockResponse