model lab6
parameter Real n=20100;
parameter Real a=0.01;
parameter Real b=0.1;
Real I(start=77);
Real R(start=21);
Real S(start=n-77-21);
equation
//der(I)=-b*I;
//der(S)=0;
der(I)=-a*S;
der(S)=a*S-b*I;
der(R)=b*I;
end lab6;
