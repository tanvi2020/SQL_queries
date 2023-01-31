create table Studies(Pname varchar(20),Institute varchar(20),Course varchar(10),Course_Fee int);
insert into Studies values('ANAND','SABHARI','PGDCA',4500);
insert into Studies values('ALTAF','COIT','DCA', 7200);
insert into Studies values('JULIANA','BDPS','MCA',22000);
insert into Studies values('KAMALA','PRAGATHI','DCA', 5000);
insert into Studies values('MARY', 'SABHARI', 'PGDCA', 4500);
insert into Studies values('NELSON', 'PRAGATHI', 'DAP', 6200);
insert into Studies values('PATRICK', 'PRAGATHI', 'DCAP', 5200);
insert into Studies values('QADIR', 'APPLE', 'HDCA', 14000);
insert into Studies values('RAMESH','SABHARI', 'PGDCA',4500);
insert into Studies values('REBECCA','BRILLIANT', 'DCAP', 11000);
insert into Studies values('REMITHA','BDPS', 'DCS',6000);
insert into Studies values('REVATHI', 'SABHARI', 'DAP', 5000);
insert into Studies values('VIJAYA', 'BDPS' ,'DCA', 48000);

SELECT * FROM Studies;


create table Software (Pname varchar(20),Title varchar(20), DEVELOPIN varchar(20),SCOST float, DCOST int,SOLD int)
insert into Software values('MARY', 'README', 'CPP', 300, 1200, 84);
insert into Software values('ANAND', 'PARACHUTES', 'BASIC', 399.95 ,6000 ,43);
insert into Software values('ANAND','VIDEO TITLING', 'PASCAL', 7500 ,16000, 9);
insert into Software values('JULIANA','INVENTORY', 'COBOL', 3000 ,3500 ,0);
insert into Software values('KAMALA','PAYROLL PKG.', 'DBASE', 9000, 20000 ,7);
insert into Software values('MARY','FINANCIAL ACCT.', 'ORACLE', 18000 ,85000, 4);
insert into Software values('MARY','CODE GENERATOR', 'C', 4500, 20000 ,23);
insert into Software values('PATTRICK','README' ,'CPP', 300 ,1200, 84);
insert into Software values('QADIR', 'BOMBS AWAY' ,'ASSEMBLY', 750 ,3000 ,11);
insert into Software values('QADIR', 'VACCINES', 'C',1900, 3100 ,21);
insert into Software values('RAMESH', 'HOTEL MGMT.' ,'DBASE', 13000 ,35000, 4);
insert into Software values('RAMESH', 'DEAD LEE' ,'PASCAL', 599.95, 4500 ,73);
insert into Software values('REMITHA', 'PC UTILITIES', 'C', 725, 5000 ,51);
insert into Software values('REMITHA', 'TSR HELP PKG.','ASSEMBLY', 2500 ,6000, 7);
insert into Software values('REVATHI', 'HOSPITAL MGMT.',' PASCAL',1100, 75000, 2);
insert into Software values('VIJAYA', 'TSR EDITOR','C', 900, 700, 6);

select * from Software;

