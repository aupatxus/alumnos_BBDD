-- 1. tabla campus
create table campus (
    id_campus integer primary key,
    ubicacion varchar(50) not null unique
);

-- 2. tabla bootcamp
create table bootcamp (
    id_bootcamp integer primary key,
    codigo varchar(10) not null unique,
    nombre varchar(50) not null unique
);

-- 3. tabla modalidades
create table modalidades (
    id_modalidad integer primary key,
    nombre varchar(50) not null unique
);

-- 4. tabla promociones
create table promociones (
    id_promocion integer primary key,
    nombre varchar(50) not null,
    fecha_comienzo varchar(20) not null
);

-- 5. tabla profesores
create table profesores (
    id_profesor integer primary key,
    nombre varchar(100) not null,
    rol varchar(10) not null
);

-- 6. tabla proyectos
create table proyectos (
    id_proyecto integer primary key,
    id_bootcamp integer not null references bootcamp(id_bootcamp),
    nombre varchar(50) not null
);

-- 7. tabla edicion
create table edicion (
    id_edicion integer primary key,
    id_promocion integer not null references promociones(id_promocion),
    id_campus integer not null references campus(id_campus),
    id_bootcamp integer not null references bootcamp(id_bootcamp)
);

-- 8. tabla estudiantes
create table estudiantes (
    id_estudiante integer primary key,
    id_edicion integer not null references edicion(id_edicion),
    nombre varchar(100) not null,
    email varchar(100) not null unique
);

-- 9. tabla asignacion_claustro
create table asignacion_claustro (
    id_profesor integer primary key references profesores(id_profesor),
    id_promocion integer not null references promociones(id_promocion),
    id_campus integer not null references campus(id_campus),
    id_bootcamp integer not null references bootcamp(id_bootcamp),
    id_modalidad integer not null references modalidades(id_modalidad)
);

-- 10. tabla calificaciones
create table calificaciones (
    id_estudiante integer not null references estudiantes(id_estudiante),
    id_proyecto integer not null references proyectos(id_proyecto),
    calificacion varchar(20) not null,
    primary key (id_estudiante, id_proyecto)
);
