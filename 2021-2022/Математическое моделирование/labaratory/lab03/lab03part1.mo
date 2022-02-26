model lab03part1
  Real x(start=250000);
  Real y(start=380000);
  Real t = time;
equation
  der(x)=-0.4*x-0.607*y+2*sin(3*t);
  der(y)=-0.667*x-0.42*y+2*cos(6*t);
end lab03part1;
