@ejercicioCompleto

Feature: Practica en clase

    @id:1
Scenario: texto de prueba consulta texto get
Given url ''
When method Get
Then status 200
And print response

  @id:2
Scenario: texto de prueba consulta texto get
Given url 'http://localhost:3000/contacto'
When method Get
Then status 201
And print response



