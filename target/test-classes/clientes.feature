Feature: CRUD Tarea CRM

  Background:
    * def baseUrl = 'http://localhost:3000'

  Scenario: POST - Crear tarea
    Given url baseUrl + '/tarea'
    And request
    """
    {
      "id_empleado": "1b657f3a-9483-42f8-b46a-639d40973902",
      "id_cliente": "3bfa81de-c25d-4aad-a3c7-4e800b4086cc",
      "descripcion": "Seguimiento al cliente para una entrevista",
      "fecha_vencimiento": "2025-12-25"
    }
    """
    When method post
    Then status 201
    And print response


  Scenario: GET - Listar tareas
    Given url baseUrl + '/tarea'
    When method get
    Then status 200
    And print response


  Scenario: GET by id - Obtener tarea por id
    * def tareaId = '8e2d9a4f-6b3a-4d9b-b4b2-1c3a9f9a1234'

    Given url baseUrl + '/tarea/' + tareaId
    When method get
    Then status 200
    And print response


  Scenario: PUT - Actualizar tarea por id
    * def tareaId = '8e2d9a4f-6b3a-4d9b-b4b2-1c3a9f9a1234'

    Given url baseUrl + '/tarea/' + tareaId
    And request
    """
    {
      "id_empleado": "1b657f3a-9483-42f8-b46a-639d40973902",
      "id_cliente": "3bfa81de-c25d-4aad-a3c7-4e800b4086cc",
      "descripcion": "Confirmar entrevista y enviar recordatorio",
      "fecha_vencimiento": "2025-12-28"
    }
    """
    When method put
    Then status 200
    And print response


  Scenario: DELETE - Eliminar tarea por id
    * def tareaId = '8e2d9a4f-6b3a-4d9b-b4b2-1c3a9f9a1234'

    Given url baseUrl + '/tarea/' + tareaId
    When method delete
    Then status 200
    And print response
