model lab8
  Real theta;
  Real M1(start=4.6);
  Real M2(start=4.1);
  parameter Real pcr=10.9;
  parameter Real N=30;
  parameter Real q=1;
  parameter Real tau1=18;
  parameter Real tau2=26;
  parameter Real p1=7.4;
  parameter Real p2=5.2;
  parameter Real a1=pcr/(tau1^2*p1^2*N*q);
  parameter Real a2=pcr/(tau2^2*p2^2*N*q);
  parameter Real b=pcr/(tau1^2*p1^2*tau2^2*p2^2*N*q);
  parameter Real c1=(pcr-p1)/(tau1*p1);
  parameter Real c2=(pcr-p2)/(tau2*p2);

equation
  //der(M1)=M1-b/c1*M1*M2-a1/c1*M1^2;
  //der(M2)=c2/c1*M2-b/c1*M1*M2-a2/c1*M2^2;
  der(M1)=M1-(b/c1 + 0.0006)*M1*M2-a1/c1*M1^2;
  der(M2)=c2/c1*M2-b/c1*M1*M2-a2/c1*M2^2;
  time=c1*theta;
end lab8;
