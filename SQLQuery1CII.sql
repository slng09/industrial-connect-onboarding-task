WITH Temp1
AS (
SELECT
		tp.PropertyId,
CASE
	WHEN tp.PaymentFrequencyId = 1 THEN DATEDIFF(WEEK, tp.StartDate,tp.EndDate)*tp.PaymentAmount
	WHEN tp.PaymentFrequencyId = 2 THEN DATEDIFF(WEEK, tp.StartDate,tp.EndDate)*tp.PaymentAmount/2
	WHEN tp.PaymentFrequencyId = 3 THEN DATEDIFF(WEEK, tp.StartDate,tp.EndDate)*12*tp.PaymentAmount/52
END AS TotalAmount, COALESCE(pe.Amount,0) as Amount, pf.CurrentHomeValue

FROM TenantProperty tp
	  LEFT JOIN 
	  TenantPaymentFrequencies tpf ON tp.PaymentFrequencyId = tpf.Id
	  LEFT JOIN
      OwnerProperty op ON tp.PropertyId = op.PropertyId	
	  LEFT JOIN
	  PropertyExpense pe ON tp.PropertyId = pe.PropertyId
	  LEFT JOIN
	  PropertyFinance pf ON tp.PropertyId = pf.PropertyId 
WHERE OwnerId = 1426)
SELECT [PropertyId], (TotalAmount-[Amount])/[CurrentHomeValue]*100 as Yield
FROM Temp1