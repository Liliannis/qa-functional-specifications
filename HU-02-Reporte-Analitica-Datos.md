# Historia de Usuario: Reporte Analítico y Matriz de Posicionamiento (BI & Data Validation)

**Tipo:** Historia de Usuario (Simulación de Caso Real - Anonimizado)  
**Perfil:** Analista Funcional / QA Analyst  
**Contexto del Sistema:** Módulo de Business Intelligence (BI) y Analítica para una Plataforma Corporativa de Gestión Hotelera Internacional.
Es el módulo de inteligencia de negocio (BI) donde los directivos entran a ver los reportes y tableros con datos.
---

##  Descripción General

**Como:** Analista de Operaciones y Calidad  
**Quiero:** Generar un reporte comparativo semanal con filtros avanzados y capacidades de exportación de datos  
**Para:** Monitorear el posicionamiento competitivo, las calificaciones (ratings) y el análisis de sentimiento de los hoteles del grupo frente a la competencia global.

---

##  Reglas de Negocio (Business Rules)

1. **Origen y Consistencia de Datos:** El reporte se alimenta de un proceso automatizado de ingesta diaria desde una API externa de reseñas de viajes. Las métricas  comparan la "Fecha Actual" seleccionada contra la "Fecha Base" (exactamente 7 días antes).
2. **Lógica de Filtros Avanzados (Frontend & API):** El sistema debe permitir el filtrado cruzado mediante las siguientes variables:
   * **Rango Temporal:** Selector de fechas obligatorias.
   * **Categoría de Alojamiento:** Opciones multiselect (Hotel Resort, Casa Boutique, Albergue Ejecutivo).
   * **Grupo Hotelero:** Filtro dinámico (Cadena Propia Grupo A, Grupo B, Grupo C, Competencia Directa).
   * **Modalidad de Alojamiento:** (Todo Incluido, Solo Desayuno, Pensión Completa).
3. **Fórmulas de Cálculo del Backend (Data Integrity):**
   * **Métrica Dif. (Posicionamiento):** `Ranking (Fecha Base) - Ranking (Fecha Actual)`. Un valor positivo indica una subida en el mercado; un valor negativo indica una caída.
   * **Métrica % Negativos (Análisis de Sentimiento):** `(Total de Comentarios Nuevos de 1 y 2 estrellas / Total de Comentarios Nuevos Recibidos en el periodo) * 100`.
   * **Métrica Publicados 5★:** Sumatoria estricta de registros con calificación igual a 5.0 en el backend durante el rango seleccionado.
4. **Capacidad de Ordenamiento Dinámico:** Todas las columnas de datos calculados deben permitir ordenación asíncrona (`ASC` / `DESC`) mediante clics en el encabezado, sin perder los filtros activos en la sesión.
5. **Exportación de Datos Resiliente:** El reporte final debe exportarse a formato `.xlsx` (Excel). El archivo generado debe heredar exactamente los mismos filtros aplicados en la pantalla y mantener la integridad tipográfica de los datos (las fechas como tipo Date, los porcentajes como Numeric).
6. **Manejo de Estados Vacíos (Empty States):** Si la consulta SQL no retorna registros para la combinación de filtros seleccionada, la interfaz debe suspender la renderización de la tabla y desplegar un componente gráfico de "Sin datos disponibles".
7. **Especificación y Trazabilidad de Datos (Data Mapping Conceptual):**
   * **Nombre de Propiedad:** Provendrá del maestro de datos de Hoteles, combinando el Nombre Comercial del establecimiento con su Grupo Corporativo asignado.
   * **Ranking Regional:** Posición numérica entera que ocupa el hotel en el destino, extraída del módulo de Sincronización de Reseñas.
   * **Dif. de Posición:** Cálculo matemático realizado en el Backend: `[Posición en Fecha Base] - [Posición en Fecha Actual]`. La posición en fecha base será de una semana anterior.
   * **Rating Promedio:** Representa la calificación general histórica acumulada del hotel (ej. 4.5) calculada hasta la "Fecha Actual" seleccionada en el filtro.
   * **Delta Rating (Diferencia):** Cálculo matemático realizado en el Backend: `[Rating Promedio en Fecha Actual] - [Rating Promedio en Fecha Base (7 días antes)]`. Permite visualizar si la reputación del hotel subió o bajó en la última semana.
   * **% de Comentarios Negativos:** Métrica calculada por el Backend bajo la fórmula: `(Total de reseñas de 1 y 2 estrellas recibidas en el periodo / Total de reseñas globales del periodo) * 100`.
   * **Volumen de Reseñas 5★:** Conteo directo en el backend de todas las nuevas opiniones que posean la máxima calificación dentro del rango de fechas activo.

---

##  Precondiciones (Preconditions)
* El usuario se encuentra autenticado con un rol con permisos de lectura en el módulo de BI.
* El proceso ETL o de sincronización de la API de reseñas se ejecutó con éxito en las últimas 24 horas.

---

##  Criterios de Aceptación (Formato Gherkin Avanzado)

### Escenario 1: Generación y Validación de Métricas del Tablero (Carga Exitosa)
**Given** que el Analista de Operaciones se encuentra en el módulo de analítica web  
**When** selecciona el rango de fechas actual, filtra por el consorcio " Grupo Hotelero" y presiona "Aplicar Filtros"  
**Then** el sistema ejecuta una petición `POST` al endpoint `/api/v1/analytics/hotel-positioning`  
**And** la interfaz renderiza la tabla mostrando: *Nombre de Propiedad, Ranking Regional, Diferencia. de Posición, Rating Promedio, Delta Rating, % de Comentarios Negativos y Volumen de Reseñas 5★*  

### Escenario 2: Filtrado Cruzado Específico de Datos
**Given** que el reporte se encuentra desplegado con datos globales de la región  
**When** el usuario restringe los filtros seleccionando la Cadena "Grupo B" y el Tipo de Alojamiento "Todo Incluido"  
**Then** la tabla debe actualizarse de forma dinámica mostrando únicamente los registros que cumplan con ambas condiciones simultáneamente en la base de datos.

### Escenario 3: Exportación de Datos Filtrados a Formato Excel
**Given** que el usuario visualiza una lista filtrada de 15 hoteles en la interfaz  
**When** hace clic en el botón de acción "Exportar a Excel"  
**Then** el sistema inicia la descarga automática de un archivo con extensión `.xlsx`  
**And** los datos del archivo descargado deben coincidir en orden, columnas, registros y formato con los datos presentados en la pantalla de la aplicación.

### Escenario 4: Manejo de Excepciones por Rango de Datos Vacío
**Given** que el analista selecciona un rango de fechas histórico donde no se registraron ingresos ni ingesta de datos de la API externa  
**When** ejecuta la orden de generar el reporte  
**Then** el backend debe responder con un código de estado `200 OK` pero con una colección de datos vacía (`[]`)  
**And** la UI debe ocultar la estructura de la tabla y presentar el mensaje de advertencia controlado: *"No hay datos disponibles para los filtros aplicados"*.

### Escenario 5: Ordenamiento Multidireccional de Columnas Críticas
**Given** que la tabla de posicionamiento muestra datos ordenados por ID de hotel por defecto  
**When** el usuario realiza un clic en el encabezado de la columna "% Negativos"  
**Then** el sistema reordena las filas de mayor a menor porcentaje  
**And** al realizar un segundo clic en el mismo encabezado, el orden se invierte de menor a mayor porcentaje.
