--Problem 01--
SELECT TOP 5 
e.EmployeeId,
e.JobTitle,
a.AddressID,
a.AddressText
FROM Employees as e
INNER JOIN Addresses as a ON
e.AddressID = a.AddressID
ORDER BY a.AddressID ASC

--Problem 02--
SELECT TOP 50 e.FirstName, e.LastName, t.Name as Town, a.AddressText FROM Employees as e
INNER JOIN Addresses as a on e.AddressID = a.AddressID
INNER JOIN Towns as t on t.TownID = a.TownID
ORDER BY e.FirstName ASC, e.LastName ASC

--Problem 03--
SELECT e.EmployeeID, e.FirstName, e.LastName, d.Name as DepartmentName FROM Employees as e
INNER JOIN Departments as d on d.DepartmentID = e.DepartmentID
WHERE d.Name = 'Sales'
ORDER BY e.EmployeeID ASC

--Problem 04--
SELECT TOP 5 e.EmployeeId, e.FirstName, e.Salary, d.Name as DepartmentName FROM Employees as e
INNER JOIN Departments as d on d.DepartmentID = e.DepartmentID
WHERE e.Salary > 15000
ORDER BY e.DepartmentID ASC

--Problem 05--
SELECT TOP 3 e.EmployeeID, e.FirstName FROM Employees as e
INNER JOIN EmployeesProjects as ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects as p ON p.ProjectID = ep.ProjectID
WHERE p.Description IS NULL
ORDER BY e.EmployeeID ASC

--Problem 06--
SELECT e.FirstName, e.LastName, e.HireDate, d.Name as DeptName FROM Employees as e
INNER JOIN Departments as d ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1.01.1999'AND d.Name = 'Sales' OR d.Name = 'Finance'
ORDER BY e.HireDate ASC

--Problem 07--
SELECT TOP 5 e.EmployeeID, e.FirstName, p.Name as ProjectName FROM Employees as e
INNER JOIN EmployeesProjects as ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects as p ON ep.ProjectID = p.ProjectID
WHERE p.StartDate > '8.3.2002' AND p.EndDate IS NULL
ORDER BY e.EmployeeID ASC

--Problem 08--
SELECT e.EmployeeID, e.FirstName,
(
IF p.StartDate >= '1.1.2005'
BEGIN
 SELECT NULL
END
 
ELSE
BEGIN
SELECT p.Name
END
)
AS ProjectName FROM Employees AS e
INNER JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects AS p ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24