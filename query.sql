-- name: GetClient :one
SELECT * FROM clients
WHERE id_client = $1 LIMIT 1;

-- name: ListClients :many
SELECT * FROM clients
ORDER BY name;

-- name: CreateClient :one
INSERT INTO clients (name, lastName, email, phone)
VALUES ($1, $2, $3, $4)
RETURNING *;

-- name: DeleteClient :exec
DELETE FROM clients
WHERE id_client = $1;