
clc
clear all
f=@(x) x^2-14*x+2;
xz=-12:0.1:12;
y=xz.^2-14.*xz+2;

x=[];
x(1)=7; h=0.001;
x(2)=x(1)+h;
a=0;
b=0;
k=1;
while (a==0) && (b==0)
    if f(x(2))<f(x(1))
        while f(x(k+1))<f(x(k))
            k=k+1;
            x(k+1)=x(k)+2*h;
        end;
        x(k+2)=x(k)-0.5*h;
        if f(x(k+2))>f(x(k))
            a=x(k-1);
            b=x(k+2);
        else
            a=x(k);
            b=x(k+1);
        end;
    else
        h=-h;
        x(2)=x(1)+h;
        if f(x(2))<f(x(1))
            while f(x(k+1))<f(x(k))
                k=k+1;
                x(k+1)=x(k)+2*h;
            end;
            x(k+2)=x(k)-0.5*h;
            if f(x(k+2))>f(x(k))
                a=x(k-1);
                b=x(k+2);
            else
                a=x(k);
                b=x(k+1);
            end;
        else
            a=x(2);
            b=x(2)-2*h;
        end;
    end;
end;
disp('a= ')
disp(a)
disp('b= ')
disp(b)