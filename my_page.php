<?php 
$dsn = 'mysql:host=localhost;dbname=recipe_ninja_database';
	$username = 'root';
	$password = '';
	
	try {
		$db= new PDO($dsn, $username, $password);
	} 
	catch (PDOException $e) {
		$error= $e->getMessage();
		echo '<p> Unable to connect to database:' .$error;
		exit();
	}

session_start();
if (!isset($_SESSION['user'])) {
  	header("Location: loggedout.html");
}


$module = $_SESSION['user'];


$query = "SELECT * FROM `recipes`,`saved` WHERE saved.username = '{$module}' && saved.recipeID = recipes.recipeID";
$recipes=$db->query($query);

?>

<!DOCTYPE html>
<html lang = "en">

<head> 
	<meta charset="utf-8">
	<title>Recipe Ninja</title>
	<link rel="shortcut icon"
            href="favicon.ico">
	<link rel="stylesheet" href="styles/normalize.css">
	<link rel="stylesheet" href="my_page.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<header>
	<h1>My Page</h1>
	<label>&nbsp;</label>
	<form action="logout.php" method="post">
	<input type="submit" id="button" name="logout" value="Logout">
	</form>
	<h2><i>View your saved recipes</i></h2>
</header>
<nav id="nav_menu">
	<ul>
		<li><a href="explore.php">Explore</a></li>
		<li><a class = "current" href="my_page.php">My Page</a></li>
		<li><a href="profile_info.php">My Profile</a></li>
		<li><a href="tips_tricks.php">Tips & Tricks</a></li>
		<li><a href="about.html">About</a></li>		
		<li class="lastitem"><a href="donation.php">Donate!</a></li>
	</ul>
</nav>
<main>
	<h1> Saved Recipes </h1>

	<div class="recipes">
		<?php foreach ($recipes as $recipe) : ?>
			<div><a href="displayrecipe.php?recipeID=<?php echo $recipe['recipeID']; ?>">
				<img src="<?php echo $recipe['images']; ?>" width="100" height="100" /> 
			</a>
			<br><br>
			<p><b><?php echo $recipe['recipeName'] ?></b></p>
			<p><?php echo $recipe['recipedescription'] ?></p>
			<form action="delete.php" method = "post">
			<input type="submit" id="save" value="Delete"><br>
			<input type="hidden" name="recipeNum" value="<?php echo $recipe['recipeID'];?>">
			<br><br><br>
			</form></div>
		<?php endforeach; ?>
		
	

	  </div> 
	
</main>

</body>

</html>