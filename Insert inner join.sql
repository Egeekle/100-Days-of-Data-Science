USE dsrp_universidad;
Go

-- Insertar datos TABLA ESPECIALIDADES
SELECT*FROM especialidades;
EXEC sp_help especialidades;

INSERT INTO especialidades VALUES ('INGENIERÍA DE SISTEMAS','2020-08-15',1,10);
INSERT INTO especialidades VALUES ('INGENIERÍA INDUSTRIAL','2020-07-15',1,10);
INSERT INTO especialidades VALUES ('INGENIERÍA CIVIL','2018-08-15',1,10);
INSERT INTO especialidades VALUES ('INGENIERÍA DE MINAS','2023-08-15',0,10);

-- Insertar tabla ALUMNOS
SELECT*FROM alumnos;
EXEC sp_help alumnos;

INSERT INTO alumnos(nombres,apellido_paterno,apellido_materno,numero_documento,codigo,fecha_ingreso,estado,email,
fecha_nacimiento,genero,celular,direccion,especialidad_id) 
VALUES 
 ('Luis','Rivera','Vergaray','12345697','23125020005','2023-08-15',1,'luis@gmail.com',NULL,'M','123456111','Lima-Peru',4),
 ('Juan','Lopez','perez','12345610','23125020003','2023-08-15',1,'juan@gmail.com',NULL,'M','123456798','Trujillo-La libertad',5),
 ('Pepe','perez','perez','12345611','23125020004','2023-08-15',1,'pepe@gmail.com',NULL,'M','987654321','Arequipa',2);

 -- SELECT
 --Listar los estudiantes por especialidad, considerando nombres completos,numero de documento, email, nombre de especialidad y 
 -- el estado de la especialidad.

 -- nivel 1
 SELECT nombres, apellido_paterno, apellido_materno, numero_documento,email
 FROM alumnos;

 SELECT nombre, estados
 FROM especialidades;
 -- nivel 2

 SELECT UPPER(CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno)) AS 'nombres_completos',numero_documento,email
 FROM alumnos;

 SELECT nombre AS 'nombre_especialidad',
 CASE WHEN estados=1 THEN 'activo' ELSE 'inactivo' END AS 'estado'
 FROM especialidades;

 -- nivel 3

 SELECT UPPER(CONCAT(alumnos.nombres,' ',alumnos.apellido_paterno,' ',alumnos.apellido_materno)) AS 'nombres_completos',
 alumnos.numero_documento,alumnos.email,especialidades.nombre AS 'nombre_especialidad',
 CASE WHEN especialidades.estados=1 THEN 'activo' ELSE 'inactivo' END AS 'estado'
 FROM especialidades 
 INNER JOIN alumnos ON especialidades.id=alumnos.especialidad_id;

 SELECT UPPER(CONCAT(a.nombres,' ',a.apellido_paterno,' ',a.apellido_materno)) AS 'nombres_completos',
 a.numero_documento,a.email,e.nombre AS 'nombre_especialidad',
 CASE WHEN e.estados=1 THEN 'activo' ELSE 'inactivo' END AS 'estado'
 FROM especialidades AS e
 INNER JOIN alumnos AS a ON e.id=a.especialidad_id;

 -- INSERTAR DATOS TABLA DOCENTES

SELECT*FROM docentes;
EXEC sp_help docentes;

INSERT INTO docentes VALUES 
('Hector','rios','perez','1975-12-12','22221115','2023-08-15'),
('Juan','granados','perez',NULL,'22223333','2023-08-15'),
('Luis','flores','flores',NULL,'24421111','2023-08-15');

-- SENTENCIA UPDATE

UPDATE docentes SET fecha_nacimiento= '2023-08-15'
WHERE id=3;

-- SENTENCIA DELETE

DELETE FROM docentes WHERE id=11;

