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
?>


<!DOCTYPE html>

<html lang = "en">

<head> 
	<meta charset="utf-8">
	<title>Recipe Ninja</title>
	<link rel="shortcut icon"
            href="favicon.ico">
	<link rel="stylesheet" href="styles/normalize.css">
	<link rel="stylesheet" href="edit_form.css">
</head>

<body>

<header>
	<h1>Profile Info</h1>
	<label>&nbsp;</label>
	<input type="button" id="button" value="Logout">
	<h2><i>Find, save, and recreate your favorite recipes</i></h2>
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
			<form class="profileForm" method="POST" action="edit.php">
			<h1> My Profile </h1>
			<img src="images/ninjapic.jpg" alt="addPicture" class="addPicture"> <br>
				<label> Edit First Name: </label> <input type="text" name="fname" value=<?php echo $_SESSION['fname']; ?> required> <br>
                <label> Edit Last Name: </label> <input type="text" name="lname" value=<?php echo $_SESSION['lname']; ?> required> <br> <br>
                <label> Edit About Me: </label> <br> <br>
				<textarea id="aboutMe" name="aboutme" rows="10" cols="100"><?php echo $_SESSION['about']; ?></textarea> <br>
				<button class="save" type="submit" align="center" name="save">Save</button> 
			</form>
	</main>
	
	</body>


</html>