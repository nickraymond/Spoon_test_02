% Filename: spoon_test_02.m
% Name: Nick Raymond
% Date: June 19, 2018
% Github repo: https://github.com/nickraymond/Spoon_test_02.git
%
% Description: script to test forward difference linear interpolation using NNNN_GPS.csv and NNNN_SYS_file.csv


% Step 0: Clean house and setup
    clc
    clear
    format long

    
% Step 1: import CSV files into tables
    
  % CASE 1: uncomment lines to test algorythm using inputs WITHOUT SYS drift error
    GPS_file = readtable("NNNN_GPS_ideal.csv"); 
    SYS_file = readtable("NNNN_SYS.csv");     
    disp("*** Running algorythm WITHOUT drift error ***");
 
  % CASE 2: uncomment lines to test algorythm using inputs WITH SYS drift error
%     GPS_file = readtable("NNNN_GPS_error.csv");      
%     SYS_file = readtable("NNNN_SYS.csv");             
%     disp("*** Running algorythm WITH drift error ***");


  % CASE 3: uncomment lines to test algorythm using real buoy data 
%     GPS_file = readtable("0872_GPS.csv");       % run data from Buoy
%     SYS_file = readtable("0872_SYS.csv"); % run data from Buoy
%     disp("*** Running algorythm using real buoy data ***");

    
    
% Step 2: check that NNNN ID numbers match from the two files
    % < if IDs do not match, end program and send error message> %

    
% Step 2: create an array of scaling factors based on NNNN_GPS.csv entries
    scale = ones(height(GPS_file),1)/1000;     % units [sec/millis]
    GPS_time = zeros(height(SYS_file),1);      % units [epoch time]
    
    % assume SYS clock is reliable after the reset, 1000 millis = 1 sec
    for i = 2:height(GPS_file)

        scale(i,1) = (GPS_file{i,2} - GPS_file{i-1,2})/(GPS_file{i,1} - GPS_file{i-1,1});

    end


% Step 3: determine the starting point when SYS_file was reset in EPOCH time,
    GPS_time(1,1) = GPS_file{1,2} - (GPS_file{1,1}/1000); % units in epoch time


% Step 4: use forward difference linear interpolation to convert ard_millis to GPS_time for NNNN_SYS.csv file
  
    % note ~ as part of the forward difference method we assume SYS.csv file ran longer than the GPS.csv file
    n = 2; % initialize counter

    for j = 1:height(GPS_file)

        while SYS_file{n,1} <= GPS_file{j,1} 

            GPS_time(n,1) = (SYS_file{n,1} - SYS_file{n-1,1})*scale(j,1) + GPS_time(n-1,1); % linear interpolation 
            
            n = n+1; % increment counter
            
        end

    end

    % finish off the last entries in the table using the last scaling factor
    if n <= length(GPS_time) 
        for n = n:length(GPS_time)

            GPS_time(n,1) = (SYS_file{n,1} - SYS_file{n-1,1})*scale(j,1) + GPS_time(n-1,1); % linear interpolation

        end
    end
    
    
% Step 5: append GPS_time to the NNNN_SYS.csv file, save as new file, and print to screen 
    SYS_new = table(SYS_file{:,1}, GPS_time, 'VariableNames',{'ard_millis','GPS_epoch_time'})
    writetable(SYS_new, 'NNNN_SYS_new.csv');

% Step 6: end of program, display message that program completed

disp(" ");
disp("program complete");