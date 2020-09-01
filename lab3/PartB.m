% figure(1);
% plot(TimeB, PartBData,  '-');
% hold on;
% plot(tout, simout,  '-');
% ylabel('revolutions(counts)');
% xlabel('Time(s)');
% title('PartB');
% legend('experiment', 'simulation');

num = [0 0.0000145 0.0000141];
den = [1 -1.8430 0.8430]
G = tf(num, den, 0.007)
rlocus(G);