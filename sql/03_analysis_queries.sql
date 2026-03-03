#1
SELECT 
    p.TypeName AS PlanType,
    SUM(pay.Amount) AS TotalRevenue
FROM Payment pay
JOIN Customer c ON pay.CustomerID = c.CustomerID
JOIN Plan p ON c.PlanID = p.PlanID
WHERE pay.PaymentStatus = 'Completed'
GROUP BY p.TypeName
ORDER BY TotalRevenue DESC;

#2
SELECT 
    ROUND(AVG(MonthlyCount), 2) AS AvgClassesPerCustomerPerMonth
FROM (
    SELECT 
        CustomerID,
        DATE_FORMAT(AttendanceDate, '%Y-%m') AS Month,
        COUNT(*) AS MonthlyCount
    FROM Attendance
    GROUP BY CustomerID, Month
) AS MonthlyAttendance;

#3
SELECT 
    t.TrainerID,
    t.FirstName,
    t.LastName,
    ROUND(AVG(r.Rating), 2) AS AvgRating,
    COUNT(r.ReviewID) AS ReviewCount
FROM Reviews r
JOIN Trainer t ON r.TrainerID = t.TrainerID
GROUP BY t.TrainerID, t.FirstName, t.LastName
ORDER BY AvgRating DESC, ReviewCount DESC;

#4
SELECT 
    c.ClassID,
    c.ClassName,
    c.MaxCapacity,
    COUNT(a.AttendanceID) AS TotalAttendees,
    ROUND(COUNT(a.AttendanceID) * 1.0 / c.MaxCapacity, 2) AS OccupancyRate
FROM Class c
LEFT JOIN Attendance a ON c.ClassID = a.ClassID
GROUP BY c.ClassID, c.ClassName, c.MaxCapacity
ORDER BY OccupancyRate DESC;

#5
SELECT 
    p.TypeName AS PlanType,
    COUNT(CASE 
        WHEN c.Status = 'Active' AND c.JoinDate <= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) 
        THEN 1 END) AS RetainedCustomers,
    COUNT(*) AS TotalCustomers,
    ROUND(
        COUNT(CASE 
            WHEN c.Status = 'Active' AND c.JoinDate <= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) 
        THEN 1 END) * 100.0 / COUNT(*), 2
    ) AS RetentionRatePercent
FROM Customer c
JOIN Plan p ON c.PlanID = p.PlanID
GROUP BY p.TypeName;

#6
SELECT 
    PaymentMethod,
    COUNT(*) AS FailedPayments
FROM Payment
WHERE PaymentStatus = 'Failed'
GROUP BY PaymentMethod
ORDER BY FailedPayments DESC;

#7
SELECT 
    HOUR(CheckInTime) AS HourOfDay,
    COUNT(*) AS TotalAttendances
FROM Attendance
GROUP BY HourOfDay
ORDER BY TotalAttendances DESC;

#8
SELECT 
    t.TrainerID,
    CONCAT(t.FirstName, ' ', t.LastName) AS TrainerName,
    COUNT(DISTINCT c.ClassID) AS ClassesTaught,
    COUNT(a.AttendanceID) AS TotalAttendances,
    ROUND(COUNT(a.AttendanceID) * 1.0 / COUNT(DISTINCT c.ClassID), 2) AS AvgAttendancePerClass
FROM Trainer t
JOIN Class c ON t.TrainerID = c.TrainerID
LEFT JOIN Attendance a ON c.ClassID = a.ClassID
GROUP BY t.TrainerID, t.FirstName, t.LastName
ORDER BY AvgAttendancePerClass ASC;








