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

* match $.orders[?(@.status=='delivered')] == "#[2]"
* match $.orders[?(@.status=='delivered')].customer.country contains "India"
* match $.orders[?(@.amount > 1000)] == '#[2]'

# * match response.orders[?(@.customer.vip)] == '#[3]'
