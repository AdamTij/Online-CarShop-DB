<?php
$servername = "cssql.seattleu.edu";
$username = "bd_atidjani";
$password = "8AN9QY2G";
$dbname = "bd_atidjani";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// // Check connection
if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT Category.Category_Name, SUM(Car.Price) AS TotalSales, AVG(Car.Price) AS AvgPrice
FROM Category
INNER JOIN Car ON Category.Category_ID = Car.Category_ID
GROUP BY Category.Category_Name
HAVING TotalSales > 25000;";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
echo "<table border = '1'>\n";
echo "<p>Retrieve the total sales and average price per car category, only for categories with total sales greater than 25,000.</p>";
// output data of each row
while($row = mysqli_fetch_row($result)) {
echo "<tr>\n";
$cols = mysqli_num_fields($result);
for ($i = 0; $i < $cols; $i++) {
echo "<td>" . $row[$i] . "</td>\n";
}
echo "</tr>\n";
}
echo "</table>\n";
} else {
echo "0 results";
}
mysqli_free_result($result);

mysqli_close($conn);

?>

