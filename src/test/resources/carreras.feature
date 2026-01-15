Feature: CRUD Carreras

  Background:
    * def baseUrl = 'http://localhost:3000'
    * def carreraId = '54d92610-542d-442c-b753-d753aa8fb51c'

  Scenario: POST - Crear carrera
    Given url baseUrl + '/carrera'
    And request
    """
    {
      "nombre_carrera": "Tecnología en Desarrollo de Software",
      "facultad": "Facultad de Ingeniería y Ciencias Aplicadas",
      "duracion_semestres": 5,
      "nivel_grado": "Tecnología",
      "cupos_disponibles": 80,
      "estado": "1"
    }
    """
    When method post
    Then status 201
    And print response

  Scenario: GET - Listar carreras
    Given url baseUrl + '/carrera'
    When method get
    Then status 200
    And print response

  Scenario: GET by id - Obtener carrera por id
    Given url 'http://localhost:3000/carrera/b102bbd1-08a3-46a4-93ac-08b1174255a0'
    When method get
    Then status 200
    And print response

  Scenario: PUT - Actualizar carrera por id
    Given url 'http://localhost:3000/carrera/0ea3ec25-d09d-453e-98e5-be86a7a92be9'
    And request
    """
    {
      "nombre_carrera": "Carrera de prueba (Actualizada)",
      "facultad": "Prueba",
      "duracion_semestres": 5,
      "nivel_grado": "Tecnología",
      "cupos_disponibles": 60,
      "estado": "1"
    }
    """
    When method put
    Then status 200
    And print response

  Scenario: DELETE - Eliminar carrera por id
    Given url 'http://localhost:3000/carrera/d47905f1-61b6-4e7b-a3c4-d32a71328978'
    When method delete
    Then status 200
    And print response
