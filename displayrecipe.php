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
	
// get recipeID from explore.php file
$recipeID = $_GET['recipeID'];

// get recipe 
$queryrecipe="SELECT * FROM recipes WHERE recipes.recipeID = '{$recipeID}'";
$recipes=$db->query($queryrecipe);

// get ingredients 
$query = "SELECT * FROM `ingredient` WHERE ingredient.recipeID = '{$recipeID}' ORDER BY num";
$ingredients=$db->query($query);

// get steps 
$query = "SELECT * FROM `steps` WHERE steps.recipeID = '{$recipeID}' ORDER BY stepNum";
$steps=$db->query($query);

?>


<!DOCTYPE html>
<html lang = "en">

<head> 
	<meta charset="utf-8">
	<title>Recipe Ninja</title>
	<link rel="shortcut icon"
            href="favicon.ico">
	<link rel="stylesheet" href="styles/normalize.css">
	<link rel="stylesheet" href="displayrecipe.css">
</head>

<header>
<form action="explore.php">
	<button class="submit" type="submit" align="center">Back to Explore</button> <br>
</form>
</header>

<body>
<main>
	<?php foreach ($recipes as $recipe) : ?>
			<h1><b><?php echo $recipe['recipeName'] ?></b></h1>
			<p><?php echo $recipe['recipedescription'] ?></p>
			<sidebar>
			<img src="<?php echo $recipe['images']; ?>" width="250" height="250" /> 
	</sidebar>
			
		<?php endforeach; ?>

		<aside>
		<h3> Ingredients</h3>
		<?php foreach ($ingredients as $ingredient) : ?>
			<ul>
			<li><?php echo $ingredient['info'] ?></li>
			</ul>
		<?php endforeach; ?>
		</aside>

		<div>
		<h3> Instructions</h3>
		<?php foreach ($steps as $step) : ?>
			<p><?php echo $step['stepNum'] ?>.  <?php echo $step['info'] ?></p>
		<?php endforeach; ?>
		</div><br>

		<br><div><form action="save.php" method = "post">
			<input type="submit" id="save" value="SAVE"><br>
			<input type="hidden" name="recipeNum" value="<?php echo $recipe['recipeID'];?>">
		</form></div>
		</main>
	</body>

</html>