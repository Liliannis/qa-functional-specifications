# Contexto de la API demo - Tienda deportiva

## Resumen

Esta evidencia corresponde a una API demo de una tienda deportiva. El objetivo es demostrar cómo se validan endpoints REST con Postman usando escenarios positivos, negativos, datos externos y variables de environment.

La cobertura actual está enfocada en autenticación y perfil de usuario. No representa la cobertura completa de una tienda online.

## Sistema bajo prueba

| Elemento | Descripción |
|---|---|
| Tipo de sistema | API REST demo para una tienda deportiva |
| Módulos cubiertos | Autenticación y perfil de usuario |
| Herramienta principal | Postman |
| Tipo de evidencia | Colección, environment y datos JSON para Collection Runner |
| Acceso a la API | Local/demo mediante `base_url`; no se publica una API productiva |

## Endpoints considerados

| Endpoint | Propósito |
|---|---|
| `POST /api/auth/register` | Registrar una persona usuaria |
| `POST /api/auth/login` | Autenticar credenciales y obtener token |
| `POST /api/auth/reset-password` | Solicitar recuperación de contraseña |
| `POST /api/auth/confirm-reset-password` | Confirmar cambio de contraseña |
| `GET /api/users/me` | Consultar perfil autenticado |
| `PUT /api/users` | Actualizar perfil completo |
| `PATCH /api/users` | Actualizar parcialmente el perfil |
| `DELETE /api/users` | Eliminar perfil autenticado |

## Relación con el resto del repositorio

Esta evidencia es complementaria. No está asociada directamente a las historias de usuario funcionales del resto del repositorio.

Se incluye para mostrar una línea adicional de trabajo QA: validación API con Postman, manejo de environments, uso de datos externos y revisión de respuestas.

## Alcance futuro

En una siguiente iteración, la cobertura Postman podría ampliarse hacia módulos propios de una tienda deportiva, por ejemplo:

- productos;
- búsqueda y filtros;
- carrito;
- órdenes;
- pagos simulados;
- validaciones de stock;
- errores de negocio.
