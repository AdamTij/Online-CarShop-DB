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

$sql = "SELECT * FROM Maker";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
echo "<table border = '1'>\n";
echo "<p>Maker</p>";
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

