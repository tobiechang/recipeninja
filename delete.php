<?php

	$dsn='mysql:host=localhost; dbname=recipe_ninja_database';
	$username='root';
	$password='';
	
	try{
		$db=new PDO($dsn, $username, $password);
	}
	catch (PDOException $e) 
	{
		$error=$e->getMessage();
		echo '<p> Unable to connect to database: '.$error;
		exit();
	}
	session_start();
	
	$recipeID = $_POST['recipeNum'];
	$acctUsername = $_SESSION['user'];
	
	$query="DELETE FROM saved WHERE recipeID = $recipeID AND username = '$acctUsername'";
	
	$row=$db->exec($query);
	
	header("Location: my_page.php");

	?>