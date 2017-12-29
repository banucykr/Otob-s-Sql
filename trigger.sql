use Bus_automation
--Silinen yolcu i�in yeni tablo yapma
go
create trigger PassengerDelete on Passengers
after delete
as begin
if(exists(select * from deleted where Gender=0 ))
begin
raiserror('Kad�n yolcu silemezsin!!',0,0)
rollback transaction
end
end

delete from Passengers where Gender=0

-- Bilet kontrol
go
Create trigger TicketControl on Tickets
after insert
as
if(exists(Select * from inserted,Tickets where inserted.TicketId = Tickets.TicketId and
Tickets.SeatNumber>=45 ))
begin
  raiserror('�zg�n�z b�yle bir numara yok',1,1);
  rollback transaction
End