create table Programmer(Pname varchar(20),DOB date, DOJ date ,Gender varchar(10),PROF1 varchar(10),PROF2 varchar(10),Salary int);
insert into Programmer values('ANAND', '12-Apr-66', '21-Apr-92', 'M','PASCAL', 'BASIC', 3200);
insert into Programmer values('ALTAF' ,'02-Jul-64' ,'13-Nov-90', 'M', 'CLIPPER', 'COBOL', 2800);
insert into Programmer values('JULIANA', '31-Jan-60', '21-Apr-90', 'F', 'COBOL', 'DBASE', 3000);
insert into Programmer values('KAMALA' ,'30-Oct-68' ,'02-Jan-92' ,'F' ,'C' ,'DBASE' ,2900);
insert into Programmer values('MARY' ,'24-Jun-70', '01-Feb-91', 'F', 'CPP', 'ORACLE', 4500);
insert into Programmer values('NELSON', '11-Sep-85', '11-Oct-89', 'M', 'COBOL', 'DBASE', 2500);
insert into Programmer values('PATTRICK' ,'10-Nov-65' ,'21-Apr-90' ,'M' ,'PASCAL' ,'CLIPPER' ,2800);
insert into Programmer values('QADIR', '31-Aug-65', '21-Apr-91', 'M', 'ASSEMBLY', 'C', 3000);
insert into Programmer values('RAMESH' ,'03-May-67' ,'28-Feb-91' ,'M' ,'PASCAL' ,'DBASE' ,3200);
insert into Programmer values('REBECCA', '01-Jan-67', '01-Dec-90', 'F', 'BASIC', 'COBOL', 2500);
insert into Programmer values('REMITHA' ,'19-Apr-70' ,'20-Apr-93' ,'F' ,'C' ,'ASSEMBLY' ,3600);
insert into Programmer values('REVATHI', '02-Dec-69', '02-Jan-92', 'F' ,'PASCAL', 'BASIC', 3700);
insert into Programmer values('VIJAYA','14-Dec-65' ,'02-May-92' ,'F' ,'FOXPRO' ,'C' ,3500);



-- Find out the selling cost AVG for packages developed in Pascal. 
select AVG(SCOST)as Average_SCOST from Software where DEVELOPIN='Pascal';

--Display Names, Ages of all Programmers. 
select Pname,datediff(YY,DOB,GETDATE()) as AGE from Programmer;

--Display the Names of those who have done the DAP Course.
select * from Studies;
select Pname from Studies where Course='DAP';

--Display the Names and Date of Births of all Programmers Born in January. 
select * from Programmer;
select Pname,DOB from Programmer where datename(month,DOB)='January';

--What is the Highest Number of copies sold by a Package?
select * from Software;
select max(SOLD) as Highest_copies_sold from Software;

--Display lowest course Fee.
select * from Studies;
select min(Course_fee) as Lowest_course_FEE from Studies;

--How many programmers done the PGDCA Course?
select count(*) as No_of_programmers from Studies where Course='PGDCA';

--How much revenue has been earned thru sales of Packages Developed in C.
select * from Software;
select sum(SCOST*SOLD) as revenue from Software;

--Display the Details of the Software Developed by Ramesh.
select * from Software where Pname='RAMESH';

--How many Programmers Studied at Sabhari?
select count(*) from Studies where Institute='Sabhari';

--Display details of Packages whose sales crossed the 2000 Mark
select * from Software where (SOLD*SCOST)>20000


--Display the Details of Packages for which Development Cost have been recovered.
select * from Software where SCOST*SOLD >= DCOST;

--What is the cost of the costliest software development in Basic?
select max(DCOST) from Software;

--How many Packages Developed in DBASE?
select count(title) FROM Software where Developin = 'dbase';

--How many programmers studied in Pragathi?
select count(Pname) as Count_Pragathi_programmers from Studies where Institute='Pragathi';

--How many Programmers Paid 5000 to 10000 for their course?
select count(Pname) from Studies where Course_Fee between 5000 and 10000;

--What is AVG Course Fee
select AVG(Course_FEE) from Studies;

--Display the details of the Programmers Knowing C.
select * from Software where DEVELOPIN='C'; 

--How many Programmers know either COBOL or PASCAL.
select * from Programmer where PROF1='PASCAL' OR PROF1='COBOL' OR PROF2='PASCAL' OR PROF2='COBOL';

--How many Programmers Don’t know PASCAL and C 
select * from Programmer where PROF1!='PASCAL' OR PROF1!='COBOL' OR PROF2!='PASCAL' OR PROF2!='COBOL';

--How old is the Oldest Male Programmer.
SELECT max(
case
when Dateadd(Year, datediff(Year, DOB, Getdate()), DOB)>Getdate()
then datediff(YEAR, DOB, getdate()) - 1
else
datediff(YEAR, DOB, Getdate()) end) as AGE
from Programmer;

