SELECT
		tp.TenantId,tp.PropertyId,tp.StartDate AS tenant_start_date,tp.EndDate AS tenant_end_date,tp.PaymentFrequencyId, tp.PaymentAmount AS rental_payment_amount , tpf.Name rental_payment_freq,		
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
	  PropertyExpense pe ON tp.PropertyId = pe.PropertyId
	  LEFT JOIN
	  PropertyFinance pf ON tp.PropertyId = pf.PropertyId 
WHERE OwnerId = 1426



