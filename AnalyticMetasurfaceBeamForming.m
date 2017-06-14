%% paramaters
c        = 3E8; 
f        = 10e9;                % operation frequency
cellSize = 0.03;                % cell size
numCells = 160;                 % Number of cells
n        = 2.5;                 % dielectric index of refraction
apertSize= 0.48                 % aperture size
MinAmpl  = 0.5;                 % Minimum amplitude
MaxAmpl  = 1.5;                 % Maximum amplitude                               

lambda   = c/f;                 % wavelength
k        = 2*pi*f/c;            % wavevector
w        = 2*pi*f;              % angular frequency
phaseProfile

H0=1;
AmplFactor= H0*w^2/(4*pi*r)*exp(-1*k*r);

xpos=linspace(-apertSize/2,apertSize/2, numCells).';

AF=@(phi0,theta0,xpos,phiB) sin(theta0)*sum(exp(-1j*k*kron(xpos,(sin(phi0)-sin(phiB)))));

h_AFPlot=figure()
phi0=linspace(-pi/2,pi/2,200)

%optimal AF

hold on; cla;
for phiB=[0 30 60 90]
polarplot(phi0,db(AF(phi0,pi/2,xpos,phiB*pi/180)))
end

% binary
Xi=0.5*ones(size(xpos));
Mi=ones(size(xpos));

AF=@(phi0,theta0,xpos,phiB) Mi*sum(exp(-1j*k*kron(xpos,(sin(phi0)-sin(phiB)))));

