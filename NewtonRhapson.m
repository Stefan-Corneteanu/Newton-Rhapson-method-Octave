clear all;

%initial data of the problem

V = 2; %circuit voltage in volts
R = 1000; %circuit resistance in ohms
Vd = 0:0.1:1.1; %for graph plotting reasons
f = (10^-14).*exp(Vd./0.026)-((2-Vd)/1000); %the function of voltage passing through the diode

%plotting the graph

plot (Vd,f,'g'); %should show the diode in conducting and blocking operation modes
grid on;
hold on;
title("Finding the value of the diode voltage");
xlabel("Vd");
ylabel("f(Vd)");

%initial guess and errors

Vdold = 0.75; %our initial guess of the diode voltage for Newton-Raphson
erradm=0.001; %we seek to find a value with a relative percent error less than 0.001%
err=1; %random value, must be bigger than erradm to enter Newton-Raphson iterations

%starting to apply Newton-Raphson

while err>=erradm,
  fold = (10^-14)*exp(Vdold/0.026)-((2-Vdold)/1000); %the function in our guess
  fprimeold = (Vdold/0.026)*(10^-14)*exp(Vdold/0.026)+0.001; %the derivative of the function in our guess
  plot (Vdold,fold,'r*'); %we will mark our guesses on the graph
  Vdnew = Vdold - (fold/fprimeold); %our new guess for the value of the diode voltage
  err = abs(Vdnew-Vdold)/Vdnew*100; %relative percent error
  disp([Vdold,fold,err]); %displaying in command window the last guess, the value of the function in it and the relative error of the next value
  %preparing the next iteration
  Vdold = Vdnew;
endwhile

%the while ended, this means we found a value with a small enough error
%we will compute the value of the function in it and display the final value,
%the value of the function in this value, and the final error
fnew = (10^-14)*exp(Vdnew/0.026)-((2-Vdnew)/1000);
plot (Vdnew,fnew,'m*'); %marking the final value on the graph with a distinguishable color to better see it
disp([Vdnew,fnew,err]);
