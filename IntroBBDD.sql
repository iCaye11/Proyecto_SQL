-- Control + Shift + P,  >View: Toggle Word Wrap para ver mejor

-- 1. Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.

SELECT flight_id
FROM flights
WHERE status = 'On Time';




-- 2. Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).

SELECT *
FROM bookings
WHERE total_amount > 1000000;




-- 3. Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.

SELECT *
FROM aircrafts_data;




-- 4. Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)

SELECT flight_id
FROM flights
WHERE aircraft_code = '733';




-- 5. Escribe una consulta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.

SELECT *
FROM tickets
WHERE passenger_name = 'Irina'; 
--No discierne entre mayus y minus

--FORMA CORRECTA:
SELECT *
FROM tickets
WHERE passenger_name ILIKE 'Irina%';
-- ILIKE ignora que sean mayúsculas o minúsculas




-- 6. Mostrar las ciudades con más de un aeropuerto.

SELECT city
FROM airports_data
GROUP BY city
HAVING COUNT (airport_name) > 1;
-- En este caso, se puede cambiar el airport_name por airport_code o coordinates, da el mismo resultado.
-- Ponemos la función de agregación COUNT después del HAVING y GROUP BY porque queremos primero filtrar, agrupar y luego contar.




-- 7. Mostrar el número de vuelos por modelo de avión.ç

SELECT flight_no, COUNT (aircraft_code)
FROM flights
GROUP BY flight_no




-- 8. Reservas con más de un billete (varios pasajeros).

SELECT book_ref
FROM tickets
GROUP BY book_ref
HAVING COUNT(passenger_id) > 1;

-- 9. Vuelos con retraso de salida superior a una hora.

SELECT *
FROM flights
WHERE actual_departure - scheduled_departure > INTERVAL '1 hour';