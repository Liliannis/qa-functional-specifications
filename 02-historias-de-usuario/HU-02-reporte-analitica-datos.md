# HU-02 - Reporte analítico y matriz de posicionamiento

## Información general

| Campo | Valor |
|---|---|
| Número | HU-02 |
| Usuario | Analista de Operaciones y Calidad |
| Nombre de historia | Reporte analítico y matriz de posicionamiento |
| Prioridad | Alta |
| Riesgo en desarrollo | Medio |
| Puntos estimados | 8 |
| Iteracion | Sprint 2 |
| Programador responsable | Por asignar |

## Descripción

Como Analista de Operaciones y Calidad, quiero generar un reporte comparativo semanal con filtros avanzados y exportación de datos, para monitorear el posicionamiento competitivo, las calificaciones y el análisis de sentimiento de los hoteles frente a la competencia global.

## Reglas del negocio

| ID | Regla |
|---|---|
| RN-01 | El reporte se alimenta de una ingesta diaria desde una API externa de reseñas de viajes. |
| RN-02 | Las métricas comparan la fecha actual seleccionada contra una fecha base exactamente 7 días anterior. |
| RN-03 | El sistema debe permitir filtrado por rango temporal, categoría de alojamiento, grupo hotelero y modalidad de alojamiento. |
| RN-04 | La diferencia de posición se calcula como `Ranking Fecha Base - Ranking Fecha Actual`. |
| RN-05 | El porcentaje de comentarios negativos se calcula como `(comentarios 1 y 2 estrellas / total comentarios del período) * 100`. |
| RN-06 | El volumen de reseñas 5 estrellas cuenta solo registros con calificación igual a `5.0`. |
| RN-07 | Las columnas calculadas deben permitir ordenamiento asincrono `ASC` y `DESC` sin perder filtros activos. |
| RN-08 | La exportación `.xlsx` debe heredar exactamente los filtros aplicados en pantalla. |
| RN-09 | Las fechas exportadas deben conservar tipo Date y los porcentajes tipo Numeric. |
| RN-10 | Si la consulta no retorna registros, la UI debe ocultar la tabla y mostrar un estado vacío controlado. |

## Precondiciones

- El usuario está autenticado con permisos de lectura en el módulo BI.
- El proceso ETL o sincronización de API se ejecutó correctamente en las últimas 24 horas.
- Existen datos disponibles para la fecha actual y fecha base.
- El servicio de reportes y exportación está disponible.

## Criterios de aceptación

| ID | Dado | Cuando | Entonces |
|---|---|---|---|
| CA-01 | el analista está en el módulo de analítica | selecciona rango de fechas, grupo hotelero y aplica filtros | el sistema debe ejecutar una petición `POST` al endpoint `/api/v1/analytics/hotel-positioning`. |
| CA-02 | el reporte carga correctamente | el sistema carga el reporte | la interfaz debe mostrar nombre de propiedad, ranking regional, diferencia de posición, rating promedio, delta rating, porcentaje de comentarios negativos y volumen de reseñas 5 estrellas. |
| CA-03 | el usuario filtra por cadena hotelera y modalidad de alojamiento | aplica ambos filtros | la tabla debe actualizarse mostrando solo registros que cumplan ambas condiciones. |
| CA-04 | el usuario visualiza una lista filtrada | hace clic en `Exportar a Excel` | el sistema debe descargar un archivo `.xlsx`. |
| CA-05 | se genera el archivo Excel | finaliza la exportación a Excel | los datos exportados deben coincidir en orden, columnas, registros y formato con los datos presentados en pantalla. |
| CA-06 | el usuario selecciona un rango histórico sin datos | genera el reporte | el backend debe responder `200 OK` con colección vacía `[]`. |
| CA-07 | no hay datos disponibles | el sistema finaliza la consulta | la UI debe ocultar la tabla y mostrar el mensaje `No hay datos disponibles para los filtros aplicados`. |
| CA-08 | la tabla muestra datos por defecto | el usuario hace clic en `% Negativos` | el sistema debe ordenar de mayor a menor porcentaje. |
| CA-09 | el usuario hace un segundo clic en `% Negativos` | hace un segundo clic en `% Negativos` | el sistema debe invertir el orden de menor a mayor. |
| CA-10 | se calcula la diferencia de posición | el sistema calcula la diferencia de posición | el backend debe aplicar `Ranking Fecha Base - Ranking Fecha Actual`. |
| CA-11 | se calcula el porcentaje de comentarios negativos | el sistema calcula el porcentaje de comentarios negativos | el backend debe aplicar `(comentarios 1 y 2 estrellas / total comentarios del período) * 100`. |
| CA-12 | se calcula volumen de reseñas 5 estrellas | el sistema calcula el volumen de reseñas de 5 estrellas | el backend debe contar solo registros con calificación igual a `5.0` dentro del rango seleccionado. |

## Información adicional

| Tema | Detalle |
|---|---|
| Tipo | Historia de Usuario - escenario anonimizado para portfolio |
| Perfil documentador | Analista Funcional / QA Analyst |
| Contexto del sistema | Módulo BI y analítica para plataforma corporativa de gestión hotelera internacional |
| Categorias | Hotel Resort, Casa Boutique, Albergue Ejecutivo |
| Grupos | Cadena propia Grupo A, Grupo B, Grupo C, Competencia Directa |
| Modalidades | Todo Incluido, Solo Desayuno, Pensión Completa |
| Riesgo funcional | Métricas incorrectas, filtros inconsistentes, exportaciones no confiables o decisiones basadas en datos erróneos |
