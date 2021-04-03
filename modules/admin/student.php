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
if(isset($_GET['res'])) {
    if ($_GET['res'] == 'success') {
        echo '<script>alert("Successfully done")</script>';
    }
    if ($_GET['res'] == 'fail') {
        echo '<script>alert("Failed Try Again")</script>';
    }
}
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
<div align="center" style="background-color: aquamarine;padding: 10px">
    <a href="student.php?addstudent=true" class="linking">Add Student</a>
    <a href="student.php?updatestudent=true" class="linking">Update Student</a>
</div>

<?php if(isset($_GET['addstudent']) OR isset($_GET['batch'])) { ?>
    <div align="center">
        <h4>Select Batch(in which you want to add student)</h4>
        <form method="get" action="student.php">
            Batch: <select name="batch">
                     <option value="none">Select Batch</option>
                <?php
                $sql_get_batch = "SELECT * FROM batches";
                $sql_get_batch_query = mysqli_query($conn, $sql_get_batch);
                while ($rom = mysqli_fetch_assoc($sql_get_batch_query)) { ?>
                    <option value="<?php echo $rom['batch'] ?>"><?php echo $rom['batch'] ?></option>
                <?php }
                ?></select>
            <input type="submit" name="submit">
        </form>

    </div>
    <?php if (isset($_GET['submit'])) {
        if ($_GET['batch'] != 'none') {
            $batch_get = mysqli_real_escape_string($conn, $_GET['batch']);
            $get_mentorandtiming = "SELECT * FROM batches WHERE batch='$batch_get'";
            $get_mentorandtiming_check = mysqli_query($conn, $get_mentorandtiming);
            $get = mysqli_fetch_assoc($get_mentorandtiming_check);
            $get_mentor = $get['mentor'];
            $get_timing = $get['timings'];
            $get_class=$get['class'];

            $sql = "SELECT sid,pid FROM students ORDER BY id DESC LIMIT 1";
            $sql_q = mysqli_query($conn, $sql);
            $ro = mysqli_fetch_assoc($sql_q);
            $sid = $ro['sid'];
            $pid = $ro['pid'];
            function increment($sid)
            {
                return ++$sid[1];
            }

            $sid = preg_replace_callback("|(\d+)|", "increment", $sid);
            function incrementp($pid)
            {
                return ++$pid[1];
            }

            $pid = preg_replace_callback("|(\d+)|", "incrementp", $pid);
            ?>
            <div align="center">
                <h3>Add Student</h3>
                <form method="post">
                    <b>SID:</b> <input type="text" name="sid" value="<?php echo $sid; ?>" disabled>
                    &nbsp;&nbsp;<b>PID:</b> <input type="text" name="pid" value="<?php echo $pid; ?>" disabled><br>
                    <b>Fname:</b> <input type="text" name="fname" placeholder="First Name">
                    &nbsp;&nbsp;<b>Lname:</b> <input type="text" name="lname" placeholder="Last Name">
                    <br><b>Email:</b> <input type="email" name="email" placeholder="Email">
                    &nbsp;&nbsp;<b>Mobile:</b> <input type="text" name="mobile" placeholder="Mobile"><br>
                    <b>Address:</b> <input type="text" name="address" placeholder="Address">
                    &nbsp;&nbsp;<b>City:</b> <input type="text" name="city" placeholder="City">
                    <br><b>Division:</b> <input type="text" name="state" placeholder="Division">
                    &nbsp;&nbsp;<b>Pin code:</b> <input type="text" name="postalcode" placeholder="Pin Code"><br>
                    <b>Date Of Reg:</b> <input type="date" name="dateofreg">
                    <b>Batch Mentor</b><input type="text" name="batchmentor" value="<?php echo $get_mentor ?>" disabled>
                    <hr width="80%">
                    <br><b>Fees:</b> <input type="text" name="fees" placeholder="Total Fees">
                    &nbsp;&nbsp;<b>Paid Fees:</b> <input type="text" name="paidfee" placeholder="Paid Fees">
                    <br>
                    &nbsp;&nbsp;<b>Batch:</b> <input type="text" name="batch" value="<?php echo ucfirst($batch_get); ?>"
                                                     disabled>
                    <br><b>Class:</b> <input type="text" name="class" value="<?php echo $get_class; ?>" disabled>
                    <hr width="80%">
                    <b>Father's Name:</b> <input type="text" name="fathername" placeholder="Father's Name">
                    &nbsp;&nbsp;<b>Occupation: </b><input type="text" name="fatheroccu"
                                                          placeholder="Father's Occupation">
                    &nbsp;&nbsp;<b>Mobile Number:</b> <input type="text" name="fathermob"
                                                             placeholder="Father's Mobile Number">
                    <br><b>Mother's Name:</b> <input type="text" name="mothername" placeholder="Mother's Name">
                    &nbsp;&nbsp;<b>Occupation: </b><input type="text" name="motheroccu"
                                                          placeholder="Mother's Occupation">
                    &nbsp;&nbsp;<b>Mobile Number:</b> <input type="text" name="mothermob"
                                                             placeholder="Mother's Mobile Number">
                    <br><br><input type="submit" name="add">
                </form>
            </div>
            <?php
            if (isset($_POST['add'])) {
                $st_fname = $_POST['fname'];
                $st_lname = $_POST['lname'];
                $st_email = $_POST['email'];
                $st_mobile = $_POST['mobile'];
                $st_address = $_POST['address'];
                $st_city = $_POST['city'];
                $st_state = $_POST['state'];
                $st_pin = $_POST['postalcode'];
                $st_fee = $_POST['fees'];
                $st_dateofreg = $_POST['dateofreg'];
                $paid_fee = $_POST['paidfee'];
                $st_class = $get_class;
                $st_fathername = $_POST['fathername'];
                $st_fatheroccu = $_POST['fatheroccu'];
                $st_fathermob = $_POST['fathermob'];
                $st_mothername = $_POST['mothername'];
                $st_motheroccu = $_POST['motheroccu'];
                $st_mothermob = $_POST['mothermob'];

                $sql_get_insert = "INSERT INTO students(sid, fname, lname, email, phone, address, district, state, postalcode, fee, paidfee, status, batch, class, fathername, fathermob, fatheroccu, mothername, mothermob, motheroccu, mentor, timing, dateofreg, pid, dateofleft) 
                VALUES ('$sid','$st_fname','$st_lname','$st_email','$st_mobile','$st_address','$st_city','$st_state','$st_pin','$st_fee',$paid_fee','yes','$getch_get','$st_class','$st_fathername','$st_fathermob','$st_fatheroccu','$st_mothername','$st_mothermob','$st_motheroccu',$get_mentor','$get_timing','$st_dateofreg','$pid','0000-00-00')";
                $sql_get_insert_quary = mysqli_query($conn, $sql_get_insert);
                $insert_into_users = "INSERT INTO users (username, password, type) VALUES ('$sid','$sid','student')";
                $insert_into_users_check = mysqli_query($conn,$insert_into_users);
                $insert_into_users_p = "INSERT INTO users (username, password, type) VALUES ('$pid','$pid','parent')";
                $insert_into_users_check_p = mysqli_query($conn,$insert_into_users_p);
                if ($sql_get_insert_quary AND $insert_into_users_check AND $insert_into_users_check_p) {
                    echo '<script>location.href="student.php?res=success"</script>';
                } else {
                    echo '<script>location.href="student.php?res=fail"</script>';
                }

            }
        }else{
            echo '<script>alert("Please Select batch")</script>';
        }
    }
}
if(isset($_GET['updatestudent']) OR isset($_GET['studentid'])){?>
    <div align="center">
        <form method="get">
            Student Id (SID): <input type="text" name="studentid" placeholder="Enter Student Id">
            <input type="submit" name="update">
        </form>
    </div>

<?php
if(isset($_GET['studentid'])){
    $get_studentid = mysqli_real_escape_string($conn,$_GET['studentid']);

$sql_query_search = "SELECT * FROM students WHERE sid='$get_studentid'";
$sql_query_search_result = mysqli_query($conn,$sql_query_search);
$sql_query_search_result_check = mysqli_num_rows($sql_query_search_result);
if($sql_query_search_result_check>0)
{
$rowss = mysqli_fetch_assoc($sql_query_search_result);

?>
    <div align="center">
        <h3>Update Details - <span style="color: blue"><?php echo $get_studentid?></span></h3>
        <form method="post">
            <b>SID:</b> <input type="text" name="sid" value="<?php echo $rowss['sid'];?>" disabled>
            &nbsp;&nbsp;<b>PID:</b> <input type="text" name="pid" value="<?php echo $rowss['pid']; ?>" disabled><br>
            <b>Fname:</b> <input type="text" name="fname" value="<?php echo $rowss['fname'];?>">
            &nbsp;&nbsp;<b>Lname:</b> <input type="text" name="lname" value="<?php echo $rowss['lname']; ?>">
            <br><b>Email:</b> <input type="email" name="email" value="<?php echo $rowss['email']; ?>">
            &nbsp;&nbsp;<b>Mobile:</b> <input type="text" name="mobile" value="<?php echo $rowss['phone']; ?>"><br>
            <b>Address:</b> <input type="text" name="address" value="<?php echo $rowss['address']; ?>">
            &nbsp;&nbsp;<b>City:</b> <input type="text" name="city" value="<?php echo $rowss['district']; ?>">
            <br><b>Division:</b> <input type="text" name="state" value="<?php echo $rowss['state']?>">
            &nbsp;&nbsp;<b>Pin code:</b> <input type="text" name="postalcode" value="<?php echo $rowss['postalcode']; ?>">
            <br><b>Fees:</b> <input type="text" name="fees" value="<?php echo $rowss['fee']; ?>" disabled>
            &nbsp;&nbsp;<b>Paid Fees:</b> <input type="text" name="paidfee" value="<?php echo $rowss['paidfee']?>" disabled>
            &nbsp;&nbsp;<b>Batch:</b> <input type="text" name="batch" value="<?php echo $rowss['batch']?>" disabled>
            <br><b>Class:</b> <input type="text" name="class" value="<?php echo $rowss['class']?>">
            <br><b>Father's Name:</b> <input type="text" name="fathername" value="<?php echo $rowss['fathername']?>">
            &nbsp;&nbsp;<b>Occupation: </b><input type="text" name="fatheroccu" value="<?php echo $rowss['fatheroccu']?>">
            &nbsp;&nbsp;<b>Mobile Number:</b> <input type="text" name="fathermob" value="<?php echo $rowss['fathermob']?>">
            <br><b>Mother's Name:</b> <input type="text" name="mothername" value="<?php echo $rowss['mothername']?>">
            &nbsp;&nbsp;<b>Occupation: </b><input type="text" name="motheroccu" value="<?php echo $rowss['motheroccu']?>">
            &nbsp;&nbsp;<b>Mobile Number:</b> <input type="text" name="mothermob" value="<?php echo $rowss['mothermob']?>">
            <br><br><input type="submit" name="update">
        </form>
        <br><a href="student.php?res=fail"><button>Cancel</button></a>

    </div>

<?php
if(isset($_POST['update'])){
    $st_fname = $_POST['fname'];
    $st_lname = $_POST['lname'];
    $st_email = $_POST['email'];
    $st_mobile = $_POST['mobile'];
    $st_address = $_POST['address'];
    $st_city = $_POST['city'];
    $st_state = $_POST['state'];
    $st_pin = $_POST['postalcode'];
    $st_class = $_POST['class'];
    $st_fathername = $_POST['fathername'];
    $st_fatheroccu = $_POST['fatheroccu'];
    $st_fathermob = $_POST['fathermob'];
    $st_mothername = $_POST['mothername'];
    $st_motheroccu = $_POST['motheroccu'];
    $st_mothermob = $_POST['mothermob'];

    $sql_q_update = "UPDATE students SET fname='$st_fname',lname='$st_lname',email='$st_email',phone='$st_mobile',address='$st_address',district='$st_city',state='$st_state',postalcode='$st_pin',class='$st_class',fathername='$st_fathername',fathermob='$st_fathermob',fatheroccu='$st_fatheroccu',mothername='$st_mothername',mothermob='$st_mothermob',motheroccu='$st_motheroccu' WHERE sid='$get_studentid' AND center='$center' AND course='$course'";
    $sql_q_update_query = mysqli_query($conn, $sql_q_update);
    if($sql_q_update_query){
        echo '<script>location.href="student.php?res=success"</script>';
    }else{
        echo '<script>location.href="student.php?res=fail"</script>';
    }

}

}
}
}?>

<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>
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