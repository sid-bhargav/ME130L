%% K-Constant Calculator
% Calculate mu
T = input("Input temperature of water in K. ");
mu = 2.414 * 10^(-5) * 10^(247.8/(T - 140)); % Given in Pa*s
mu = mu*10^(-3);  % Convert to cP

%% Calculate K

rhoB = input("Is the ball stainless steel (S) or glass(G)? ", 's');
if rhoB == "G" || rhoB == "g"
    rhoB = 2.53; % This is in g/cm^3
elseif rhoB == "S" || rhoB == "s"
rhoB = 8.02; % This is in g/cm^3
end

rhoF = input("Input fluid density in g/cm^3: ");

t = input("Input time in seconds: ");
t = t/60; % Converts time to minutes

K = mu/(t*(rhoB-rhoF));

%% Calculate uncertainty
uncertRhoF = input("Input associated uncertainty of the fluid density in g/cm^3: ");
partDerivRhoF = mu/(t*rhoF^2);

uncertMu = mu*0.025;
partDerivMu = 1/((rhoB - rhoF)*t);

uncertT = input("Input the uncertainty in seconds associated with time: ");
uncertT = uncertT/60; % Time uncertainty converted to minutes
partDerivT = -mu/((rhoB - rhoF)*t^2);

uncertK = ((uncertMu*partDerivMu)^2 + (uncertRhoF*partDerivK)^2 + (uncertT*partDerivT)^2)^0.5;

%% Output
str = ['The K-constant of the viscometer is ', num2str(K), ' +/-', num2str(uncertK), '.'];
disp(str) 