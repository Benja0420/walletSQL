--Poblar monedas
INSERT INTO money(currency_name, currency_symbol) VALUES ('Peso Chileno', 'CLP');
INSERT INTO money(currency_name, currency_symbol) VALUES ('Dolar', 'USD');
INSERT INTO money(currency_name, currency_symbol) VALUES ('Euro', 'EUR');


--poblar usuarios
INSERT INTO user(name, email, password, balance, symbol) VALUES ('Juan', 'juan@email.cl', 'password', 9999999, 1);
INSERT INTO user(name, email, password, balance, symbol) VALUES ('Pedro', 'pedro@email.cl', 'password', 9999999, 2);
INSERT INTO user(name, email, password, balance, symbol) VALUES ('Maria', 'mario@email.cl', 'password', 9999999, 3);

--poblar transacciones
INSERT INTO transaction (sender_user_id, receiver_user_id, amount, transaction_date) VALUES (1, 2, 100, '1999-04-20');
INSERT INTO transaction (sender_user_id, receiver_user_id, amount, transaction_date) VALUES (2, 3, 200, '2021-10-11');


--Consulta para obtener el nombre de la moneda elegida por un usuario específico

SELECT money.currency_name, user.name
FROM user
JOIN money
ON user.symbol = money.currency_id;

-- Consulta para obtener todas las transacciones registradas
SELECT * FROM transaction;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico

SELECT * FROM transaction
WHERE sender_user_id = 1;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico

UPDATE user SET email = 'email@cambiado.cl' WHERE email = 'pedro@email.cl';

--Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)

DELETE FROM transaction WHERE transaction_id = 2;