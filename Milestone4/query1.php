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

$sql = "SELECT Car.Car_ID, Car.Model_ID, Maker.Maker_Name, Model_Name, Car.Color, Car.Condition_Type, Car.Price
FROM Car
INNER JOIN Maker ON Car.Maker_ID = Maker.Maker_ID
INNER JOIN Model ON Model.Model_ID = Car.Model_ID";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
echo "<table border = '1'>\n";
// output data of each row
echo "<p>Retrieve the details of cars along with their respective makers.</p>";
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

