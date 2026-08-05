# BUG-002 - Exportación no respeta filtros aplicados

> Defecto simulado para portfolio, derivado de reglas de negocio anonimizadas.

## Severidad
Media

## Prioridad
Alta

## HU relacionada
HU-02 - Reporte analítico y validación de datos

## Descripción

La exportación del reporte incluye registros que no coinciden con los filtros aplicados en pantalla.

## Pasos para reproducir

1. Abrir dashboard regional.
2. Aplicar filtros combinados por tipo de propiedad, competidor y categoría.
3. Verificar registros visibles en pantalla.
4. Exportar el reporte.
5. Comparar archivo exportado contra pantalla.

## Resultado esperado

El archivo exportado debe contener exactamente los mismos registros visibles bajo los filtros aplicados.

## Resultado obtenido

El archivo exportado incluye registros adicionales fuera de los criterios seleccionados.

## Impacto

Riesgo de toma de decisiones con información inconsistente y perdida de confianza en reportes descargados.

## Recomendacion QA

Validar que frontend y servicio de exportación usen los mismos parámetros de filtrado. Agregar caso de regresión para exportaciones filtradas.
