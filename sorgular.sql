use Bus_automation

--1#
select  c.CityName,Count(*),t.TicketId from Cities c,Ticket_Details t,Passengers p
where t.PassengerId=p.PassengerId and
c.CityId=p.CityId   group by c.CityName,t.TicketId
--4#
select PassengerId ,Count(Discount) from Ticket_Details
where Discount!=0 group by PassengerId

--6#
select  c.CityName,Count(*),p.PassengerId from Cities c,Ticket_Details t,Passengers p
where t.PassengerId=p.PassengerId and
c.CityId=p.CityId  and TransactionTime>=DateAdd(week,-1,GETDATE()) and TransactionTime<=getdate()
group by p.PassengerId

--7#
select Count(IsCancel) as ÝptalEdilenSefer from Voyoge
where IsCancel=1 and Date>=DateAdd(week,-1,GETDATE()) and Date<=getdate() 
--8#
select Count(IsCancel)as ÝptalEdilenSefer,DepartureCityId as Sehirler from Voyoge
where IsCancel=1  group by DepartureCityId
--2#
select c.CityName,p.PassengerId,Count(p.PassengerId) as ZiyaretciSayýsý from Cities c,Passengers p
where c.CityId=p.CityId
and c.CityName='Manisa' group By c.CityName,p.PassengerId

--3#
select  (
select Count(*)  from Passengers p,Tickets ts,Ticket_Details t,Voyoge v
where p.PassengerId=t.PassengerId
and t.VoyogeId=v.VoyogeId 
and ts.PassengerGender=0 and v.Date>=DateAdd(week,-2,GETDATE()) and v.Date<=getdate() 
)/
(select Count(*)  from Passengers p,Tickets ts,Ticket_Details t,Voyoge v
where p.PassengerId=t.PassengerId
and t.VoyogeId=v.VoyogeId 
and ts.PassengerGender=1 and v.Date>=DateAdd(week,-2,GETDATE()) and v.Date<=getdate() 
)

--5#
