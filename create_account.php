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

    if(isset($_POST['create'])) {
        $fname = $_POST['fname'];
        $lname = $_POST['lname'];
        $email = $_POST['email'];
        $user = $_POST['user'];
        $pass = $_POST['pass'];

	$query2="SELECT * FROM account";
	$accounts=$db->query($query2);
	$valid=true;
	
	foreach($accounts as $account) {
		if($account['username'] == $user) {
			$valid=false;
		}
		if($account['email'] == $email) {
			$valid=false;
		}
	}
	if($valid==true){

		$query = 'INSERT INTO account(firstname, lastname, email, username, pass) VALUES (:fname, :lname, :email, :user, :pass)';
        $statement = $db->prepare($query);
        $statement->bindValue(':fname', $fname);
        $statement->bindValue(':lname', $lname);
        $statement->bindValue(':email', $email);
        $statement->bindValue(':user', $user);
        $statement->bindValue(':pass', $pass);
        $statement->execute();
        $statement->closeCursor();
        header("location: create_account_successful.html");
	} else{
		
		header("location: create_account_failed.html");
	}
	
	}

?>
