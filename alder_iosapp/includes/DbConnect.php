<?php
class DbConnect
{
    private $conn;
    function __construct()
    {

    }
    function connect(){
        require_once 'Constants.php';
//        include_once dirname(__FILE__) . '/Constants.php';

        // Connecting to mysql database
        $this->conn = new mysqli(DB_HOST,DB_USERNAME, DB_PASSWORD, DB_NAME);

        ////        // Check for database connection error
        if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }

        return $this->conn;
    }
}