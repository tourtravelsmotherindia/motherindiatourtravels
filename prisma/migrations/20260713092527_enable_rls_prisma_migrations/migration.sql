-- Enable RLS on _prisma_migrations table if it exists
DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = '_prisma_migrations') THEN
        ALTER TABLE "_prisma_migrations" ENABLE ROW LEVEL SECURITY;
    END IF;
END
$$;