<?php

	/*
		About File 

		The file is the backend script for Online Bus Registration System to be called by AJAX call.
		
		File Properties:
		1. Procedural Programming Approach
		2. First come first serve seat allocation system.
		3. My SQL Database 
		4. Clean Code
		
		No copy-rights reserved.
	*/
	
	// POST Method is used to transfer 
	$name=$_POST["name"];	$id=$_POST["id"];			$age=$_POST["age"];
	$bus=$_POST["bus"]; 	$source=$_POST["source"];	$destination=$_POST["destination"];
	$count=$_POST["count"];
	
	//Variables to be used 
	$s[1]=0;	$s[2]=0;	$s[3]=0;	$s[4]=0;
	$seat[1]=0;	$seat[2]=0;	$seat[3]=0;	$seat[4]=0;
	$cost=0;	$bus_cost=0;
	
	$route=$destination-$source;
	if($route==0)
		echo "Please do not select same source and destination. "; // If Destination is same as Source
	else
	{
		// DB connection variables. 
		// You may need to change 
		$host="localhost";	$username="root";	$password="";
		$database="db_bus";
		mysql_connect($host,$username,$password);
		@mysql_select_db($database) or die( "Unable to select database");
			
		if($route>0) // 1st trip 
		{
			for($loop=1;$loop<=4;$loop++)
			{
				if($source<=$loop && $destination>$loop)
					$s[$loop]++; // Set necessary seats to 1 for this booking.
			}
			
		}
		else	// Return trip
		{
			for($loop=1;$loop<=4;$loop++)
			{
				if($destination<=$loop && $source>$loop)
					$s[$loop]++;
			}
			
		}
		
		//Get Buss Cost
		$qu = "select * from db_bus where bus_name='".$bus."'";
		$ru = mysql_query($qu);
		while ($row=mysql_fetch_array($ru))
		{							
				$bus_cost = $row[7];						
		}
		
		//Calculate finla Cost
		for($loop=1;$loop<=4;$loop++)
		{
				$s[$loop]*=$count;
				$cost=$cost+($s[$loop]*$bus_cost);
		}
		
		//Get Seat Availability Status
		$qu = "select * from db_bus where bus_name='".$bus."'";
		$ru = mysql_query($qu);
		while ($row=mysql_fetch_array($ru))
		{							
				$seat[1] = $row[2]-$s[1];
				$seat[2] = $row[3]-$s[2];
				$seat[3] = $row[4]-$s[3];
				$seat[4] = $row[5]-$s[4];
		}
		
		
		if($seat[1]<0 || $seat[2]<0 || $seat[3]<0 || $seat[4]<0) // Tickets are not available
			echo "Tickets Not Available";
		else 													// Tickets are available
		{
			// Database update
			mysql_query("INSERT INTO db_passenger(Name,Age,ID_number,Source,Destination,Count,Bus,Cost) 
				VALUES('$name','$age','$id','$source','$destination','$count','$bus','$cost')") or die (mysql_error());
		
			mysql_query("UPDATE `db_bus` SET seat_s1 = '".$seat[1]."',seat_s2 = '".$seat[2]."',seat_s3 = '".$seat[3]."',seat_s4 = '".$seat[4]."' where bus_name='".$bus."'");
			
			echo "Tickets booked for Rs. $cost";
		}		
		mysql_close(mysql_connect($host,$username,$password));
	}
		
?>