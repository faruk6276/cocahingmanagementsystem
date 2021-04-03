<?php
session_start();
if(isset($_SESSION['id']) && isset($_SESSION['username'])){
    include("../../config/database.php");
    $id = $_SESSION['id'];
    $eid = $_SESSION['username'];
    $sql = "SELECT * FROM teachers WHERE eid = '$eid'";
    $result = mysqli_query($conn, $sql);
    $resultcheck = mysqli_num_rows($result);
    if($row = mysqli_fetch_assoc($result)){
        $fname= ucfirst($row['fname']);
        $lname = ucfirst($row['lname']);
        $status = $row['status'];
    }
    if($status == 'yes' || $status == 'Yes') {
        ?>
        <!DOCTYPE html>
        <html>
        <head>
<meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Admin-OCTH</title>
            <link rel="stylesheet" type="text/css" href="css/style.css">       
            <link rel="stylesheet" href="../../css/bootstrap.min.css" />
             <script src="../../js/jquery-3.3.1.min.js"></script>
            <script src="../../js/bootstrap.min.js"></script>
    <style>
        .linking{
            background-color: #ddffff;
            padding: 7px;
            text-decoration: none;
        }
        .linking:hover{
            background-color: blue;
            color: white;
        }

                input,button,select{
                    padding: 5px;
                    border: 2px solid blue;
                    border-radius: 10px;
                    margin: 2px;
                }
                input[type=submit],button{
                    width: 200px;
                }
                input:hover{
                    background-color: lightblue;
                }
                    input[type=submit]:hover{
                    background-color: green;
                        color: white;
                }

    </style>
</head>
<body>
        <div class="header">
            <a href="index.php" class="logo"><span style="color:red;font-size:70px">OCTH</span></a>
            <a href="index.php">Home</a>
            <a href="student.php">Student</a>
            <a href="studentattendance.php">Student Attendance</a>
            <a href="teachers.php">Teachers</a>
            <a href="teachersattendance.php">Teachers Attendance</a>
            <a href="add.php">Add TimeTable/batch</a>
            <a href="addvideo.php">AddVideo</a>
            <a href="incomingcomplaint.php">Incoming Complaint</a>
            <a href="update_password.php">Update Password</a>
            <a href="profile.php"><?php echo $fname . " " . $lname . " (" . strtoupper($eid) . ")" ?></a>
            <a href="../../logout.php">Logout</a>
        </div>
        <div align="center">
            <h4>Update Password -<span style="color: blue;"> <?php echo $eid?></span></h4>
            <form  method="post">
                <b>Old Password: </b><input type="password" name="oldpassword" placeholder="Enter Old Password" required><br>
                <b>New Password: </b><input type="password" name="newpassword_one" placeholder="Enter New Password" required><br>
                <b>New Password Again: </b><input type="password" name="newpassword_again" placeholder="Enter New Password Again" required><br>
                <input type="submit" name="changepassword" value="Change Password">
            </form>
        </div>

        <?php
        if(isset($_POST['changepassword'])){
            $get_old_password=$_POST['oldpassword'];
            $get_new_password=$_POST['newpassword_one'];
            $get_new_password_again=$_POST['newpassword_again'];

            $searvh_pass = "SELECT * FROM users WHERE username='$eid' AND password='$get_old_password'";
            $searvh_pass_get = mysqli_query($conn,$searvh_pass);
            $searvh_pass_check = mysqli_num_rows($searvh_pass_get);
            if($searvh_pass_check > 0){
                if($get_new_password===$get_new_password_again){
                    $update_users = "UPDATE users SET password='$get_new_password' WHERE username='$eid' AND type='admin'";
                    $update_users_q = mysqli_query($conn,$update_users);
                    if($update_users_q){
                        echo '<script>alert("Password Update Success")</script>';
                    }else{
                        echo '<script>alert("SomeThing Went Wrong. Try Again after some time")</script>';
                    }
                }else{
                    echo '<p align="center" style="color: red">*password and confirm password does not match</p>';
                }
            }else{
                echo '<p align="center" style="color: red">*old password is wrong</p>';
            }
        }
        ?>
        </body>
        </html>
        <?php
    }else{
        ?>
        <h1>Your account is deactivated by admin due to some reasons. kindly contact Admin for further.</h1>
        <?php
    }
}else{
    header("Location: ../../index.php");
}

?>