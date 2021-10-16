% cp2.5
clear;
clc;
% (a)
J = 10.8E8;
k = 10.8E8;
a = 1;
b = 8;
sys1 = cp2_5(k, a, b, J);

% (b)
figure(1);
t = (0:0.005:100);
[y1, t1] = step(sys1, t);
y1 = 10 * y1;  % 由于是LTI系统，所以直接乘10可得到系统在幅值为10的阶跃信号下的响应
plot(t1, y1);
grid on;
xlabel('预期姿态');
ylabel('实际姿态');

%(c)
figure(2);
J2 = J * 0.8;
sys2 = cp2_5(k, a, b, J2);
[y2, t2] = step(sys2, t);
y2 = 10 * y2;
plot(t2, y2);
grid on;
title(sprintf("J = %d (0.8)", J2));
xlabel('预期姿态');
ylabel('实际姿态');

figure(3);
J3 = J * 0.5;
sys3 = cp2_5(k, a, b, J3);
[y3, t3] = step(sys3, t);
y3 = 10 * y3;
plot(t3, y3);
grid on;
title(sprintf("J = %d (0.5)", J3));
xlabel('预期姿态');
ylabel('实际姿态');

% CP2.5 卫星单轴控制系统
function sys = cp2_5(k, a, b, J)
    sys1 = zpk([-a], [-b], k);
    sys2 = tf([1], [J, 0, 0]);
    sys3 = series(sys1, sys2);
    sys = feedback(sys3, [1]);
end