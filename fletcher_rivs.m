clc
clear all
syms x1 x2 lymbda
f=@(x1,x2)(x1+7)^4 + (3*x1+7*x2)^2;
eps=0.00001;
k=1;
j=1;
n=2;
x=[1 0];
y=x;
d1=subs(subs(diff(f,x1),x1,x(1)),x2,x(2));
d2=subs(subs(diff(f,x2),x1,x(1)),x2,x(2));
grad=double([d1 d2]);
d=-double(grad);%/norm(grad);
while norm(grad)>eps
    F=@(lymbda) f(y(j,1)+lymbda*d(j,1),y(j,2)+lymbda*d(j,2));
    %lymbda= fminbnd(F, -30, 30);
    syms lymbda
    lymbda=minimum(F,lymbda)
    y(j+1,:)=y(j,:)+lymbda*d(j,:);
    if j<n
        d1=subs(subs(diff(f,x1),x1,y(j+1,1)),x2,y(j+1,2));
        d2=subs(subs(diff(f,x2),x1,y(j+1,1)),x2,y(j+1,2));
        grad1=double([d1 d2]);
        alpha(j)=(norm(grad1)^2)/(norm(grad)^2);
        d(j+1,:)=-grad1+alpha(j)*d(j,:);
        %grad=grad1; %%xz
        j=j+1
    elseif j==n
            y(1,:)=y(n+1,:);
            x(k+1,:)=y(n+1,:);
            d1=subs(subs(diff(f,x1),x1,y(1,1)),x2,y(1,2));
            d2=subs(subs(diff(f,x2),x1,y(1,1)),x2,y(1,2));
            grad1=double([d1 d2]);
            d(1,:)=-grad1;
            %grad=grad1
            j=1;
            k=k+1;
    end
    d1=subs(subs(diff(f,x1),x1,y(j,1)),x2,y(j,2));
    d2=subs(subs(diff(f,x2),x1,y(j,1)),x2,y(j,2));
    grad=double([d1 d2]);
%     lymbda= fminbnd(F, -10, 10);
%     x(k+1,:)=x(k,:)+lymbda*d(1,:);
%     
%     d1=subs(subs(diff(f,x1),x1,x(k+1,1)),x2,x(k+1,2));
%     d2=subs(subs(diff(f,x2),x1,x(k+1,1)),x2,x(k+1,2));
%     grad=[d1 d2];
%     d=-grad/norm(grad);
%     if mod(k,4)==0
%         d=x(k,:)-x(k-3,:);
%     end;
%     k=k+1;
end;
