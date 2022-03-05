model lab04part3
  Real x(start=0);
  Real y(start=-1);
  Real t = time;
equation
  der(x)=y;
  der(y)=-4*y-2*x+5*sin(t);
end lab04part3;
