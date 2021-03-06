<?php 
$dsn = 'mysql:host=localhost;dbname=recipe_ninja_database';
$username = 'root';
$password = '';

try {
    $db= new PDO($dsn, $username, $password);
} 
catch (PDOException $e) {
    $error= $e->getMessage();
    echo '<p> Unable to connect to databsae:' .$error;
    exit();
}
	session_start();
	if (!isset($_SESSION['user'])) {
  	header("Location: loggedout.html");
	}
?>
<!DOCTYPE html>
<html lang = "en">

<head> 
	<script src="donate.js"></script>

	<meta charset="utf-8">
	<title>Recipe Ninja</title>
	<link rel="shortcut icon"
            href="favicon.ico">
	<link rel="stylesheet" href="styles/normalize.css">
	<link rel="stylesheet" href="donation.css">
</head>

<body>

<header>
	<h1>Donate!</h1>
	<label>&nbsp;</label>
	<input type="submit" id="button" name="logout" value="Logout">
	<h2><i>Help support us!</i></h2>
</header>
<nav id="nav_menu">
	<ul>
		<li><a href="explore.php">Explore</a></li>
		<li><a href="my_page.php">My Page</a></li>
		<li><a href="profile_info.php">My Profile</a></li>
		<li><a href="tips_tricks.php">Tips & Tricks</a></li>
		<li><a href="about.html">About</a></li>		
		<li class="lastitem"><a class="current" href="donation.php">Donate!</a></li>
	</ul>
</nav>
	
<aside>
	<h2> We implore you to help </h2>
	<p> We are a humble nonprofit recipe saver, and we are still in business because people like you donate, and keep us alive and thriving. We rely on your
	generosity to keep giving you the most reliable and up to date virtual recipe book. I love you, and you are a good rich person. If you do not feel the need
	to donate, then children will remain hungry because parents are unable to find recipes to feed their children. In order to feed the children we really
	appreciate you donating your hard earned money so that we can continue providing this integral service to society. We love society, and use any extra
	profits to donate to services that shine our kitchenware, which is a really necessary use of your kindly given money. Also, we donate to pet shelters
	so that they can feed the pets the most quality food, because pets deserve filet mignon and seared scallops as much as the rest of us do. Do it for the 
	pets. </p>

</aside>
<main>

<form class="move" id="donate">
<h1>Donate Here!</h1>
	<label>Amount: </label>
	<select name="amount">
		<option value = "1">$1</option>
		<option value = "2">$2</option>
		<option value = "5">$5</option>
		<option value = "10">$10</option>
		<option value = "25">$25</option>
		<option value = "50">$50</option>
		<option value = "100">$100</option>
	</select><br>
	<label> Email: </label>
	<input type="text" id="email"><span id="error1"> *</span><br>
	<label> Name on Card: </label>
	<input type="text" id="name"><span id="error2"> *</span><br>
	<label> Card Number: </label>
	<input type="text" id="cardnumber" required pattern="\d{4}[\-]\d{4}[\-]\d{4}[\-]\d{4}"><span id="error3"> *</span><br>
	<label> Expiration Date: </label>
	<input type="date" id="date"><span id="error4"> *</span><br>
	<input type="button" id="submitdonate" class="button" value="Donate"><br>
	<input type="button" id="clear" class="button" value="Clear Values"><br>
</form>

	
</main>

</body>

</html>