--What is the AVG age of Female Programmers?
SELECT avg(
case
when dateadd(Year, datediff(YEAR, DOB, getdate()), DOB)>Getdate()
then Datediff(Year, dob, Getdate()) - 1
else
datediff(Year, DOB, getdate()) end) AS AVG_AGE
from Programmer where gender like 'F';

--Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT pname, doj, 
case
when dateadd(year, datediff(YEAR, DOJ, getdate()), DOJ)>getdate()
then datediff(Year, DOJ, getdate()) - 1
else
datediff(YEAR, DOJ, getdate()) end As Experience
from Programmer order by Pname desc;

--Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT Pname, DOB, 
case
when dateadd(year, datediff(YEAR, DOB, getdate()), DOB)>getdate()
then datediff(Year, DOB, Getdate()) - 1
ELSE
datediff(Year, DOB, Getdate()) end As age
from Programmer
where MONTH(DOB)= 12;


--How many Female Programmers are there?
select count(Gender) as No_of_Females from Programmer where Gender='F';

--What are the Languages studied by Male Programmers.
select PROF1,PROF2 from Programmer where Gender='M';

--What is the AVG Salary?
select avg(Salary) as AVG_salary from Programmer;

--How many people draw salary 2000 to 4000?
select count(*) from Programmer where Salary between 2000 and 4000;

--Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from Programmer where PROF1!='ClIPPER' AND PROF1!='COBOL' AND PROF1!='PASCAL' AND PROF2!='CLIPPER' AND PROF2!='COBOL'
AND PROF2!='PASCAL';

--Display the Cost of Package Developed By each Programmer.
select * from Programmer;
select * from Software;
select * from Studies;
SELECT Pname,sum(SCOST) as Cost_of_package from Software group by Pname;

--Display the sales values of the Packages Developed by the each Programmer.
select Pname,sum(SCOST*SOLD) as Sales_values_of_packages from Software group by Pname;

--Display the Number of Packages sold by Each Programmer.
select Pname,sum(SOLD) as No_of_packages_sold from Software group by Pname;

--Display the sales cost of the packages Developed by each Programmer Language wise. 
select DEVELOPIN as Language_wise_Programmer ,sum(SCOST*SOLD) as Sales_cost_of_Package from Software group by DEVELOPIN;

--Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
SELECT DEVELOPIN AS Language_name,AVG(DCOST) AS AVG_DevCOST,AVG(SCOST) AS AVG_sellCOST,AVG(SCOST) AS PRICE_perCOPY
FROM Software GROUP BY DEVELOPIN;

--Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
SELECT Pname As Programmer_NAME,MIN(DCOST) As Cheapest,MAX(DCOST) costliest
FROM Software GROUP BY Pname;

--Display each institute name with number of Courses, Average Cost per Course. 
SELECT Institute ,count(Course) As number_of_Courses, AVG(Course_Fee) AS AVG_cost_per_course
FROM Studies GROUP BY Institute;


--Display each institute Name with Number of Students. 
SELECT Institute ,count(Pname) As Number_of_students
FROM Studies GROUP BY Institute;

--Display Names of Male and Female Programmers. Gender also. 
select Pname, Gender from Programmer;

--Display the Name of Programmers and Their Packages. 
select Pname, Salary from Programmer;

--Display the Number of Packages in Each Language Except C and C++. 
select DEVELOPIN As languages, count(Title) As Number_of_packages 
from Software group by 
DEVELOPIN having DEVELOPIN!='c' and DEVELOPIN!='c++';

--Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select DEVELOPIN As Languages, count(Title) As Number_of_Packages 
from Software where DCOST<1000 group by DEVELOPIN;

--Display AVG Difference between SCOST, DCOST for Each Package. 
select Title As Each_package, Avg(SCOST-DCOST) As Avg_difference
from Software group by Title; 


--Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 
SELECT SUM(SCOST), SUM(DCOST), SUM(DCOST-(SOLD*SCOST)) FROM Software GROUP BY Pname HAVING SUM(DCOST)>SUM(SOLD*SCOST);

--Display Highest, Lowest and Average Salaries for those earning more than 2000. 
SELECT MAX(Salary), MIN(Salary), AVG(Salary)FROM Programmer WHERE Salary > 2000;

--Who is the Highest Paid C Programmers? 
SELECT * FROM Programmer WHERE Salary =(SELECT MAX(Salary) FROM Programmer WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

--Who is the Highest Paid Female COBOL Programmer? 
SELECT * FROM Programmer WHERE Salary=(SELECT MAX(Salary) FROM Programmer WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND gender LIKE 'F';

--Display the names of the highest paid programmers for each Language. 
WITH CTC AS (
  SELECT Pname, Salary, PROF1 AS PROF FROM Programmer
  UNION 
  SELECT Pname, Salary, PROF2 FROM Programmer
)
SELECT p1.Pname, p1.PROF, p1.Salary
FROM CTC as p1
LEFT JOIN CTC as 
p2
  ON p1.PROF = p2.PROF AND p1.Salary < p2.Salary
WHERE p2.Pname IS NULL;

--Who is the least experienced Programmer. 
SELECT min(
case
when dateadd(year, datediff(YEAR, DOJ, getdate()), DOJ)>getdate()
then datediff(YEAR, DOJ, getdate()) - 1
else
datediff(YEAR, DOJ, getdate()) end) As Experience
from Programmer;

--Who is the most experienced male programmer knowing PASCAL. 
SELECT max(
case
when dateadd(year, datediff(YEAR, DOJ, getdate()), DOJ)>getdate()
then datediff(YEAR, DOJ, getdate()) - 1
else
datediff(YEAR, DOJ, getdate()) end) As Experience
from Programmer
where PROF1='PASCAL' or PROF2='PASCAL';

--Which Language is known by only one Programmer? 
SELECT PROF1 FROM Programmer
GROUP BY PROF1
HAVING PROF1 NOT IN
(SELECT PROF2 FROM Programmer)
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM Programmer
GROUP BY PROF2
HAVING PROF2 NOT IN
(SELECT PROF1 FROM Programmer)
AND COUNT(PROF2)=1;

---Who is the Above Programmer Referred in 50? 
CREATE TABLE PSLang(PROF VARCHAR(20))

Select * from pslang

INSERT INTO PSLang 
SELECT PROF1 FROM Programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM Programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM Programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM Programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM Programmer 
INNER JOIN PSLang ON
PROF=PROF1 OR PROF=PROF2

--Who is the Youngest Programmer knowing DBASE? 
SELECT Pname, PROF1, PROF2, 
case
when dateadd(year, datediff(YEAR, DOB, getdate()), DOB)>getdate()
then datediff(YEAR, DOB, getdate()) - 1
else
datediff(YEAR, DOB, getdate()) end As Age
from Programmer where DOB = (SELECT max(DOB) from Programmer where PROF1='DBASE' or PROF2='DBASE');


--Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
SELECT * FROM Programmer WHERE Gender = 'F' AND Salary >3000 AND 
PROF1!='C' and PROF1!='C++' and PROF1!='ORACLE'and PROF1!='DBASE' and PROF2!='C' and PROF2!='C++' and PROF2!='ORACLE' 
and PROF2!='DBASE' ;

---54. Which Institute has most number of Students? 
CREATE TABLE InstStudNo (InstituteName VARCHAR(20), StdNo INT)

INSERT INTO InstStudNo
SELECT Institute,COUNT(Pname) FROM Studies GROUP BY Institute

SELECT InstituteName,StdNo AS COUNT_OF_STUDENTS FROM InstStudNo
WHERE StdNo = (SELECT MAX(StdNo) FROM InstStudNo)

select * from InstStudNo

--What is the Costliest course? 
SELECT Course
FROM Studies
WHERE Course_Fee = (SELECT MAX(Course_Fee) FROM Studies);

--Which course has been done by the most of the Students? 
CREATE TABLE CourStudNo (CourNam VARCHAR(20), StdNo INT)

INSERT INTO CourStudNo
SELECT Course,COUNT(Pname) FROM Studies GROUP BY Course

select * from CourStudNo;

SELECT CourNam,StdNo AS COUNT_OF_Students FROM CourStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM CourStudNo)


--Which Institute conducts costliest course. 
SELECT Institute, Course FROM Studies WHERE Course_Fee = (SELECT MAX(Course_Fee) FROM Studies);

--Display the name of the Institute and Course, which has below AVG course fee.
select Institute, Course from Studies where Course_Fee  < (SELECT AVG(Course_Fee) FROM Studies);

-- Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
SELECT Course FROM Studies WHERE Course_Fee < (SELECT AVG(Course_Fee)+1000 FROM Studies) AND Course_Fee >
(SELECT AVG(Course_Fee)-1000 FROM Studies);

--Which package has the Highest Development cost? 
SELECT Title,DCOST FROM Software WHERE DCOST = (SELECT MAX(DCOST) FROM Software);

--Which course has below AVG number of Students? 
CREATE TABLE AVGCNT (CRS VARCHAR(20), CNT INT)

INSERT INTO AVGCNT
SELECT Course, COUNT(Pname) FROM Studies GROUP BY Course
SELECT CRS,CNT FROM AVGCNT WHERE CNT <=(SELECT AVG(CNT) FROM AVGCNT)

--Which Package has the lowest selling cost? 
SELECT Title,SCOST FROM Software WHERE SCOST = (SELECT MIN(SCOST) FROM Software);

--Who Developed the Package that has sold the least number of copies? 
SELECT Pname,SOLD FROM Software WHERE SOLD = (SELECT MIN(SOLD) FROM Software);

--Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN,SCOST FROM Software WHERE SCOST = (SELECT MAX(SCOST) FROM Software);

--How many copies of package that has the least difference between development and selling cost where sold. 
SELECT SOLD,Title FROM Software 
WHERE Title = (SELECT Title FROM Software
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM Software));

