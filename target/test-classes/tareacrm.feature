Feature: CRUD Tarea CRM

  Background:
    * def baseUrl = 'http://localhost:3000'

  Scenario: POST - Crear tarea
    Given url 'http://localhost:3000/tareas'
    And request
    """
    {
  "id_empleado": "5f8b48e1-5fe2-43a8-9a52-a5fdb2081375",
  "id_cliente": "4473ed20-e685-4d7d-aa3a-cf09e56d9957",
  "descripcion": "Seguimiento al cliente para una entrevista",
  "fecha_vencimiento": "2025-12-25"
    }
    """
    When method post
    Then status 201
    And print response


  Scenario: GET - Listar tareas
    Given url 'http://localhost:3000/tareas'
    When method get
    Then status 200
    And print response


  Scenario: GET by id - Obtener tarea por id

    Given url 'http://localhost:3000/tareas/c6bfa4fd-7714-4f41-9429-4b03d1e523c4'
    When method get
    Then status 200
    And print response


  Scenario: PUT - Actualizar tarea por id

    Given url 'http://localhost:3000/tareas/4e2b0d66-b422-433c-ab69-467bb1dc7a54'
    And request
    """

{
  "id_empleado": "5f8b48e1-5fe2-43a8-9a52-a5fdb2081375",
  "id_cliente": "4473ed20-e685-4d7d-aa3a-cf09e56d9957",
  "descripcion": "Seguimiento al cliente para aprobación beca",
  "fecha_vencimiento": "2025-12-25"

}
    """
    When method put
    Then status 200
    And print response


  Scenario: DELETE - Eliminar tarea por id

    Given url 'http://localhost:3000/tareas/56815f39-73fa-4294-800f-578dff6c3c68'
    When method delete
    Then status 200
    And print response
