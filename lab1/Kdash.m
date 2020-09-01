% parameters initialization
g = 9.81; % acceleration of gravity
m = 0.127; % Pendulum mass
M = 3.22; % cart system mass
l = 0.1778; % distance from pivot point to pendulum's centre of mass
um = 0.8; % motor efficiency
Kt = 0.36; % motor torque constant
rmp = 1.11e-2; % motor pinion radius
Adash = [0 0 1 0 0; 0 0 0 1 0; 0 (m*g)/(M) 0 0 0; 0 (M+m)*g/(l*m) 0 0 0; -1 0 0 0 0]; % A' and B' matrix from error dynamic system
Bdash = [0 ; 0; (um*Kt)/(M*rmp) ; (um*Kt)/(M*l*rmp);0];
K = z5146927(Adash,Bdash);

% This function was done before the lab
function K = z5146927(Ai,Bi)
OS_perc = 6.247637661;
Tau_s = 1.155354157;
Fs_1 = 2.103091691;
Fs_2 = 2.165341033;

%Use ¦Ós and PO% given to you to calculate poles p1 and p2
Zeta = -log(OS_perc/100)/sqrt(pi^2+log(OS_perc/100)^2);
Natural_F = -log(0.02*sqrt(1-Zeta^2))/(Tau_s*Zeta);
Damping_F = sqrt(1-Zeta^2)*Natural_F;
Sigma = Zeta*Natural_F;

p1 = complex(-Sigma, -Damping_F);
p2 = complex(-Sigma, Damping_F);

%p3 = Real part of p1*fs1;
p3 = Fs_1*real(p1);

%p4 = Real part of p1 * fs2;
p4 = Fs_2*real(p1);

p5 = -0.1;

p=[p1, p2, p3, p4, p5];

K = place(Ai, Bi, p);

return
end