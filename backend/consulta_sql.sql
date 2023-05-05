-- a. Cantidad de personas que han reservado vuelos con un valor mayor a 5.000.000

SELECT company_name AS Compañia, count(person_name) AS Clientes    
    FROM company AS c
    INNER JOIN client AS Cliente
        ON c.company_id = Cliente.company_id
    INNER JOIN invoice AS Factura
        ON Cliente.client_id = Factura.client_id
    WHERE Factura.total_price > 5000000

-- b. Personas que han reservado y han hecho el pago en efectivo

SELECT company_name AS Compañia, person_name AS Cliente, payment_method AS Metodo_de_pago
    FROM company AS c
    INNER JOIN client AS Cliente
        ON c.company_id = Cliente.company_id
    INNER JOIN invoice AS Factura
        ON Cliente.client_id = Factura.client_id
    WHERE Factura.payment_method = 'Efectivo'

-- c. Personas mayores a 40 años y que viven en la ciudad de bogotá.

SELECT person_name AS Cliente, age AS Edad, city AS Ciudad
    FROM client AS Cliente
    INNER JOIN person AS Persona
        ON Cliente.person_id = Persona.person_id
    INNER JOIN address AS Direccion
        ON Persona.address_id = Direccion.address_id
    WHERE Persona.age > 40 AND Direccion.city = 'Bogotá'

-- d. Listar los tipos de viajes turisticos y de negocios, que se han hecho con pago con tarjeta de credito

SELECT trip_name AS Viaje, type_name AS Tipo, payment_method AS Metodo_de_pago
    FROM trip AS Viaje
    INNER JOIN trip_type AS Tipo
        ON Viaje.type_id = Tipo.type_id
    INNER JOIN invoice AS Factura
        ON Viaje.trip_id = Factura.trip_id
    WHERE (Tipo.type_name = 'Turismo' OR Tipo.type_name = "Negocios") 
        AND Viaje.state = 'Finalizado'
        AND Factura.payment_method = 'Tarjeta de credito' 

-- e. Listar los viajes activos y cancelados.

SELECT trip_name AS Viaje, state AS Estado
    FROM trip AS Viaje
    WHERE Viaje.state = 'Activo' OR Viaje.state = 'Cancelado'