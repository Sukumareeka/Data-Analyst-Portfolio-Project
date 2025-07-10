SELECT* 
FROM OLA
--Successful bookings 
SELECT*
FROM OLA
WHERE Booking_Status = 'Success';

--Avg_Ride Distance for each vechile type
SELECT Vehicle_Type,
	ROUND(AVG(Ride_Distance), 2) as Avg_Ride_Distance
From OLA
GROUP BY Vehicle_Type
order by Avg_Ride_Distance DESC;

--No. of Cancelled orders by Customers
SELECT 
	COUNT(*)  AS Rides_cancelled_by_customer
FROM OLA
WHERE Booking_Status = 'Cancelled by Customer';

--Top 5 customers
SELECT  TOP 5 Customer_ID, COUNT(Booking_ID) AS Tot_rides
FROM OLA
GROUP BY Customer_ID
ORDER BY Tot_rides DESC

--Rides cancelled by drivers due to personal and car issues
SELECT COUNT(Booking_Status) AS Tot_rides_cancelled_by_driver
FROM OLA
WHERE 
	Booking_Status = 'Cancelled by Driver' AND 
	Reason_for_Cancelling_by_Driver = 'Personal & Car related issues'
GROUP BY Booking_Status

--Max and Min of Driver ratings for Prime sedan
SELECT
MAX(Driver_Ratings) AS Max_rating,
MIN(Driver_Ratings) AS Min_rating
FROM OLA
WHERE Vehicle_Type = 'Prime Sedan';

--Payment - UPI
SELECT*
FROM OLA
WHERE Payment_Method = 'UPI';

--Avg. customer rating per vechile type
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating), 2) AS Avg_rating_by_customers
FROM OLA
GROUP BY Vehicle_Type;

--Total booking value for rides completed successfully 
SELECT ROUND(SUM(Booking_Value), 2) as Tot_booking_value
FROM OLA
WHERE Booking_Status = 'Success';

--Incomplete rides along with reason
SELECT Booking_ID, Incomplete_Rides_Reason
FROM OLA
WHERE Incomplete_Rides = 1
GROUP BY Booking_ID, Incomplete_Rides_Reason;