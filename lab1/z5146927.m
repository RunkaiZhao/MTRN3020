function K = z5146927(Ai,Bi)

Tau_s = 6.247637661;
OS_perc = 1.155354157;
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
p3 = real(p1)*Fs_1;

%p4 = Real part of p1 * fs2;
p4 = real(p1)*Fs_2;

p5 = -0.1;

p=[p1, p2, p3, p4, p5];

K = place(Ai, Bi, p);

return