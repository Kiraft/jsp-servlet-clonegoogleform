CREATE TABLE preguntas (
    id SERIAL PRIMARY KEY,
    pregunta VARCHAR(255) NOT NULL,
    status BOOLEAN NOT NULL,
);

CREATE TABLE respuesta (
    id SERIAL PRIMARY KEY,
    id_pregunta INT NOT NULL,
    respuesta VARCHAR(255) NOT NULL,
    votaciones INT NOT NULL,
    FOREIGN KEY (id_pregunta) REFERENCES preguntas(id)
);