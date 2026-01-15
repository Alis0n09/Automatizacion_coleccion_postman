Feature: CRUD Matricula

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def clienteId = '66999e19-483a-4a92-83b2-ab6c74667e9b'
    * def carreraId = '0dd5544c-13a6-431c-bcce-5f59726b9921'
    * def matriculaId = '341528a8-2162-43ef-ae59-a13fb3098615'

  Scenario: POST - Crear matricula
    Given url baseUrl + '/matricula'
    And request
    """
    {
      "id_cliente": "#(clienteId)",
      "id_carrera": "#(carreraId)",
      "periodo_academico": "2026A",
      "estado": "Activa"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar matriculas
    Given url baseUrl + '/matricula'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener matricula por id
    Given url baseUrl + '/matricula/' + matriculaId
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar matricula por id
    Given url baseUrl + '/matricula/' + matriculaId
    And request
    """
    {
      "id_cliente": "#(clienteId)",
      "id_carrera": "#(carreraId)",
      "periodo_academico": "2026B",
      "estado": "Inactiva"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar matricula por id
    Given url baseUrl + '/matricula/' + matriculaId
    When method delete
    Then status 200
    And print response
