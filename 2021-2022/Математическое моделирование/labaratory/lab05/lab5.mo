model lab5
   parameter Real a = -0.22;
   parameter Real b = -0.066;
   parameter Real c = -0.66;
   parameter Real d = -0.022;
   parameter Real x_01 = 7;
   parameter Real y_01 = 15;
   parameter Real x_02 = c/d;
   parameter Real y_02 = a/b;
   //Real x(start = x_01);
   //Real y(start = y_01);
   Real x(start = x_02);
   Real y(start = y_02);  
equation
  der(x) = a*x - b*x*y;
  der(y) = -c*y + d*x*y;
end lab5;
