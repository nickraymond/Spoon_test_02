# Spoon_test_02
Matlab code to test linear interpolation using GPS data to correct SYS clock drift

To run the spoon_test_02.m file please download the zip file and open up Matlab 2017a or later and add the folder to the working directory. The uncommnet one of the following sets of lines to run different versions of the NNNN_SYS.csv and NNNN_GPScsv files.

<pre>
    
  % CASE 1: uncomment lines to test algorythm using inputs WITHOUT SYS drift error
%     GPS_file = readtable("NNNN_GPS_ideal.csv"); 
%     SYS_file = readtable("NNNN_SYS.csv");     
%     disp("*** Running algorythm WITHOUT drift error ***");
 
  % CASE 2: uncomment lines to test algorythm using inputs WITH SYS drift error
%     GPS_file = readtable("NNNN_GPS_error.csv");      
%     SYS_file = readtable("NNNN_SYS.csv");             
%     disp("*** Running algorythm WITH drift error ***");


  % CASE 3: uncomment lines to test algorythm using real buoy data 
%     GPS_file = readtable("0872_GPS.csv");       % run data from Buoy
%     SYS_file = readtable("0872_SYS.csv"); % run data from Buoy
%     disp("*** Running algorythm using real buoy data ***");

</pre>
 
### Output
A new file will be created when you run the program. The name is NNNN_SYS_New.csv. 

<p>
This new file will have the ard_millis data from the SYS.csv file, along with the new GPS Epoch time using linear interpolation to compensate for any drift. This file can be used to compare with the known master files.

 
## CASE 1: no drift error
#### Filename: NNNN_GPS_ideal.csv
This is a test file to represent information provided in one of the NNNN_GPS.cv files. 
It assumes that the SYS clock has NO drift, and therefore the SYS clock and GPS clock
are synchronized. A 1,000 millisecond change in SYS is exactly equal to a 1 second change in the GPS time.This is the first test file used to verify that the backward difference linear interpolation algorythm is working. 

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

#### Filename: MASTER.csv
The file named MASTER.csv is what the output of the algorithm should look like when inputting the file NNNN_GPS_ideal.csv and NNNN_SYS.csv. 

<p>

We see that the algoryth performed the linear interpolation inbetween the specified ard_millis points 6000, 16000, 32000, 42000 and that an even spacing of two seconds is maintained for all the GPS Epoch time values in the table. This was accomplished even though the interval between the NNNN_GPS_ideal.csv values had a non uniform spacing. This is a quick check to verify that 
the program is working as expected.
<p>
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
    <td>1489675371</td> 
  </tr>
    <tr>
    <td>4000</td>
    <td>1489675373</td> 
  </tr>
    <tr>
    <td>6000</td>
    <td>1489675375</td> 
  </tr>
    <tr>
    <td>8000</td>
    <td>1489675377</td> 
  </tr>
  <tr>
    <td>10000</td>
    <td>1489675379</td> 
  </tr>
    <tr>
    <td>12000</td>
    <td>1489675381</td> 
  </tr>
    <tr>
    <td>14000</td>
    <td>1489675383</td> 
  </tr>
    <tr>
    <td>16000</td>
    <td>1489675385</td> 
  </tr>
  <tr>
    <td>18000</td>
    <td>1489675387</td> 
  </tr>
    <tr>
    <td>20000</td>
    <td>1489675389</td> 
  </tr>
    <tr>
    <td>22000</td>
    <td>1489675391</td> 
  </tr>
    <tr>
    <td>24000</td>
    <td>1489675393</td> 
  </tr>
  <tr>
    <td>26000</td>
    <td>1489675395</td> 
  </tr>
    <tr>
    <td>28000</td>
    <td>1489675397</td> 
  </tr>
    <tr>
    <td>30000</td>
    <td>1489675399</td> 
  </tr>
    <tr>
    <td>32000</td>
    <td>1489675401</td> 
  </tr>
  <tr>
    <td>34000</td>
    <td>1489675403</td> 
  </tr>
    <tr>
    <td>36000</td>
    <td>1489675405</td> 
  </tr>
    <tr>
    <td>38000</td>
    <td>1489675407</td> 
  </tr>
    <tr>
    <td>40000</td>
    <td>1489675409</td> 
  </tr>
  <tr>
    <td>42000</td>
    <td>1489675411</td> 
  </tr>
    <tr>
    <td>44000</td>
    <td>1489675413</td> 
  </tr>
    <tr>
    <td>46000</td>
    <td>1489675415</td> 
  </tr>
    <tr>
    <td>48000</td>
    <td>1489675417</td> 
  </tr>
  <tr>
    <td>50000</td>
    <td>1489675419</td> 
  </tr>
    <tr>
    <td>52000</td>
    <td>1489675421</td> 
  </tr>
    <tr>
    <td>54000</td>
    <td>1489675423</td> 
  </tr>
    <tr>
    <td>56000</td>
    <td>1489675425</td> 
  </tr>
  <tr>
    <td>58000</td>
    <td>1489675427</td> 
  </tr>
    <tr>
    <td>60000</td>
    <td>1489675429</td> 
  </tr>
</table>


## CASE 2: with drift error

#### Filename: NNNN_GPS_error.csv

This is the second test file which represents information provided in one of the NNNN_GPS.cv files 
 and assumes that the SYS clock HAS a drift error. Therefore the SYS clock and GPS clock
are NOT synchronized. A 1,000 millisecond change in SYS is NOT necessarily equal to a 1 second change in the GPS time. 
<p>

When the spoon_test_02.m file is run using this file, the output file
 NNNN_SYS_new.csv will have a uniform 2000 millisecond spacing between the entries the first column, 
 but the entries in the second column with NOT always have a corresponding 2 second spacing. 
 
 


  <table style="width:100%">
  <tr>
    <th>ard_millis</th>
    <th>GPS Epoch Time [error]</th> 
    
  </tr>
  <tr>
    <td>6000</td>
    <td>1489675375</td> 
  </tr>
  <tr>
    <td>16000</td>
    <td>1489675380</td> 
  </tr>
    <tr>
    <td>32000</td>
    <td>1489675400</td> 
  </tr>
    <tr>
    <td>42000</td>
    <td>1489675406</td> 
  </tr>
</table>

When running the spoon_test_02.m program, the output file will NOT have 
uniform spacing between the entries in the second column, but the corresponding GPS Epoch times
shown in file NNNN_GPS_error.csv will match those shown in the output file. 

This is because the backward difference linear integration will use the values from the NNNN_GPS_error.csv file
to calcualte a list of scaling factors that are then applied to the entries in the NNNN_SYS.csv files to compensate for the SYS clock drift.

This is done with the following calcualtion:

<pre>
GPS_new[n] = (SYS[n] - SYS[n-1])*scale[j]) + GPS[n-1]

where:
 n is an index that can span 1 to size(SYS.csv)
 j is an index that can span 1 to size(GPS.csv)
 
 </pre>
 
 Because we are using the backward difference method, one assumption is that the SYS.csv files will always run for a longer duration than the GPS.csv file. The last scaling factor derived from the GPS.csv file is always applied to the last sets of ard_millis data.
 
 <p>
 A better solution could be implimenting the central 
 difference method or the forward difference method. In this way, a scaling factor is calcualted based on GPS data before and after the ard_millis event and
  then averaged together to interpolate. In this way it is possible to compensate for drift by applying the scaling value to the end of the data set even if the GPS.csv file ran for a longer duration that the SYS.csv file.  
  
  ## CASE 3: buoy data
  
  Run the third case to see the output when using real data buoy. 
