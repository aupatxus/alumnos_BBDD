# alumnos_BBDD
alumnos_BBDD


## Modelo Entidad-Relación (E/R)
```text
  [CAMPUS] ────────(1:N)────────┐
                                 ▼
  [PROMOCIONES] ───(1:N)───► [EDICION] ◄───(1:N)─── [BOOTCAMP]
                                 │                       │
                               (1:N)                   (1:N)
                                 ▼                       ▼
  [MODALIDADES] ───(1:N)───► [ESTUDIANTES]           [PROYECTOS]
                                 │                       │
                                 └──────► (N:M) ◄────────┘
                                     [calificaciones]

  [PROFESORES] ────(1:1)───► [ASIGNACION_CLAUSTRO]
                                 ▲   ▲   ▲   ▲
       ┌─────────────────────────┘   │   │   └─────────────────────────┐
     (1:N)                         (1:N) (1:N)                       (1:N)
  [CAMPUS]                 [PROMOCIONES] [BOOTCAMP]              [MODALIDADES]
```

## Arquitectura y Tecnologías

* **Python 3**: Procesamiento y limpieza de datos (`pandas`, `numpy`).
* **PostgreSQL**: Sistema gestor de base de datos relacional.
* **SQLAlchemy & Psycopg2**: Conexión, creación de esquema e ingesta de datos desde Jupyter Notebook.
* **pgAdmin 4**: Administración visual y validación de integridad referencial.
* **Render**: Alojamiento cloud de la instancia PostgreSQL en producción.

## Modelo Lógico de la Base de Datos

La base de datos está normalizada en **Tercera Forma Normal (3FN)** y consta de **10 tablas**:

| Tabla | Clave Primaria (PK) | Claves Foráneas (FK) | Descripción |
| :--- | :--- | :--- | :--- |
| **`campus`** | `id_campus` | — | Sedes físicas de la escuela (Madrid, Valencia). |
| **`bootcamp`** | `id_bootcamp` | — | Programas formativos (Data Science, Full Stack). |
| **`modalidades`** | `id_modalidad` | — | Modalidades de impartición (Presencial, Online). |
| **`promociones`** | `id_promocion` | — | Convocatorias y fechas de inicio. |
| **`profesores`** | `id_profesor` | — | Claustro docente y roles (`TA`, `LI`). |
| **`proyectos`** | `id_proyecto` | `id_bootcamp` | Catálogo de los 5 proyectos evaluables por bootcamp. |
| **`edicion`** | `id_edicion` | `id_promocion`, `id_campus`, `id_bootcamp` | Instancia concreta de un bootcamp en un campus y fecha. |
| **`estudiantes`** | `id_estudiante` | `id_edicion` | Alumnos matriculados y su correo electrónico único. |
| **`asignacion_claustro`** | `id_profesor` | `id_promocion`, `id_campus`, `id_bootcamp`, `id_modalidad` | Asignación de cada docente a su edición y modalidad. |
| **`calificaciones`** | `(id_estudiante, id_proyecto)` | `id_estudiante`, `id_proyecto` | Resultados (`Apto` / `No Apto`) de cada alumno por proyecto. |

---
