SELECT
		j.Id,j.JobDescription,j.JobStartDate,j.JobEndDate,j.PaymentAmount,js.Status
FROM 
		Job j
        INNER JOIN 
        JobStatus js ON j.JobStatusId = js.Id

WHERE JobStatusId = 1 
