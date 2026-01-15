Feature: CRUD Becas

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def becaId = '6df238bc-bf49-4d2a-94b9-e675f13dbf30'

  Scenario: POST - Crear beca
    Given url baseUrl + '/beca'
    And request
    """
    {
      "nombre_beca": "Beca 5",
      "tipo_beca": "Merito",
      "descripcion": "Beca otorgada a estudiantes con alto rendimiento académico",
      "porcentaje_cobertura": "50.00",
      "monto_maximo": "2000.00",
      "fecha_inicio": "2026-01-01",
      "fecha_fin": "2026-12-31",
      "estado": "Activa"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar becas
    Given url baseUrl + '/beca'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener beca por id
    Given url 'http://localhost:3000/beca/4d13895c-46f8-45b3-99a7-bd8d1d5ccf84'
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar beca por id
    Given url 'http://localhost:3000/beca/2d6a2d96-61a8-4c4f-998a-173eee5906a3'
    And request
    """
    {
      "nombre_beca": "Beca 7 Actualizada",
      "tipo_beca": "Merito",
      "descripcion": "Actualización de la beca por nuevo reglamento",
      "porcentaje_cobertura": "60.00",
      "monto_maximo": "2500.00",
      "fecha_inicio": "2026-01-01",
      "fecha_fin": "2026-12-31",
      "estado": "Activa"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar beca por id
    Given url 'http://localhost:3000/beca/1cd53227-d6bc-4e9c-a7b4-a4b61befa102'
    When method delete
    Then status 200
    And print response
