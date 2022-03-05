model lab04part1
  Real x(start=0);
  Real y(start=-1);
equation
  der(x)=y;
  der(y)=-7.5*x;
end lab04part1;
