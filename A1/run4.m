%CP2.9
%(a)
Gs = tf([1 1], [1 2]);
Hs = tf(1, [1 1]);
sys = feedback(Gs, Hs, -1);

%(b)
pzmap(sys);
p = pole(sys);
z = zero(sys);

%(c)
sys2 = minreal(sys);

%(d)