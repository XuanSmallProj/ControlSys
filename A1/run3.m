% CP2.8
figure(1);
response(5);

figure(2);
response(10);

figure(3);
response(15);

function sys = cp2_3(z)
    sys = tf([20/z 20], [1 3 20]);
end

function response(z)
    sys = cp2_3(z);
    t = (0:0.005:6);
    [y, t] = step(sys, t);
    plot(t, y);
    grid on;
    xlabel('Time');
    ylabel('Output');
    title(sprintf('z = %d', z));
end