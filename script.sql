-- Crear la base de datos
CREATE DATABASE ClinicaMedica;

-- Usar la base de datos
USE ClinicaMedica;

-- Crear la tabla de pacientes
CREATE TABLE Pacientes (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID del paciente
    nombre VARCHAR(100) NOT NULL, -- Nombre del paciente
    apellido VARCHAR(100) NOT NULL, -- Apellido del paciente
    fecha_nacimiento DATE, -- Fecha de nacimiento del paciente
    direccion VARCHAR(255), -- Dirección del paciente
    telefono VARCHAR(20), -- Teléfono del paciente
    email VARCHAR(100), -- Email del paciente
    genero VARCHAR(100) -- Género del paciente
);

-- Crear la tabla de doctores
CREATE TABLE Doctores (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID del doctor
    nombre VARCHAR(100) NOT NULL, -- Nombre del doctor
    apellido VARCHAR(100) NOT NULL, -- Apellido del doctor
    especialidad VARCHAR(100) NOT NULL, -- Especialidad principal del doctor
    telefono VARCHAR(20), -- Teléfono del doctor
    email VARCHAR(100) -- Email del doctor
);

-- Crear la tabla de citas
CREATE TABLE Citas (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID de la cita
    id_paciente INT NOT NULL, -- ID del paciente (clave foránea)
    id_doctor INT NOT NULL, -- ID del doctor (clave foránea)
    fecha_hora DATETIME NOT NULL, -- Fecha y hora de la cita
    motivo TEXT, -- Motivo de la cita
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id), -- Relación con Pacientes
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id) -- Relación con Doctores
);

-- Crear la tabla de tratamientos
CREATE TABLE Tratamientos (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID del tratamiento
    id_paciente INT NOT NULL, -- ID del paciente (clave foránea)
    id_doctor INT NOT NULL, -- ID del doctor (clave foránea)
    descripcion TEXT, -- Descripción del tratamiento
    fecha_inicio DATE, -- Fecha de inicio del tratamiento
    fecha_fin DATE, -- Fecha de fin del tratamiento
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id), -- Relación con Pacientes
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id) -- Relación con Doctores
);

-- Crear la tabla de diagnósticos
CREATE TABLE Diagnosticos (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID del diagnóstico
    id_paciente INT NOT NULL, -- ID del paciente (clave foránea)
    id_doctor INT NOT NULL, -- ID del doctor (clave foránea)
    fecha DATE NOT NULL, -- Fecha del diagnóstico
    descripcion TEXT, -- Descripción del diagnóstico
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id), -- Relación con Pacientes
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id) -- Relación con Doctores
);

-- Crear la tabla de especialidades
CREATE TABLE Especialidades (
    id INT IDENTITY(1,1) PRIMARY KEY, -- ID de la especialidad
    nombre VARCHAR(100) NOT NULL -- Nombre de la especialidad
);

-- Crear la tabla de doctores_especialidades (relación muchos a muchos)
CREATE TABLE Doctores_Especialidades (
    id_doctor INT NOT NULL, -- ID del doctor (clave primaria, clave foránea)
    id_especialidad INT NOT NULL, -- ID de la especialidad (clave primaria, clave foránea)
    PRIMARY KEY (id_doctor, id_especialidad), -- Clave primaria compuesta
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id), -- Relación con Doctores
    FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id) -- Relación con Especialidades
);