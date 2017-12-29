use Bus_automation

go
create function Tahmini_Varis_Suresi
(
	@Departure time,
	@Arrival time
)
returns time
	begin
		return @Arrival-@Departure; 
	end



