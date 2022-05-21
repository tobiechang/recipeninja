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


    if(isset($_POST['logout'])) {
        session_start();
        session_destroy();
        header("Location:index.html");
    }
	?>
	
	