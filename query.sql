-- name: GetCliente :one
SELECT * FROM Clients
WHERE ID_Cliente = $1 LIMIT 1;

-- name: ListClientes :many
SELECT * FROM Clients
ORDER BY name;

-- name: CreateCliente :one
INSERT INTO Clients (Name, LastName, Email, Phone)
VALUES ($1, $2, $3, $4)
RETURNING *;

-- name: DeleteCliente :exec
DELETE FROM Clients
WHERE ID_Client = $1;