--Which is the costliest package developed in PASCAL. 
SELECT Title FROM Software WHERE DCOST = (SELECT MAX(DCOST)FROM Software WHERE DEVELOPIN LIKE 'PASCAL');

--Which language was used to develop the most number of Packages. 
SELECT DEVELOPIN FROM Software GROUP BY DEVELOPIN  HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM Software);

--68. Which programmer has developed the highest number of Packages
SELECT Pname FROM Software GROUP BY Pname HAVING Pname = (SELECT MAX(Pname) FROM Software);

--Who is the Author of the Costliest Package? 
 SELECT Pname, DCOST FROM Software WHERE DCOST = (SELECT MAX(DCOST) FROM Software);

--Display the names of the packages, which have sold less than the AVG number of copies. 
SELECT Title FROM Software WHERE SOLD < (SELECT AVG(SOLD) FROM Software);

--Who are the authors of the Packages, which have recovered more than double the Development cost? 
SELECT  distinct Pname FROM Software WHERE SOLD*SCOST > 2*DCOST;

--Display the programmer Name and the cheapest packages developed by them in each language. 
SELECT Pname,Title FROM Software WHERE DCOST IN (SELECT MIN(DCOST) FROM Software GROUP BY DEVELOPIN);

--Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
SELECT Pname, DEVELOPIN FROM Software WHERE SOLD IN (SELECT MAX(SOLD) FROM Software GROUP BY Pname)
UNION
SELECT Pname, DEVELOPIN FROM Software WHERE SOLD IN (SELECT MIN(SOLD) FROM Software GROUP BY Pname);

--Who is the youngest male Programmer born in 1965? 
SELECT Pname, 
case
when dateadd(year, datediff(YEAR, DOB, getdate()), DOB)>getdate()
then datediff(YEAR, DOB, getdate()) - 1
else
datediff(YEAR, DOB, getdate()) end As Age
from Programmer where DOB = (SELECT max(DOB) from Programmer where YEAR(DOB)='1965' and Gender='M');


