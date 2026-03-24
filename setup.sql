-- Oracle APEX Setup Script
-- Creates application user, tables, and REST services

BEGIN
    -- Create application user
    EXECUTE IMMEDIATE q'{
        CREATE USER app_user IDENTIFIED BY "&APP_PASS"
        DEFAULT TABLESPACE USERS
        QUOTA UNLIMITED ON USERS
    }';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Main data table
CREATE TABLE IF NOT EXISTS app_data (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    entity_name VARCHAR2(255) NOT NULL,
    status VARCHAR2(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    metadata JSON
);
/

-- RESTful service procedure
CREATE OR REPLACE PROCEDURE get_app_data(
    p_status IN VARCHAR2 DEFAULT NULL,
    p_result OUT SYS_REFCURSOR
) AS
BEGIN
    IF p_status IS NULL THEN
        OPEN p_result FOR SELECT * FROM app_data ORDER BY created_at DESC;
    ELSE
        OPEN p_result FOR SELECT * FROM app_data WHERE status = p_status ORDER BY created_at DESC;
    END IF;
END;
/
