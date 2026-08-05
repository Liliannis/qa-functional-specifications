# Tienda Deportiva - Postman API Testing Portfolio Evidence

This folder contains an improved Postman API testing collection for an Auth/Profile service.

## What this demonstrates

- Data-driven testing with JSON files.
- Positive and negative API test scenarios.
- Status code and response message validation.
- Response body validation.
- Bearer token authentication.
- Dynamic test data generation.
- Basic JavaScript test scripts in Postman.
- Protected endpoint validation without token.
- Safe portfolio evidence without client data or private credentials.

## Files

- `tienda-deportiva-improved.postman_collection.json` - Improved Postman collection.
- `tienda-deportiva-local.example.postman_environment.json` - Example local environment without secrets.
- `data/` - JSON data files for Collection Runner.

## How to use

1. Import the collection into Postman.
2. Import the example environment.
3. Set `base_url` to your local API URL, usually `http://localhost:8080`.
4. Set `auth_email` and `auth_password` only in your local Postman environment if you want to run authenticated profile requests.
5. Run data-driven requests with the matching JSON file from the `data/` folder.

## Privacy note

This portfolio evidence uses local/demo data only. It does not include client data, production endpoints, real tokens, API keys, or confidential business information.
