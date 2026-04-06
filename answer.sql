-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
SELECT 
  date(login_timestamp, 'unixepoch') AS day,
  COUNT(DISTINCT user_id) AS daily_active_users,
  CASE 
    WHEN date(login_timestamp, 'unixepoch') < '2018-06-02' 
    THEN 'Before Feature' 
    ELSE 'After Feature' 
  END AS period
FROM login_history
GROUP BY day
ORDER BY day;



-- PART 2: Create a SQL query that indicates the number of status changes by card

SELECT
  date(timestamp, 'unixepoch') AS day,
  cardID,
  COUNT(*) AS status_changes
FROM card_change_history
WHERE oldStatus != '' 
  AND oldStatus != newStatus
GROUP BY day, cardID
ORDER BY day;



