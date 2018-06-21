# Spoon_test_02
Matlab code to test linear interpolation using GPS data to correct SYS clock drift

####Filename: NNNN_GPS_ideal.csv
This is a test file to represent information provided in one of the NNNN_GPS.cv files. 
It assumes that the SYS clock has NO drift, and therefore the SYS clock and GPS clock
are synchronized. A 1,000 millisecond change in SYS is exactly equal to a 1 second change in the GPS time.This is the first test file used to verify that the forward difference linear interpolation algorythm is working. 

<table style="width:100%">
  <tr>
    <th>ard_millis</th>
    <th>GPS Epoch Time</th> 
    
  </tr>
  <tr>
    <td>6000</td>
    <td>1489675375</td> 
  </tr>
  <tr>
    <td>16000</td>
    <td>1489675385</td> 
  </tr>
    <tr>
    <td>32000</td>
    <td>1489675401</td> 
  </tr>
    <tr>
    <td>42000</td>
    <td>1489675411</td> 
  </tr>
</table>

####Filename: MASTER.csv
The file named MASTER.csv is what the output of the algorithm should look like when inputting the file NNNN_GPS_ideal.csv.
0	1489675369
2000	1489675371
4000	1489675373
6000	1489675375
8000	1489675377
10000	1489675379
12000	1489675381
14000	1489675383
16000	1489675385
18000	1489675387
20000	1489675389
22000	1489675391
24000	1489675393
26000	1489675395
28000	1489675397
30000	1489675399
32000	1489675401
34000	1489675403
36000	1489675405
38000	1489675407
40000	1489675409
42000	1489675411
44000	1489675413
46000	1489675415
48000	1489675417
50000	1489675419
52000	1489675421
54000	1489675423
56000	1489675425
58000	1489675427
60000	1489675429
<table style="width:100%">
  <tr>
    <th>ard_millis</th>
    <th>GPS Epoch Time</th> 
    
  </tr>
  <tr>
    <td>0</td>
    <td>1489675369</td> 
  </tr>
  <tr>
    <td>2000</td>
    <td>1489675385</td> 
  </tr>
    <tr>
    <td>4000</td>
    <td>1489675401</td> 
  </tr>
    <tr>
    <td>6000</td>
    <td>1489675411</td> 
  </tr>
    <tr>
    <td>8000</td>
    <td>1489675369</td> 
  </tr>
  <tr>
    <td>10000</td>
    <td>1489675385</td> 
  </tr>
    <tr>
    <td>12000</td>
    <td>1489675401</td> 
  </tr>
    <tr>
    <td>14000</td>
    <td>1489675411</td> 
  </tr>
</table>

####Filename: NNNN_GPS_error.csv

This is a test file to represent information provided in one of the NNNN_GPS.cv files. 
It assumes that the SYS clock has drift, and therefore the SYS clock and GPS clock
are NOT synchronized. A 1,000 millisecond change in SYS is NOT necessarily equal to a 1 second change in the GPS time. This is the second test file used to verify that the forward difference linear interpolation algorythm is working. 

<p>

When the spoon_test_02.m file is run using this file, the output file
 NNNN_SYS_new.csv will have a uniform 2000 millisecond spacing between the entries the first column, 
 while the entries in the second column with have a corresponding 2 second spacing. The NNNNN_SYS_new.csv file will have values that range from 0 -  
<table style="width:100%">
  <tr>
    <th>ard_millis</th>
    <th>GPS Epoch Time</th> 
    
  </tr>
  <tr>
    <td>6000</td>
    <td>1489675375</td> 
  </tr>
  <tr>
    <td>16000</td>
    <td>1489675385</td> 
  </tr>
    <tr>
    <td>32000</td>
    <td>1489675401</td> 
  </tr>
    <tr>
    <td>42000</td>
    <td>1489675411</td> 
  </tr>
</table>