--Who is the oldest Female Programmer who joined in 1992?
SELECT Pname, 
case
when dateadd(year, datediff(YEAR,DOB, getdate()),DOB)>getdate()
then datediff(YEAR,DOB, getdate()) - 1
else
datediff(YEAR,DOB, getdate()) end As Age
from Programmer where DOB = (SELECT min(DOB) from Programmer where YEAR(DOJ)='1992' and Gender='F');

--In which year was the most number of Programmers born. 
CREATE TABLE TEMP (YOB INT, CNT INT)

INSERT INTO TEMP
SELECT YEAR(DOB) AS YEAR ,COUNT(Pname) FROM  Programmer GROUP BY YEAR(DOB)

SELECT * FROM TEMP

SELECT YOB, CNT FROM TEMP WHERE CNT= (SELECT MAX(CNT) FROM TEMP)

--In which month did most number of programmers join? 
CREATE TABLE MOJ (MOJ INT, CNT INT)

INSERT INTO MOJ
SELECT MONTH(DOJ),COUNT(Pname) FROM Programmer GROUP BY MONTH(DOJ)

SELECT MOJ, CNT FROM MOJ WHERE CNT= (SELECT MAX(CNT) FROM MOJ)


--In which language are most of the programmer’s proficient. 
CREATE TABLE PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO PCNT
SELECT PROF1, COUNT(Pname) FROM Programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(Pname) FROM Programmer GROUP BY PROF2

select * from PCNT

INSERT INTO PsCNT
SELECT PR, SUM(CNT) FROM PCNT GROUP BY PR

select * from PsCNT

SELECT PRs, sCNT FROM PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM PsCNT)

--Who are the male programmers earning below the AVG salary of Female Programmers? 
SELECT Pname FROM Programmer WHERE Gender LIKE 'M'
AND Salary < (SELECT(AVG(Salary)) FROM Programmer WHERE Gender LIKE 'F');

--Who are the Female Programmers earning more than the Highest Paid? 
SELECT Pname FROM Programmer WHERE Gender = 'F' AND Salary > (SELECT(MAX(Salary)) FROM Programmer WHERE Gender = 'M');

--Which language has been stated as the proficiency by most of the Programmers? 
SELECT PROF1 FROM Programmer GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM Programmer)
union
SELECT PROF2 FROM Programmer GROUP BY PROF2 HAVING PROF2 = (SELECT MAX(PROF2) FROM Programmer);


--Display the details of those who are drawing the same salary. 
Select * From Programmer Where Salary in
(Select Salary From Programmer Group by Salary Having Count(Salary ) > 1);

--Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
select * from Programmer p,Software s
where p.Pname=s.Pname and Salary>3000 and Gender='M';

--Display the details of the packages developed in Pascal by the Female Programmers. 
select s.* from Programmer p,Software s
where p.Pname=s.Pname and gender='F' and DEVELOPIN ='PASCAL';

--Display the details of the Programmers who joined before 1990. 
select * from Programmer where year(DOJ)< 1990;

--Display the details of the Software Developed in C By female programmers of Pragathi. 
select s.* from Software s,Studies st,Programmer p where s.Pname=st.Pname and p.Pname=s.Pname and Gender='F' 
and Institute='PRAGATHI';

--Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
Select Studies.Institute, count(Software.DEVELOPIN) AS DEVELOPIN, count(Software.SOLD) As Sold,
sum(Software.SOLD * Software.SCOST) AS sales from Software,Studies
where Software.Pname =Studies.Pname group by Studies.Institute;

--Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
CREATE TABLE INST (INS VARCHAR(20), CNT INT)

INSERT INTO INST
SELECT Institute, COUNT(Pname) FROM Studies GROUP BY Institute

