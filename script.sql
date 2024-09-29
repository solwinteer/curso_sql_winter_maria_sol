-- Crear la base de datos
CREATE SCHEMA ClinicaMedica;

-- Usar la base de datos
USE ClinicaMedica;

-- Crear la tabla de pacientes
CREATE TABLE Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del paciente
    nombre VARCHAR(100) NOT NULL, -- Nombre del paciente
    apellido VARCHAR(100) NOT NULL, -- Apellido del paciente
    fecha_nacimiento DATE, -- Fecha de nacimiento del paciente
    direccion VARCHAR(255), -- Direcci�n del paciente
    telefono VARCHAR(20), -- Tel�fono del paciente
    email VARCHAR(100), -- Email del paciente
    genero VARCHAR(100) -- G�nero del paciente
);

-- Crear la tabla de doctores
CREATE TABLE Doctores (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del doctor
    nombre VARCHAR(100) NOT NULL, -- Nombre del doctor
    apellido VARCHAR(100) NOT NULL, -- Apellido del doctor
    especialidad VARCHAR(100) NOT NULL, -- Especialidad principal del doctor
    telefono VARCHAR(20), -- Tel�fono del doctor
    email VARCHAR(100) -- Email del doctor
);

-- Crear la tabla de citas
CREATE TABLE Citas (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID de la cita
    id_paciente INT NOT NULL, -- ID del paciente (clave for�nea)
    id_doctor INT NOT NULL, -- ID del doctor (clave for�nea)
    fecha_hora DATETIME NOT NULL, -- Fecha y hora de la cita
    motivo TEXT, -- Motivo de la cita
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id), -- Relaci�n con Pacientes
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id) -- Relaci�n con Doctores
);

-- Crear la tabla de tratamientos
CREATE TABLE Tratamientos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del tratamiento
    id_paciente INT NOT NULL, -- ID del paciente (clave for�nea)
    id_doctor INT NOT NULL, -- ID del doctor (clave for�nea)
    descripcion TEXT, -- Descripci�n del tratamiento
    fecha_inicio DATE, -- Fecha de inicio del tratamiento
    fecha_fin DATE, -- Fecha de fin del tratamiento
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id), -- Relaci�n con Pacientes
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id) -- Relaci�n con Doctores
);

-- Crear la tabla de diagn�sticos
CREATE TABLE Diagnosticos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del diagn�stico
    id_paciente INT NOT NULL, -- ID del paciente (clave for�nea)
    id_doctor INT NOT NULL, -- ID del doctor (clave for�nea)
    fecha DATE NOT NULL, -- Fecha del diagn�stico
    descripcion TEXT, -- Descripci�n del diagn�stico
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id), -- Relaci�n con Pacientes
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id) -- Relaci�n con Doctores
);

-- Crear la tabla de especialidades
CREATE TABLE Especialidades (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID de la especialidad
    nombre VARCHAR(100) NOT NULL -- Nombre de la especialidad
);

-- Crear la tabla de doctores_especialidades (relaci�n muchos a muchos)
CREATE TABLE Doctores_Especialidades (
    id_doctor INT NOT NULL, -- ID del doctor (clave primaria, clave for�nea)
    id_especialidad INT NOT NULL, -- ID de la especialidad (clave primaria, clave for�nea)
    PRIMARY KEY (id_doctor, id_especialidad), -- Clave primaria compuesta
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id), -- Relaci�n con Doctores
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id) -- Relaci�n con Especialidades
);

-- Crear la tabla HistorialTelefonos para guardar los cambios de tel�fono de los pacientes
CREATE TABLE HistorialTelefonos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del registro de historial
    id_paciente INT, -- ID del paciente cuyo tel�fono ha cambiado
    telefono_anterior VARCHAR(20), -- Tel�fono anterior del paciente
    telefono_nuevo VARCHAR(20), -- Nuevo tel�fono del paciente
    fecha_cambio DATETIME DEFAULT NOW(), -- Fecha y hora del cambio
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id) -- Relaci�n con Pacientes
);

-- Insertar datos en Pacientes
INSERT INTO Pacientes (nombre, apellido, fecha_nacimiento, direccion, telefono, email, genero) VALUES
('Juan', 'P�rez', '1980-05-15', 'Av. Siempre Viva 123', '555-1234', 'juan.perez@example.com', 'Masculino'),
('Mar�a', 'Gonz�lez', '1992-10-30', 'Calle Falsa 456', '555-5678', 'maria.gonzalez@example.com', 'Femenino');

-- Insertar datos en Doctores
INSERT INTO Doctores (nombre, apellido, especialidad, telefono, email) VALUES
('Ana', 'L�pez', 'Cardiolog�a', '555-8765', 'ana.lopez@example.com'),
('Carlos', 'Mart�nez', 'Pediatr�a', '555-4321', 'carlos.martinez@example.com');

-- Insertar datos en Especialidades
INSERT INTO Especialidades (nombre) VALUES
('Cardiolog�a'),
('Pediatr�a'),
('Neurolog�a');

-- Insertar datos en Doctores_Especialidades
INSERT INTO Doctores_Especialidades (id_doctor, id_especialidad) VALUES
(1, 1), 
(2, 2);

-- Insertar datos en Citas
INSERT INTO Citas (id_paciente, id_doctor, fecha_hora, motivo) VALUES
(1, 1, '2024-09-05 09:00:00', 'Chequeo general'),
(2, 2, '2024-09-06 10:30:00', 'Consulta pedi�trica');

-- Insertar datos en Tratamientos
INSERT INTO Tratamientos (id_paciente, id_doctor, descripcion, fecha_inicio, fecha_fin) VALUES
(1, 1, 'Tratamiento para hipertensi�n', '2024-01-10', '2024-04-10'),
(2, 2, 'Tratamiento para alergias', '2024-02-15', '2024-03-15');

-- Insertar datos en Diagnosticos
INSERT INTO Diagnosticos (id_paciente, id_doctor, fecha, descripcion) VALUES
(1, 1, '2024-03-01', 'Diagn�stico de hipertensi�n leve'),
(2, 2, '2024-02-20', 'Diagn�stico de alergia estacional');