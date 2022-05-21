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
	<meta charset="utf-8">
	<title>Recipe Ninja</title>
	<link rel="shortcut icon"
            href="favicon.ico">
	<link rel="stylesheet" href="styles/normalize.css">
	<link rel="stylesheet" href="profile.css">
</head>

<body>

<header>
	<h1>Profile Info</h1>
	<label>&nbsp;</label>
	<form action="logout.php" method="post">
	<input type="submit" id="button" name="logout" value="Logout">
	</form>
	<h2><i>View and make changes to your personal profile</i></h2>
</header>
	<nav id="nav_menu">
		<ul>
			<li><a href="explore.php">Explore</a></li>
			<li><a href="my_page.php">My Page</a></li>
			<li><a class= "current" href="profile_info.php">My Profile</a></li>
			<li><a href="tips_tricks.php">Tips & Tricks</a></li>
			<li><a href="about.html">About</a></li>		
			<li class="lastitem"><a href="donation.php">Donate!</a></li>
		</ul>
	</nav>

	<main>
			<form class="profileForm" method="POST" action="edit_form.php">
			<h1> My Profile </h1>
			<img src="images/ninjapic.jpg" alt="addPicture" class="addPicture"> <br>
				<h2> First Name: <?php echo $_SESSION['fname']; ?></h2>
                <h2> Last Name: <?php echo $_SESSION['lname']; ?></h2>
				<h2> About Me: </h2>
				<textarea id="aboutMe" name="aboutme" rows="10" cols="100" placeholder="Tell us about yourself..." readonly><?php echo $_SESSION['about']; ?></textarea> <br>
				<button class="edit" type="submit" align="center">Edit</button> 
			</form>
	</main>
	
	</body>


</html>