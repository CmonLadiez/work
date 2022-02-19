s=8.1;// начальное расстояние от лодки до катера
fi=3*%pi/4;

//функция, описывающая движение катера береговой охраны
function dr=f(tetha, r)
 dr=r/sqrt(9.24);
endfunction;

//начальные условия в случае 1
r0=s/4.2;
tetha0=0;
tetha=0:0.01:2*%pi;

r=ode(r0,tetha0,tetha,f);

//функция, описывающая движение лодки браконьеров
function xt=f2(t)
 xt=tan(fi)*t;
endfunction

t=0:1:800;

polarplot(tetha,r,style = color('green')); //построение траектории движения катера в полярных координатах
plot2d(t,f2(t),style = color('red'));
