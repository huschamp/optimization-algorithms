function x0 = minimum(f,x)
%syms x
%f=@(x) x^4-14*x+2;
%f=@(x) x^2+2
%xz=-12:0.1:12;
%y=xz.^4-14.*xz+2;

eps=0.000000001;
x0=0;
%plot(xz,y,'-');
%hold on
f1=diff(f,x);
f2=diff(f1,x);
while abs(subs(f1,x,x0))>eps
    x1=double(x0-subs(f1/f2,x, x0));
    x0=x1;
    %plot(x1,f(x1),'.r')
    %hold on
end;
