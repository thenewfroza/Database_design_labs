CREATE MATERIALIZED VIEW mv_users_pseudonymization AS
SELECT
    User_id,
    md5(Name) AS Name,
    md5(Password) AS Password,
    md5(Loggin) AS loggin,
    md5(role) AS role
FROM users;

SELECT * FROM mv_users_pseudonymization;