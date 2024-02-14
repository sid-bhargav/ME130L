%% Viscosity Calculator
% Calculate viscosity
K = input("Input K constant: ");

rhoB = input("Is the ball stainless steel (S) or glass(G)? ", 's');
if rhoB == "G" || rhoB == "g"
    rhoB = 2.53; % This is in g/cm^3
elseif rhoB == "S" || rhoB == "s"
rhoB = 8.02; % This is in g/cm^3
end

rhoF = input("Input fluid density in g/cm^3: ");

t = input("Input time in seconds: ");
t = t/60; % Converts time to minutes

mu = K*(rhoB - rhoF)*t;

%% Calculate uncertainty
uncertRhoF = input("Input associated uncertainty of the fluid density in g/cm^3: ");
partDerivRhoF = -K*t;

uncertK = input("Input the uncertainty associated with K: ");
partDerivK = (rhoB - rhoF)*t;

uncertT = input("Input the uncertainty in seconds associated with time: ");
uncertT = uncertT/60; % Time uncertainty converted to minutes
partDerivT = K*(rhoB - rhoF);

uncertMu = ((uncertK*partDerivK)^2 + (uncertRhoF*partDerivK)^2 + (uncertT*partDerivT)^2)^0.5;

%% Output
str = ['The viscosity of the fluid is ', num2str(mu), ' +/-', num2str(uncertMu), 'cP.'];
disp(str)
