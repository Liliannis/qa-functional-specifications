# Casos de prueba API - Postman

## Resumen

Estos casos documentan los escenarios principales cubiertos por la colección Postman. Incluyen pruebas positivas, negativas y validaciones básicas de seguridad para una API demo de tienda deportiva.

## Casos cubiertos

| ID | Endpoint | Tipo | Escenario | Resultado esperado |
|---|---|---|---|---|
| API-001 | `POST /api/auth/register` | Positivo | Registro con datos válidos | Usuario creado correctamente y respuesta `201` |
| API-002 | `POST /api/auth/register` | Negativo | Registro con email inválido o datos incompletos | Error de validación y respuesta `400` |
| API-003 | `POST /api/auth/login` | Positivo | Login con credenciales válidas | Respuesta `200` y token de acceso |
| API-004 | `POST /api/auth/login` | Negativo | Login con credenciales inválidas | Error de autenticación y ausencia de token |
| API-005 | `POST /api/auth/reset-password` | Positivo | Solicitud de recuperación con email válido | Solicitud procesada correctamente |
| API-006 | `POST /api/auth/confirm-reset-password` | Negativo | Confirmación con token inválido o expirado | Error de validación |
| API-007 | `GET /api/users/me` | Positivo | Consulta de perfil con Bearer token válido | Datos de perfil retornados correctamente |
| API-008 | `GET /api/users/me` | Negativo | Consulta de perfil sin token | Acceso rechazado con `401` o `403` |
| API-009 | `PUT /api/users` | Positivo | Actualización completa de perfil autenticado | Perfil actualizado correctamente |
| API-010 | `PATCH /api/users` | Positivo | Actualización parcial de perfil autenticado | Campo enviado actualizado correctamente |
| API-011 | `DELETE /api/users` | Positivo | Eliminación de perfil autenticado | Perfil eliminado correctamente |
| API-012 | `PUT /api/users` | Negativo | Actualización de perfil sin token | Acceso rechazado con `401` o `403` |

## Validaciones aplicadas

- Status code esperado por escenario.
- Mensajes de respuesta cuando aplica.
- Presencia de token en login exitoso.
- Ausencia de token en login fallido.
- No exposición de contraseña en respuestas.
- No exposición de stack traces o errores técnicos internos.
- Validación de campos principales del perfil.
- Validación de endpoints protegidos sin token.

## Datos de prueba

Los datos de prueba están separados en archivos JSON dentro de la carpeta `data/`. Esto permite ejecutar escenarios data-driven desde Collection Runner sin modificar manualmente cada request.
