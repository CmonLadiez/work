model lab7
parameter Real N=1500;
Real n(start=15);
equation
//der(n)=(0.89+0.000015*n)*(N-n);
//der(n)=(0.000015+0.82*n)*(N-n);
der(n)=(sin(9*time)+0.3*sin(4*time)*n)*(N-n);
end lab7;
