#Query 1: (number of days from expiration)

SELECT i.IngredientsId,i.IngredientsName,i.Quantity,DATEDIFF(i.ExpiryDate, i.ManufactureDate) AS "Number of days between manufacture and expiry" FROM Ingredients as i;

#Query 2: derived attribute (find hours)

select cf.ChefId,cf.ChefName,TIMEDIFF(cf.ClockOutTime, cf.ClockInTime) AS "Number of Hours worked" FROM Chef as cf;

# Query 3: get meal name and quantity for the specific order

SELECT ct.OrderId, m.MealName, ct.Quantity FROM ConsistsOf as ct INNER JOIN Meal as m ON ct.MealId=m.MealId ORDER BY ct.OrderId;

# Query 4: remaining ingredients

SELECT r.IngredientsId,i.IngredientsName,i.Quantity-COUNT(r.IngredientsId) as "remaining" FROM Requires as r INNER JOIN Ingredients as i ON r.IngredientsId=i.IngredientsId GROUP BY r.IngredientsId;

# Query 5: find the customers who frequently come to restaurant.

SELECT o.CustomerId,cm.CustomerName,COUNT(o.CustomerId) as "Frequent Customers" FROM Orders as o INNER JOIN Customer as cm ON o.CustomerId=cm.CustomerId
GROUP BY o.CustomerId;

# Query 6: Most liked meal among customers

SELECT cs.MealId,m.MealName FROM ConsistsOf as cs INNER JOIN Meal as m ON cs.MealId=m.MealId GROUP BY cs.MealId HAVING SUM(cs.Quantity)=(SELECT MAX(total) FROM (SELECT SUM(quantity) as total FROM ConsistsOf  GROUP BY MealId) as a);

# Query 7: chef names starting with 'k'

SELECT * FROM Chef as cf WHERE cf.ChefName LIKE 'k%';

# Query 8: How many customers are the waiters handling:

SELECT cm.WaiterId,w.WaiterName,COUNT(cm.CustomerId) as "number of customers handled" FROM Customer as cm INNER JOIN Waiter as w ON cm.WaiterId=w.WaiterId GROUP BY cm.WaiterId;

# Query 9: customers who made more than 1 order:

SELECT o.CustomerId, cm.CustomerName,cm.Address, COUNT(o.OrderId) FROM Orders as o JOIN Customer as cm ON o.CustomerId=cm.CustomerId GROUP BY o.CustomerId HAVING COUNT(o.OrderId)>1;

# Query 10: customers who made more than 1 order:

SELECT * FROM Payment as p WHERE p.Price>(SELECT AVG(p.Price) FROM Payment as p);







