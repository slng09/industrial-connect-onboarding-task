SELECT
	p.Name, op.PropertyId, phv.Value
FROM
	Property p
	LEFT JOIN
    OwnerProperty op ON p.Id = op.PropertyId
	LEFT JOIN
	PropertyHomeValue phv ON p.Id = phv.PropertyId

WHERE op.OwnerId = 1426;