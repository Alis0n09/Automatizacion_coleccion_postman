Feature: CRUD Becas Estudiante

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def becaEstudianteId = '087230a0-734c-490f-8a64-962d8aed2e41'
    * def clienteId = 'dbaa0128-ac52-4b80-85f0-d253932003c7'
    * def becaId = '226c472b-a37e-494e-8e5f-10f3274574bf'

  Scenario: POST - Crear beca estudiante
    Given url baseUrl + '/becas-estudiantes'
    And request
    """
    {
      "id_beca": "#(becaId)",
      "id_cliente": "#(clienteId)",
      "fecha_asignacion": "2026-01-01",
      "periodo_academico": "2025-1",
      "monto_otorgado": "400",
      "estado": "Vigente"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar becas estudiante
    Given url baseUrl + '/becas-estudiantes'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener beca estudiante por id
    Given url baseUrl + '/becas-estudiantes/' + becaEstudianteId
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar beca estudiante por id
    Given url baseUrl + '/becas-estudiantes/' + becaEstudianteId
    And request
    """
    {
      "id_beca": "#(becaId)",
      "id_cliente": "#(clienteId)",
      "fecha_asignacion": "01-01-2026",
      "periodo_academico": "2025-1",
      "monto_otorgado": "500",
      "estado": "Vigente"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar beca estudiante por id
    Given url baseUrl + '/becas-estudiantes/' + becaEstudianteId
    When method delete
    Then status 200
    And print response
