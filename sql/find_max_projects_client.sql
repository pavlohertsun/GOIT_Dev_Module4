SELECT c.name, COUNT(p.client_id) AS project_count
FROM client c
JOIN project p ON c.id = p.client_id
GROUP BY c.name
HAVING COUNT(p.client_id) = (
    SELECT MAX(project_count)
    FROM (
        SELECT COUNT(client_id) AS project_count
        FROM project
        GROUP BY client_id
    ) AS max_project_count
);