-- =========================================
-- Question 1: Who are the registered students in the system?
-- =========================================

SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno';

-- Observation:
-- This query helps identify all active students in the system.


-- =========================================
-- Question 2: Which department does each professor belong to?
-- =========================================

SELECT p.nombre, p.apellido1, p.apellido2, d.nombre AS departamento
FROM persona AS p
JOIN profesor AS pr ON p.id = pr.id_profesor
JOIN departamento AS d ON pr.id_departamento = d.id;

-- Observation:
-- Understanding professor distribution by department can help analyze academic structure.


-- =========================================
-- Question 3: Which professors are not teaching any course?
-- =========================================

SELECT p.nombre, p.apellido1, p.apellido2, p.sexo
FROM persona AS p
JOIN profesor AS pr ON p.id = pr.id_profesor
LEFT JOIN asignatura AS a ON pr.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- Observation:
-- Some professors are not currently assigned to any course,
-- which could indicate underutilization of resources.


-- =========================================
-- Question 4: What is the total number of students?
-- =========================================

SELECT COUNT(*) AS total_alumnos
FROM persona
WHERE tipo = 'alumno';

-- Observation:
-- This provides a general idea of the size of the student population.


-- =========================================
-- Question 5: What courses is a specific student enrolled in?
-- =========================================

SELECT CONCAT_WS(' ', persona.nombre, persona.apellido1, persona.apellido2) AS alumno,
       asignatura.nombre AS asignatura
FROM alumno_se_matricula_asignatura 
JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id 
JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
WHERE alumno_se_matricula_asignatura.id_alumno = 1;

-- Observation:
-- This allows tracking individual student enrollment and academic load.


-- =========================================
-- Question 6: Which professors are teaching each course?
-- =========================================

SELECT a.nombre AS asignatura_nombre,
       CONCAT(p.nombre, ' ', p.apellido1, ' ', COALESCE(p.apellido2, '')) AS profesor
FROM asignatura AS a
LEFT JOIN profesor AS pr ON a.id_profesor = pr.id_profesor
LEFT JOIN persona AS p ON pr.id_profesor = p.id;

-- Observation:
-- This helps understand teaching assignments across courses.


-- =========================================
-- Question 7: Which students are enrolled in a specific course?
-- =========================================

SELECT CONCAT_WS(' ', p.nombre, p.apellido1, COALESCE(p.apellido2, '')) AS alumno,
       a.nombre AS asignatura
FROM persona AS p
INNER JOIN alumno_se_matricula_asignatura AS asma ON p.id = asma.id_alumno
INNER JOIN asignatura AS a ON asma.id_asignatura = a.id
WHERE a.id = 2;

-- Observation:
-- This query helps analyze course demand and student distribution.

-- =========================================
-- Question 8: Which courses have the highest number of students?
-- =========================================

SELECT a.nombre, COUNT(*) AS total_students
FROM alumno_se_matricula_asignatura AS asma
JOIN asignatura AS a ON asma.id_asignatura = a.id
GROUP BY a.nombre
ORDER BY total_students DESC;

-- Observation:
-- Some courses are significantly more popular than others.
