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
	
	$query="INSERT INTO saved
	(recipeID, username) VALUES
	($recipeID, '$acctUsername')";
	
	$row=$db->exec($query);

	
	header("Location: explore.php");

	?>
	