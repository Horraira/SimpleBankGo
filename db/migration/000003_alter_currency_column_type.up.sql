-- Change balance from varchar to bigint
ALTER TABLE account
  ALTER COLUMN balance TYPE bigint USING balance::bigint;