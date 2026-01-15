Feature: Prueba básica de Karate

  Scenario: Verificar un endpoint público
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
    When method get
    Then status 200
    And print response
