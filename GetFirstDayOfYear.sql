/*
************************************************************************************************
QUERY BRIEF: 

** below sql query will return 1st day of the year for the date given as input.
** BELOW QUERY WILL BE CONVERTED INTO STORED_PROCEDURE SHORTLY

** variables info
* InputDate: input given to script 
* mm_part  : will store date after substracting mm part from InputDate
* dd_part  : will store date after substracting dd part from InputDate
************************************************************************************************
*/

--Variables 
declare @InputDate datetime 
declare @mm_part datetime
declare @dd_part datetime

-- setting variables 
--set @InputDate ='2022-1-31' -- <-- make changes here
set @InputDate = GETDATE()
set @dd_part = dateadd(dd,+1-datepart(dd,@InputDate),@InputDate)
set @mm_part = dateadd(mm,+1-datepart(mm,@InputDate),@InputDate)

select 
case 
--case_1 : mm value =1 && dd value =1
when datepart(mm,@InputDate) = 1 and datepart(dd,@InputDate) = 1 
	then datename(dw,@InputDate)
--case_2 mm value =1 && dd value >1
when datepart(mm,@InputDate) = 1 and datepart(dd,@InputDate) > 1 
	then datename(dw,@dd_part)
--case_3 mm value >1 && dd value =1
when datepart(mm,@InputDate) > 1 and datepart(dd,@InputDate) = 1 
	then  datename(dw,@mm_part)
--case_4 mm value >1 && dd value >1
when datepart(mm,@InputDate) > 1 and datepart(dd,@InputDate) > 1 
	then 
	DATENAME(dw,dateadd(dd,+1-datepart(dd,@mm_part),@mm_part))
end 
as GetFirstDayOFYear



