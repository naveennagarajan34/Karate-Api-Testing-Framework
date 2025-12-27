Feature:  Orders Mock data

Scenario: Orders response
    * def response = 
    """
        {
        "orders": [
            {
            "id": "ORD101",
            "status": "delivered",
            "amount": 2500,
            "items": [
                { "name": "Laptop", "category": "Electronics", "price": 1500 },
                { "name": "Mouse", "category": "Electronics", "price": 50 },
                { "name": "Bag", "category": "Accessories", "price": 150 }
            ],
            "customer": { "vip": true, "country": "India" }
            },
            {
            "id": "ORD102",
            "status": "pending",
            "amount": 900,
            "items": [
                { "name": "Shoes", "category": "Fashion", "price": 400 },
                { "name": "Watch", "category": "Fashion", "price": 500 }
            ],
            "customer": { "vip": false, "country": "USA" }
            },
            {
            "id": "ORD103",
            "status": "delivered",
            "amount": 1200,
            "items": [
                { "name": "Phone", "category": "Electronics", "price": 1000 },
                { "name": "Case", "category": "Accessories", "price": 200 }
            ],
            "customer": { "vip": true, "country": "UK" }
            },
            {
            "id": "ORD104",
            "status": "pending",
            "amount": 1200,
            "items": [
                { "name": "Headphone", "category": "Electronics", "price": 500 },
                { "name": "Case", "category": "Accessories", "price": 200 }
            ],
            "customer": { "vip": false, "country": "UK" }
            },
            {
            "id": "ORD105",
            "status": "delivered",
            "amount": 1200,
            "items": [
                { "name": "Hp Elite book", "category": "Computers / Laptop", "price": 10000 },
                { "name": "Bag", "category": "Accessories", "price": 600 }
            ],
            "customer": { "vip": true, "country": "India" }
            }
        ]
        }
    """