SELECT distinct SW.* FROM Software AS SW, Programmer AS PG, Studies AS ST, INST
WHERE DEVELOPIN='DBASE' AND Gender='M' AND SW.Pname = PG.Pname 
AND Institute = INS AND CNT= (SELECT MAX(CNT) FROM INST)


--Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
SELECT S.*, YEAR(DOB),Gender FROM Programmer p,Software s 
WHERE s.Pname=p.Pname AND 
((Gender='M' AND YEAR(DOB)<1965) OR (Gender='F' AND YEAR(DOB)>1975))


--Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. 
select s.* from Programmer p,Software s
where s.Pname=p.pname and (DEVELOPIN <> PROF1 and DEVELOPIN <> PROF2);

--Display the details of the software developed by the male students of Sabhari. 
select s.* from Software s,Studies st,Programmer p where s.Pname=st.Pname and p.Pname=s.Pname 
and Gender='M' and Institute='SABAHARI';

--Display the names of the programmers who have not developed any packages. 
select Pname from Programmer
where Pname not in(select Pname from Software);

--What is the total cost of the Software developed by the programmers of Apple? 
select sum(SCOST) from Software s,Studies st
where s.Pname=st.Pname and Institute='APPLE';

--Who are the programmers who joined on the same day? 
select a.Pname,a.DOJ from Programmer a,Programmer b
where a.DOJ=b.DOJ and a.Pname<> b.Pname;

--Who are the programmers who have the same Prof2? 
select distinct(a.Pname),a.PROF2 from Programmer a,Programmer b
where a.PROF2=b.PROF2 and a.Pname <> b.Pname;

--Display the total sales value of the software, institute wise. 
select Studies.Institute,sum(Software.SOLD*Software.SCOST) from Software,Studies
where Studies.Pname=Software.Pname group by Studies.Institute;

--In which institute does the person who developed the costliest package studied.
select Institute from Software st,Studies s
where s.Pname=st.Pname group by Institute,DCOST having DCOST=(select max(DCOST) from Software);

--Which language listed in prof1, prof2 has not been used to develop any package. 
select PROF1 from Programmer where PROF1 not in(select DEVELOPIN from Software) 
union
select PROF2 from Programmer where PROF2 not in(select DEVELOPIN from Software);

--How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 
select p1.Salary,s2.Course from Programmer p1,Software s1,Studies s2
where p1.Pname=s1.Pname and s1.Pname=s2.Pname and SCOST=(select max(SCOST) from Software);

--What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(Salary) from Programmer p,Software s
where p .Pname=s.Pname and SOLD*SCOST>50000;

--How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select s.Pname, count(Title) As Packages from Software s,Studies st
where s.Pname=st.Pname group by s.Pname,Course_Fee having min(Course_Fee)=(select min(Course_Fee) from Studies);

--How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
select count(DEVELOPIN) from Programmer p,Software s
where s .Pname=p.Pname group by DEVELOPIN having min(DCOST)=(select min(DCOST) from Software);

--How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select count(DEVELOPIN) from Programmer p,Software s
where s.Pname=p.Pname and Gender='F' and salary>(select max(Salary) from Programmer p,Software s
where s.Pname=p.Pname and Gender='M');

--How many packages are developed by the most experienced programmer form BDPS. 
select count(*) from Software s,Programmer p
where p.Pname=s.Pname group by DOJ having min(DOJ)=(select min(DOJ)
from Studies st,Programmer p, Software s
where p.Pname=s.Pname and st.Pname=p.Pname and (Institute='BDPS'));

--List the programmers (form the software table) and the institutes they studied, including those WHO DIDN'T develop any package.
select Pname,Institute from Studies
where Pname not in(select Pname from Software);

--List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
select count(*),sum(SCOST*SOLD-DCOST) "PROFIT" from Software
where DEVELOPIN in (select PROF1 from Programmer) group by DEVELOPIN;

--List the programmer names (from the programmer table) and No. Of Packages each has developed.
select s.Pname,count(DEVELOPIN) from Programmer p1,Software s
where p1.Pname=s.Pname group by s.Pname;