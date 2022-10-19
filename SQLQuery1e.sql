SELECT
		p.Name AS Property_Name, per.FirstName, per.LastName, tp.PaymentAmount AS rental_payment_amount , tpf.Name rental_payment_freq,
		
CASE
	WHEN tp.PaymentFrequencyId = 1 THEN DATEDIFF(WEEK, tp.StartDate,tp.EndDate)*tp.PaymentAmount
	WHEN tp.PaymentFrequencyId = 2 THEN DATEDIFF(WEEK, tp.StartDate,tp.EndDate)*tp.PaymentAmount/2
	WHEN tp.PaymentFrequencyId = 3 THEN DATEDIFF(WEEK, tp.StartDate,tp.EndDate)*12*tp.PaymentAmount/52
END AS TotalAmount

FROM TenantProperty tp
	  LEFT JOIN 
	  TenantPaymentFrequencies tpf ON tp.PaymentFrequencyId = tpf.Id
	  LEFT JOIN
      OwnerProperty op ON tp.PropertyId = op.PropertyId	
	  LEFT JOIN
	  Property p ON p.Id = op.PropertyId
	  LEFT JOIN
	  Person per ON per.Id = tp.Id
WHERE OwnerId = 1426	