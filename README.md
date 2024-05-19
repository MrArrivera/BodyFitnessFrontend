# body_fitness_frontend

A new Flutter project.

Instalacion proyecto

Comandos back
npm init -y #Creacion del nodejs package.json(ya se creo no ocupa hacerse)
npm i express morgan pg #Descarga de dependencias

#Creacion de tabla y usuarios default:
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

INSERT INTO users (name, password)
    VALUES('Andres', '12345'),
    ('Alexis', '12345');

#Template del .env
DB_USER = postgres
DB_HOST = localhost
DB_PASSWORD = 1234
DB_DATABASE = bodyfitness
DB_PORT = 5432

PORT = 3000


