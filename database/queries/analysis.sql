#a)	Listado con nombre y apellidos de todos los alumnos.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno';


#b)	Listado de los profesores junto con el nombre del departamento al que están vinculados.
SELECT p.nombre, p.apellido1, p.apellido2, d.nombre AS departamento
FROM persona AS p
JOIN profesor AS pr ON p.id = pr.id_profesor
JOIN departamento AS d ON pr.id_departamento = d.id;

#c)	Listado con los profesores que no imparten ninguna asignatura. El listado debe devolver Nombre, apellido y sexo.
SELECT p.nombre, p.apellido1, p.apellido2, p.sexo
FROM persona AS p
JOIN profesor AS pr ON p.id = pr.id_profesor
LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor
WHERE a.id IS NULL;

#d)	Devuelve el número total de alumnos.
SELECT COUNT(*) AS total_alumnos
FROM persona
WHERE tipo = 'alumno';

#e)	Listado de todas las asignaturas de un alumno en particular.
SELECT CONCAT_WS('', persona.nombre, persona.apellido1, persona.apellido2) AS Alumno, asignatura.nombre AS Asignatura
FROM alumno_se_matricula_asignatura 
JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id 
JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
WHERE alumno_se_matricula_asignatura.id_alumno = 1;


#f)	Listado de todas las asignaturas con el nombre y apellidos del profesor que las imparte.
SELECT a.nombre AS asignatura_nombre,
       CONCAT(p.nombre, ' ', p.apellido1, ' ', COALESCE(p.apellido2, '')) AS profesor_nombre_completo
FROM asignatura AS a
LEFT JOIN profesor AS pr ON a.id_profesor = pr.id_profesor
LEFT JOIN persona AS p ON pr.id_profesor = p.id;


#g)Listado de alumnos(nombre y apellido), que cursan una asignatura en particular.
SELECT CONCAT_WS('', p.nombre, p.apellido1, COALESCE(p.apellido2, '')) AS Alumno,
       a.nombre AS Asignatura
FROM persona AS p
INNER JOIN alumno_se_matricula_asignatura AS asma ON p.id = asma.id_alumno
INNER JOIN asignatura AS a ON asma.id_asignatura = a.id
WHERE a.id = 2;

