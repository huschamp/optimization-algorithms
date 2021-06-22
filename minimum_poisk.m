function xmin = minimum_poisk(f,x,aa,bb)
%f=@(x) x^4-14*x+2;
%f=@(x) x^2
%xz=-12:0.1:12;
%y=xz.^4-14.*xz+2;

a=[];
b=[];
%x=[];
a(1)=aa;
b(1)=bb;
n=1000;
h=(b(1)-a(1))/n;
k=1;
%x(1)=a(1);
eps=0.00001;
while abs(b(k)-a(k))>2*eps
    %x(k)=a(k)+h*k;
    %k=k+1;
    h=(b(k)-a(k))/n;
    y=[];
    x=[];
    x(1)=a(k);
    for i=1:n
        x(i)=a(k)+h*(i-1);
        y(i)=f(x(i));
    end;
    [minzn minindex]=min(y);
    k=k+1;
    a(k)=x(minindex)-h;
    b(k)=x(minindex)+h;
end;
xmin=(b(k)+a(k))/2;