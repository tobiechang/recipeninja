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

global $recipe; 
if (!isset($_SESSION['user'])) {
  	header("Location: loggedout.html");
}

$query="SELECT * FROM recipes";
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
	<link rel="stylesheet" href="explore.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

<header>
	<img src="images/logo.jpeg" alt="logo" class="logo" width=100px height=100px>
	<h1>Recipe Ninja</h1>
	<label>&nbsp;</label>
	<form action="logout.php" method="post">
	<input type="submit" id="button" name="logout" value="Logout">
	</form>
	<h2><i>Find, save, and recreate your favorite recipes</i></h2>

</header>
<nav id="nav_menu">
	<ul>
		<li><a href="explore.php">Explore</a></li>
		<li><a href="my_page.php">My Page</a></li>
		<li><a href="profile_info.php">My Profile</a></li>
		<li><a href="tips_tricks.php">Tips & Tricks</a></li>
		<li><a href="about.html">About</a></li>		
		<li class="lastitem"><a href="donation.php">Donate!</a></li>
	</ul>
</nav>
	
<main>
	<h1> Hello, <?php echo $_SESSION['fname']; ?>!</h1>
	<!-- <form class="search" method="GET" action="search.php">
		<input type="text" placeholder="Search All Recipes..." name="query">
		<button type="submit"><i class="fa fa-search"></i></button>
	  </form> -->
	<form action="filter.php" method="post">
  		<label for="categories">Filter:</label>
 		<select name="categories" id="categories">
  			<option value="0">Select a Category</option>
    		<option value="1">Chicken</option>
    		<option value="2">Seafood</option>
    		<option value="3">Beef</option>
    		<option value="4">Vegetarian</option>
			<option value="5">Appetizers</option>
			<option value="6">Sides</option>
			<option value="7">Dessert</option>
 	 	</select>
  		<br><br>
  		<input type="submit" value="Submit">
		<input type="hidden" name="catNum" value="<?php echo "categories";?>">

	</form>
	<h1> All Recipes </h1>

	<div class="recipes">
		<?php foreach ($recipes as $recipe) : ?>
			<div><a href="displayrecipe.php?recipeID=<?php echo $recipe['recipeID']; ?>">
				<img src="<?php echo $recipe['images']; ?>" width="250" height="250" /> 
			</a>
			<p><b><?php echo $recipe['recipeName'] ?></b></p>
			<p><?php echo $recipe['recipedescription'] ?></p>
			<form action="save.php" method = "post">
			<input type="submit" id="save" value="SAVE"><br>
			<input type="hidden" name="recipeNum" value="<?php echo $recipe['recipeID'];?>">
			</form></div>
		<?php endforeach; ?>
		
	

	  </div> 
	
</main>


</body>

	
</html>