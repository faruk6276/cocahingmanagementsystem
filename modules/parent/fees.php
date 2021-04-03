<?php

session_start();
if(isset($_SESSION['id']) && isset($_SESSION['username'])){
    include("../../config/database.php");
    $id = $_SESSION['id'];
    $pid = $_SESSION['username'];
    $sql = "SELECT * FROM students WHERE sid = (SELECT sid FROM students WHERE pid = '$pid')";
    $result = mysqli_query($conn, $sql);
    $resultcheck = mysqli_num_rows($result);
    if ($row = mysqli_fetch_assoc($result)) {
        $fname = ucfirst($row['fname']);
        $lname = ucfirst($row['lname']);
        $batch = $row['batch'];
    }
    $ydate = date('Y-m-d');
    $day = date("l");
    ?>
    <!DOCTYPE html>
    <html>
       <head>
            
            <title>Parents-OCTH</title>
            <link rel="stylesheet" type="text/css" href="css/style.css">       
            <link rel="stylesheet" href="../../css/bootstrap.min.css" />
             <script src="../../js/jquery-3.3.1.min.js"></script>
            <script src="../../js/bootstrap.min.js"></script>
        </head>
        <body>
        <div class="header">
            <a href="index.php" class="logo"><span style="color:red;font-size:70px">OCTH</span></a>
            <a href="index.php">Home</a>
            <a href="attendance.php">Attendance</a>
            <a href="timetable.php">TimeTable</a>
            <a href="marks.php">Marks</a>
            <a href="fees.php">Fees</a>
            <a href="password_update.php">Update Password</a>
            <a href="../../logout.php">Logout</a>
        </div>
    <div style="padding-left:20px; float: left;border-left: 6px solid red;background-color: lightgrey;width: 100%;">
        <h1 align="center">Fees - <span style="color: blue"><?php echo $fname.' '.$lname; ?></span></h1>
        <table border="2" align="center" cellpadding="5px">
            <tr>
                <th>SID</th>
                <th>Batch</th>
                <th>Total Fees</th>
                <th>Total Fee To Pay</th>
                <th>Total Paid Fees</th>
                <th>Fees To Pay</th>
            </tr>
            <?php
                $sqli = "SELECT * FROM students WHERE sid = (SELECT sid FROM students WHERE pid = '$pid') AND batch = '$batch'";
            $resulti = mysqli_query($conn, $sqli);
            $resultchecki = mysqli_num_rows($resulti);
            while ($rows = mysqli_fetch_assoc($resulti)) {
                $sid = $rows['sid'];
                $batch = $rows['batch'];
                $fees = $rows['fee'];
                $paid_fees = $rows['paidfee'];
                $newfee = $fees;

                ?>
                <tr align="center">
                    <td><?php echo strtoupper($sid); ?></td>
                    <td><?php echo ucfirst($batch); ?></td>
                    <td><?php echo $fees; ?></td>
                    <td><?php echo $newfee; ?></td>
                    <td><?php echo $paid_fees ?></td>
                    <td><?php echo $newfee-$paid_fees; ?></td>
                </tr>
                <tr>
                    <td colspan="9" align="center"><button class="feepay">Pay Fees</button></td>
                </tr>
            <?php } ?>
        </table>
    </div>
    <style>
        .feepay{
            width: 200px;
            font-size: 20px;
            color: red;
            border-radius: 10px;
            border-color: green;
        }
        .feepay:hover{
            background-color: green;
            color: white;
        }
    </style>
    </body>
    </html>
    <?php
}else{
    header("Location: ../../index.php");
}
?>
