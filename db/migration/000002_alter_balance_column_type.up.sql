ALTER TABLE account
  ALTER COLUMN balance TYPE bigint USING balance::bigint;
