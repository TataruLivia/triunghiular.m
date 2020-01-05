T=40;
%aici modificati fiecare perioada ca fiind T=2*D si durata fiecaruia e
%numarul de ordine din lista aia
f=1/T;
w=2*pi*f;
pas=T/10000;
t = 0:pas:4*T;
N=50;
s=abs(sawtooth(w*t,0.5));
for n = -N:N
    C(n+N+1) = 1/T * integral(@(t)(abs(sawtooth(w*t,0.5))).*exp(-1j*n*w*t),0,T) ;
end
sr = 0;
for n = -N:N
    sr = sr + C(n+N+1)*exp(1j*n*w*t) ;
end
figure(1);
hold on
plot(t,real(sr),'-.r',t,imag(sr),'-.r');
plot(t,s);
xlabel("Timpul");
ylabel("Semnal(t) si semnal.recompus(t)");
title("Semnalul initial si cel recompus")
hold off
figure(2);
hold on
stem((-N:N)*w,2*abs(C));
xlabel('Pulsatia w');
ylabel('Amplitudinile Ak');
title('Spectrul de Amplitudini');
hold off
