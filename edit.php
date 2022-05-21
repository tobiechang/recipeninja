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


    if(isset($_POST['save'])) {
        session_start();
        $acctUsername = $_SESSION['user'];
        $acctFname = $_POST['fname'];
        $acctLname = $_POST['lname'];
        $acctAbout = $_POST['aboutme'];

        $query="UPDATE account SET
        firstname='$acctFname', lastname='$acctLname', aboutme='$acctAbout'
        WHERE username='$acctUsername'";
          echo $acctUsername;
        $row=$db->exec($query);

        $_SESSION['fname'] = $acctFname;
        $_SESSION['lname'] = $acctLname;
        $_SESSION['about'] = $acctAbout;

        header("Location: profile_info.php");
    }
	?>
	
	