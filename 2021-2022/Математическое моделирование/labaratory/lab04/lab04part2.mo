model lab04part2
  Real x(start=0);
  Real y(start=-1);
equation
  der(x)=y;
  der(y)=-5*y-7*x;
end lab04part2;
