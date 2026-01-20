Feature: CRUD Roles

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def rolId = '76820ded-8c5f-49fb-ae9b-ed1aea8a9e11'

  Scenario: POST - Crear rol
    Given url baseUrl + '/rol'
    And request
    """
    {
      "nombre": "PRUEBA",
      "descripcion": "Rol de prueba"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar roles
    Given url baseUrl + '/rol'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener rol por id
    Given url baseUrl + '/rol/' + rolId
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar rol por id
    Given url baseUrl + '/rol/' + rolId
    And request
    """
    {
      "nombre": "Aspirante",
      "descripcion": "Aspirante futuro estudiante de la UTE"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar rol por id
    Given url baseUrl + '/rol/' + rolId
    When method delete
    Then status 200
    And print response
