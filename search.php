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


?>

<!DOCTYPE html>
<head> 
	<meta charset="utf-8">
	<title>Recipe Ninja</title>
	<link rel="shortcut icon"
            href="favicon.ico">
	<link rel="stylesheet" href="styles/normalize.css">
	<link rel="stylesheet" href="profile.css">
</head>
<body>
<?php
	$query = $_GET['query']; 
	// gets value sent over search form
		
		$raw_results = mysql_query("SELECT * FROM recipes WHERE ('recipeName' LIKE '%".$query."%')") or die(mysql_error());
		$recipes=$db->query($query);
		
		if(mysql_num_rows($raw_results) > 0){ // if one or more rows are returned do following
			
		
			while($results = mysql_fetch_array($raw_results)){
				// $results = mysql_fetch_array($raw_results) puts data from database into array, while it's valid it does the loop
				
					echo "<p><h3>".$results['recipeName']."</h3>"."</p>";
					// posts results gotten from database(title and text) you can also show id ($results['id'])
				}
			}
			else{ // if there is no matching rows do following
				echo "No results";
			}
		
	?>
	</body>
	</html>