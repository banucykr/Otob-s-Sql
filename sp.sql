use Bus_automation
go
CREATE Procedure sp_PassengerInsert
(
@PassengerId int, 
@Name nvarchar(50),
@Lastname nvarchar(50),
@Email nvarchar(50),
@Phone nvarchar(50),
@Gender bit,
@CityId int
)
WITH ENCRYPTION
AS
IF EXISTS(SELECT * FROM Passengers WHERE  PassengerId=@PassengerId)
BEGIN 
PRINT 'Sistemde id numarasý mevcuttur!'
END
ELSE
BEGIN
INSERT INTO Passengers VALUES (@Name,
@Lastname,@Email,@Phone,@Gender,
@CityId)
END


------------------------------------------------
--Otobüs için toplanan ücret
go
CREATE Procedure sp_totalucret
( @Pay money )
WITH ENCRYPTION
AS
BEGIN
Select SUM(Pay) as Total_Ucret FROM Ticket_Details where Pay=@Pay 
END



