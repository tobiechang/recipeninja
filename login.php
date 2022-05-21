<?php
$dsn = 'mysql:host=localhost; dbname=recipe_ninja_database';
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

    if(isset($_POST['login'])) {
        $user = $_POST['user'];
        $pass = $_POST['pass'];
		
        $query="SELECT * FROM account";
        $accounts=$db->query($query);
		$valid=false;

        foreach($accounts as $account) {
			if($account['username'] == $user) {
				if($account['pass'] == $pass) {
					$valid=true;
					session_start();
					$_SESSION['user']=$account['username'];
					$_SESSION['pass']=$account['pass'];
					$_SESSION['email']=$account['email'];
					$_SESSION['fname']=$account['firstname'];
					$_SESSION['lname']=$account['lastname'];
					$_SESSION['about']=$account['aboutme'];
					
					header("location: explore.php");

				}
			}
		}
		if($valid==false) {
			header("location: login_failed.html");
		}
	}
	

?>
