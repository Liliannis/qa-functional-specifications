# Postman - Evidencia de validación API

Esta carpeta contiene evidencia de pruebas API realizadas con Postman sobre una API demo de tienda deportiva.

En esta primera versión, la cobertura se enfoca principalmente en autenticación y perfil de usuario. A futuro, la evidencia puede ampliarse hacia otros módulos de la tienda deportiva, como productos, carrito, órdenes y pagos simulados.

## Alcance actual

| Área | Cobertura actual |
|---|---|
| Autenticación | Registro, login, recuperación y confirmación de contraseña |
| Perfil de usuario | Consulta, actualización total, actualización parcial y eliminación de perfil |
| Seguridad básica | Validación de endpoints protegidos sin token |
| Datos de prueba | Archivos JSON para ejecución data-driven |

## Importante sobre el contexto

Esta evidencia no forma parte directa de las historias de usuario documentadas en las carpetas anteriores del repositorio. Se incluye como evidencia complementaria para demostrar validación API con Postman, manejo de environments, datos externos y escenarios positivos/negativos.

La API no se publica como servicio online. La colección está preparada para ejecutarse contra una API local o demo usando la variable `base_url` del environment.

## Qué demuestra

- Pruebas API data-driven con archivos JSON.
- Escenarios positivos y negativos.
- Validación de status codes y mensajes de respuesta.
- Validación del cuerpo de respuesta.
- Autenticación con Bearer token.
- Generación dinámica de datos de prueba.
- Scripts básicos de validación en JavaScript dentro de Postman.
- Validación de endpoints protegidos sin token.
- Evidencia segura para portfolio, sin datos reales de clientes ni credenciales privadas.

## Archivos incluidos

- `contexto-api.md`: contexto funcional de la API demo usada para las pruebas.
- `casos-api.md`: listado de escenarios positivos y negativos cubiertos.
- `tienda-deportiva-improved.postman_collection.json`: colección Postman mejorada.
- `tienda-deportiva-local.example.postman_environment.json`: environment local de ejemplo sin secretos.
- `data/`: archivos JSON para ejecutar pruebas data-driven con Collection Runner.

## Cómo usarlo

1. Importar la colección en Postman.
2. Importar el environment de ejemplo.
3. Configurar `base_url` con la URL local de la API, por ejemplo `http://localhost:8080`.
4. Configurar `auth_email` y `auth_password` únicamente en tu environment local de Postman si querés ejecutar requests autenticados de perfil.
5. Ejecutar los requests data-driven usando el archivo JSON correspondiente dentro de la carpeta `data/`.

## Nota de privacidad

Esta evidencia usa datos locales/de demostración. No incluye datos de clientes, endpoints productivos, tokens reales, API keys ni información confidencial de negocio.
