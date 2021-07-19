--use bikestores--
/*
===============================
Author: swanand R S 
version: 1
Date: 5-July-2021
Brief: Recursive CTE For factorial 

Desc: Below CTE will give factorial of given number as input.
			 The CTE has two variable as n and n1. 
				n : result of multiplication of previous and current number.
				n1: current number to multuply 

				eg : to find factorial of 4
				when the  CTE enters in the recursive part,
				itter1:
				n1 is 3 and n is 4*3=12
				itter2:
				n1 is 2 and n is 12*2 = 24 
				and so on....

Note: Below code will work only for n>=12. 
		  For integer greate than 11, the value goes beyoned  int range and throws error;
		  Next vesion will solve this issue. 
===============================
*/
--Number to find factorial of 
declare @num bigint =6; -- <-- enter the numbe here 

--Recursive CTE
with RCTE_Factorial(n,n1)
as (

--declare @num1 bigint =n1

select @num  as n, @num as n1                             --Anchor part 

union all 

select (n)*(n1-1),n1-1  from RCTE_Factorial -- Recursive part 

where n1>1                                                 -- Terminating condition
)

--select n as Fact from RCTE_Factorial
select top 1 n as Factorial from RCTE_Factorial
order by n desc

