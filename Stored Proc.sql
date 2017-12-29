--Store Procedure

create Procedure CityInsert(
@CityName nvarchar(50))
as insert into Cities (CityName) values(@CityName)


go
create Procedure CityUpdate(
@CityName nvarchar(50),@CityId int)
as
Update Cities set CityName=@CityName WHERE CityId=@CityId

go
create Procedure CityDelete(
@CityId int)
as
Delete from Cities WHERE CityId=@CityId



go
create Procedure CityDetails(
@CityId int)
as
Select * from Cities WHERE CityId=@CityId


go
create Procedure CityList
as
Select * from Cities 