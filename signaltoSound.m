% TAHERI MEISAM
% AZAPA
% Created: JAN 13
% Modified: 13 FEB 2019 

input = csvread('KYB.csv');
roll = input(:,1);
pitch = input(:,2);
sway = input(:,3);
surge = input(:,4);
pause('off')

duration = 25 - 2/500;
fs = 500;                    % sampling rate
T = 1/fs;                      % sampling period
t = 0:T:duration;              % time vector

fsq = 1000;                    % sampling rate
Tq = 1/fsq;                      % sampling period
tq = 0:Tq:duration;              % time vector
% adding amplitute
%disp(length(input))
pitchq = 100*interp1(t,pitch,tq);
rollq = 100*interp1(t,roll,tq);
swayq = 100*interp1(t,sway,tq);
surgeq = 100*interp1(t,surge,tq);

signal = pitchq + rollq +swayq+surgeq;
%sound (signal, 2* fsq , 16);
audiowrite('KYB.wav',signal,1000)
figure(1)
sound(signal, fsq);
 hold on
 %pause('on')
 x = 1:0.002:length(pitch);
 for i= 1:length(pitch)
    plot(x(1:i),(signal(1:i)))  
   % pause(0.001);
 end
%disp(signal);
csvwrite("KYB_signal.csv",signal);