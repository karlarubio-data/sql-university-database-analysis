CREATE DATABASE universidad;
USE universidad;

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE persona (
    id INT PRIMARY KEY,
    identificador VARCHAR(9),
    nombre VARCHAR(25),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25),
    direccion VARCHAR(50),
    telefono VARCHAR(10),
    fecha_nacimiento DATE,
    sexo ENUM('H','M'),
    tipo ENUM('alumno','profesor')
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE grado (
    id_grado INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    creditos FLOAT,
    id_profesor INT,
    id_grado INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_grado) REFERENCES grado(id_grado)
);

CREATE TABLE curso_escolar (
    id INT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    periodo TINYINT
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT,
    id_asignatura INT,
    id_curso_escolar INT,
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
