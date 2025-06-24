-- Revert balance from bigint back to varchar
ALTER TABLE account
  ALTER COLUMN balance TYPE varchar USING balance::varchar;
