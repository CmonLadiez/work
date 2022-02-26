model lab03part2
  Real x(start=250000);
  Real y(start=380000);
  Real t = time;
equation
  der(x)=-0.337*x-0.733*y+sin(2*t)+1;
  der(y)=-0.29*x*y-0.8*y+2*cos(t);
end lab03part2;
