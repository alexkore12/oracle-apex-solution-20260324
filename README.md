# Oracle APEX Solution

Oracle APEX application with PL/SQL procedures and RESTful services via ORDS.

## Setup

1. Connect as SYS to Oracle database
2. Run `setup.sql` to create user, tables, and procedures
3. Enable ORDS for REST services
4. Import application from `app/export/`

## REST Endpoints

- `GET /ords/app_user/app_data/` - List all records
- `GET /ords/app_user/app_data/{id}` - Get single record
- `POST /ords/app_user/app_data/` - Create record
