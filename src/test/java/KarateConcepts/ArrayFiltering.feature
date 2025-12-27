Feature: Array Filtering

Background:
    * def mock = call read("classpath:helpers/OrdersMockData.feature")
    * def response = mock.response

Scenario: Validate using array filtering concept
    # 🧪 Filtering Tasks (Karate Match Only)

    # 1️⃣ Get only delivered orders and validate count = 2
    # 2️⃣ Validate at least one delivered order belongs to country = India
    # 3️⃣ Filter orders where amount > 1000 and validate count = 2
    # 4️⃣ From all orders, filter only VIP customers and ensure count = 2 
    # 5️⃣ From ORD101, filter items where category = Electronics and validate count = 2
    # 6️⃣ From all orders, get all items with price > 500 and validate list size = 2

    # Prefer ?(@.status=='delivered')  type of filtering direct only with match

    * match $.orders[?(@.status=='delivered')] == "#[3]"
    * match $.orders[?(@.status=='delivered')].customer.country contains "India"
    * match $.orders[?(@.amount > 1000)] == '#[4]'

    # 👉 From all orders, get only the delivered orders where amount > 1000 and print their id values.
    #  method 1
    * def filtered = karate.filter(response.orders, function(o){ return o.status == 'delivered' && o.amount > 1000 })
    * def ids = karate.map(filtered, function(o){ return o.id })
    * print ids

    # method 2
    * def ids = karate.jsonPath(response, "$.orders[?(@.status=='delivered' && @.amount>1000)].id")
    * print ids

    # ?(@...) is JsonPath, not JavaScript
    # print internally becomes karate.log() → goes to JS
    # JS cannot parse ?(@...) → crashes
    # So use karate.jsonPath() or karate.filter/map() when you want to safely evaluate and print.