/*
Learning how to select JSON data types
*/

-- Select JSON column with property color = blue
SELECT
	*
FROM items 
WHERE properties->"$.color"="blue";

-- SELECT JSON column which doesn't have property = color
SELECT
	*
FROM items 
WHERE ISNULL(properties->"$.color");

-- Another option to Select JSON column with property color = blue
SELECT
	*
FROM items 
WHERE JSON_EXTRACT(properties,"$.color") = "blue"; 