SELECT
  id,
  password AS "Password",
  MD5(password) AS "MD5"
FROM account;
