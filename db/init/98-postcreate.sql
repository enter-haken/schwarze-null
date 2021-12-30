CREATE OR REPLACE FUNCTION metadata_trigger() RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := now();
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

-- add created_at and updated_at columns to every table
-- and add update trigger to every table

DO $$
DECLARE
    row record;
    current_table TEXT;
    sql TEXT;
BEGIN
    FOR row IN SELECT tablename FROM pg_tables WHERE schemaname = 'public'
    LOOP
        EXECUTE 'ALTER TABLE "' || row.tablename ||
            '" ADD COLUMN created_at timestamp NOT NULL DEFAULT NOW();';

        EXECUTE 'ALTER TABLE "' || row.tablename ||
            '" ADD COLUMN updated_at timestamp NOT NULL DEFAULT NOW();';
        
        EXECUTE 'CREATE TRIGGER ' || row.tablename || '_metadata_trigger BEFORE UPDATE ON "' || row.tablename ||
            '" FOR EACH ROW EXECUTE PROCEDURE metadata_trigger();';
    END LOOP;
END
$$ LANGUAGE plpgsql;
