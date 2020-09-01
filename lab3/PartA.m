figure(1);
plot(TimeA, PartAData,  '-');
hold on;
plot(tout, simout,  '-');
ylabel('revolutions(counts)');
xlabel('Time(s)');
title('PartA');
legend('experiment', 'simulation');