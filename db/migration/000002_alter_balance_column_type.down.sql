ALTER TABLE account
  ALTER COLUMN balance TYPE varchar USING balance::varchar;
