% CP2.6
clear;
clc;
% (a)
sys0 = tf(4, 1);
sys1 = tf(1, [1 1]);
sys2 = tf(1, [1 0 2]);
sys3 = tf([4 2], [1 2 1]);
sys4 = tf(1, [1 0 0]);
sys5 = tf(50, 1);
sys6 = tf([1 0 2], [1 0 0 14]);

sys7 = series(sys1, sys2);
sys8 = feedback(sys7, sys3, -1);
sys9 = feedback(sys4, sys5, 1);
sys10 = series(sys8, sys9);
sys11 = feedback(sys10, sys6, -1);
sys12 = series(sys0, sys11);


% (b)
figure(1);
pzmap(sys12);

% (c)
p = pole(sys12);
z = zero(sys12);
figure(2);
plot(real(p), imag(p), 'x');
hold on;
plot(real(z), imag(z), 'o');
xlabel('Real axis');
ylabel('Imag axis');