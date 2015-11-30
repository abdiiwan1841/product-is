DO $$ DECLARE con_name varchar(200); BEGIN SELECT 'ALTER TABLE idn_oauth1a_request_token DROP CONSTRAINT ' || tc .constraint_name || ';' INTO con_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name = 'um_role_permission' AND ccu.table_name='um_permission' LIMIT 1; EXECUTE con_name; END $$;

DO $$ DECLARE con_name varchar(200); BEGIN SELECT 'ALTER TABLE idn_oauth1a_request_token DROP CONSTRAINT ' || tc .constraint_name || ';' INTO con_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name = 'um_user_permission' AND ccu.table_name='um_permission' LIMIT 1; EXECUTE con_name; END $$;

DO $$ DECLARE con_name varchar(200); BEGIN SELECT 'ALTER TABLE idn_oauth1a_request_token DROP CONSTRAINT ' || tc .constraint_name || ';' INTO con_name FROM information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name = 'um_hybrid_user_role' AND ccu.table_name='um_hybrid_role' LIMIT 1; EXECUTE con_name; END $$;

ALTER TABLE UM_ROLE_PERMISSION ADD FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE;
ALTER TABLE UM_USER_PERMISSION ADD FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE;
ALTER TABLE UM_HYBRID_USER_ROLE ADD FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_HYBRID_ROLE(UM_ID, UM_TENANT_ID) ON DELETE CASCADE;