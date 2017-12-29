use Bus_automation

--Sefer y�l�na g�re toplam bilet fiyat�
Select VoyogeId,[2017],[2018],[2019] FROM
(
Select VoyogeId,TicketPrice,YEAR(date) as SeferTarihi from
Voyoge) as VoyogePivot
PIVOT(
Sum(TicketPrice)
For SeferTarihi
IN([2017],[2018],[2019])
)
AS Voyoge_PIVOT

--Bir personel ka� farkl� pozisyonda g�rev yapmaktad�r.
Select Name,[1] As Position,[2] As Position
from
( select EmployeeTypeId,Name,EmployeeId as Personel
FROM Employees
)AS PositionPivot
PIVOT(
Sum(EmployeeTypeID)
FOR Personel
IN( [1],[2]))
AS  Position_PIVOT