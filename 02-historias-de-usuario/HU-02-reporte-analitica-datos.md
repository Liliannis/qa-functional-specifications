# HU-02 - Reporte analitico y matriz de posicionamiento

## Información general

| Campo | Valor |
|---|---|
| Numero | HU-02 |
| Usuario | Analista de Operaciones y Calidad |
| Nombre de historia | Reporte analitico y matriz de posicionamiento |
| Prioridad | Alta |
| Riesgo en desarrollo | Medio |
| Puntos estimados | 8 |
| Iteracion | Sprint 2 |
| Programador responsable | Por asignar |

## Descripción

Como Analista de Operaciones y Calidad, quiero generar un reporte comparativo semanal con filtros avanzados y exportacion de datos, para monitorear el posicionamiento competitivo, las calificaciones y el analisis de sentimiento de los hoteles frente a la competencia global.

## Reglas del negocio

| ID | Regla |
|---|---|
| RN-01 | El reporte se alimenta de una ingesta diaria desde una API externa de resenas de viajes. |
| RN-02 | Las metricas comparan la fecha actual seleccionada contra una fecha base exactamente 7 dias anterior. |
| RN-03 | El sistema debe permitir filtrado por rango temporal, categoria de alojamiento, grupo hotelero y modalidad de alojamiento. |
| RN-04 | La diferencia de posicion se calcula como `Ranking Fecha Base - Ranking Fecha Actual`. |
| RN-05 | El porcentaje de comentarios negativos se calcula como `(comentarios 1 y 2 estrellas / total comentarios del periodo) * 100`. |
| RN-06 | El volumen de resenas 5 estrellas cuenta solo registros con calificacion igual a `5.0`. |
| RN-07 | Las columnas calculadas deben permitir ordenamiento asincrono `ASC` y `DESC` sin perder filtros activos. |
| RN-08 | La exportacion `.xlsx` debe heredar exactamente los filtros aplicados en pantalla. |
| RN-09 | Las fechas exportadas deben conservar tipo Date y los porcentajes tipo Numeric. |
| RN-10 | Si la consulta no retorna registros, la UI debe ocultar la tabla y mostrar un estado vacio controlado. |

## Precondiciones

- El usuario esta autenticado con permisos de lectura en el modulo BI.
- El proceso ETL o sincronizacion de API se ejecuto correctamente en las ultimas 24 horas.
- Existen datos disponibles para la fecha actual y fecha base.
- El servicio de reportes y exportacion esta disponible.

## Criterios de aceptación

| ID | Dado | Cuando | Entonces |
|---|---|---|---|
| CA-01 | el analista esta en el modulo de analitica | selecciona rango de fechas, grupo hotelero y aplica filtros | el sistema debe ejecutar una peticion `POST` al endpoint `/api/v1/analytics/hotel-positioning`. |
| CA-02 | el reporte carga correctamente | No aplica | la interfaz debe mostrar nombre de propiedad, ranking regional, diferencia de posicion, rating promedio, delta rating, porcentaje de comentarios negativos y volumen de resenas 5 estrellas. |
| CA-03 | el usuario filtra por cadena hotelera y modalidad de alojamiento | No aplica | la tabla debe actualizarse mostrando solo registros que cumplan ambas condiciones. |
| CA-04 | el usuario visualiza una lista filtrada | hace clic en `Exportar a Excel` | el sistema debe descargar un archivo `.xlsx`. |
| CA-05 | se genera el archivo Excel | No aplica | los datos exportados deben coincidir en orden, columnas, registros y formato con los datos presentados en pantalla. |
| CA-06 | el usuario selecciona un rango historico sin datos | genera el reporte | el backend debe responder `200 OK` con coleccion vacia `[]`. |
| CA-07 | no hay datos disponibles | No aplica | la UI debe ocultar la tabla y mostrar el mensaje `No hay datos disponibles para los filtros aplicados`. |
| CA-08 | la tabla muestra datos por defecto | el usuario hace clic en `% Negativos` | el sistema debe ordenar de mayor a menor porcentaje. |
| CA-09 | el usuario hace un segundo clic en `% Negativos` | No aplica | el sistema debe invertir el orden de menor a mayor. |
| CA-10 | se calcula la diferencia de posicion | No aplica | el backend debe aplicar `Ranking Fecha Base - Ranking Fecha Actual`. |
| CA-11 | se calcula el porcentaje de comentarios negativos | No aplica | el backend debe aplicar `(comentarios 1 y 2 estrellas / total comentarios del periodo) * 100`. |
| CA-12 | se calcula volumen de resenas 5 estrellas | No aplica | el backend debe contar solo registros con calificacion igual a `5.0` dentro del rango seleccionado. |

## Información adicional

| Tema | Detalle |
|---|---|
| Tipo | Historia de Usuario - escenario anonimizado para portfolio |
| Perfil documentador | Analista Funcional / QA Analyst |
| Contexto del sistema | Modulo BI y analitica para plataforma corporativa de gestion hotelera internacional |
| Categorias | Hotel Resort, Casa Boutique, Albergue Ejecutivo |
| Grupos | Cadena propia Grupo A, Grupo B, Grupo C, Competencia Directa |
| Modalidades | Todo Incluido, Solo Desayuno, Pension Completa |
| Riesgo funcional | Metricas incorrectas, filtros inconsistentes, exportaciones no confiables o decisiones basadas en datos erroneos |
