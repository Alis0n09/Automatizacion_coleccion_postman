Feature: Prueba de clientes Karate

  Scenario: Verificar la estructura de contactos
    Given url 'http://localhost:3000/cliente'
    When method get
    Then status 200
    And print response