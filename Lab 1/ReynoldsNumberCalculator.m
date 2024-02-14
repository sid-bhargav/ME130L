%% Reynold's Number Calculator
format short
rho = input("Fluid denstiy in g/cm^3: ");
rho = rho*(1/1000)*(100^3); % convert rho from g/cm^3 to kg/m^3
t = input("Time to travel 10cm in seconds: ");
V = 10/t*(1/100); % Velocity in m/s
D = 0.635;
D = D/100; % Diameter now in meters
mu = input("Viscosity in cP: ");
mu = mu*0.001; % converts mu from cP to Pa*s
numerator = rho*V*D;
Re = numerator/mu   % This value is unitless
