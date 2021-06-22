clc
clear all
Ff=@(x) (x(1)-1)^2 + (x(1)-x(2))^2
g1=@(x) (x(1)+3)^2+(x(2)+3)^2-25
g2=@(x) x(1)+x(2)+1
a=@(x) (max(g1(x),0))^2 + (max(g2(x),0))^2


eps1=0.001;
m(1)=0.5;
b=1.5;
kk=1;
x=[1 1];
while (m(kk)*a(x)>eps1)
    f=@(X) Ff(X)+m(kk)*a(X);
    
%     eps=0.001;
%     x=[1 1];
%     n=length(x);
%     d1=[1 0];
%     d2=[0 1];
%     d=[d1;d2];
%     y=x;
%     k=1;
%     j=1;
%     x(k+1,:)=[1 2];
%     syms lymbda
%     norm(x(k+1,:)-x(k,:));
%     while norm(x(k+1,:)-x(k,:))>eps
%         F=@(lymbda) f(y(j,:)+lymbda*d(j,:));
%         syms lll
%         lymbda= minimum_poisk(F,lll, -10, 10);
%         y(j+1,:)=y(j,:)+lymbda*d(j,:);
%         if j<n
%             j=j+1;
%             continue;
%         else
%             k=k+1;
%             x(k+1,:)=y(n+1,:);
%             if norm(x(k+1,:)-x(k,:))>eps
%                 dd=x(k+1,:)-x(k,:);
%                 F1=@(l) f(x(k+1,:)+l*dd);
%                 syms ll
%                 l=minimum_poisk(F1,ll,-10,10);
%                 y(1,:)=x(k+1,:)+l*dd;
%                 j=1;
%             end;
%         end;
%     end;
    %x=x(end,:);
    x=huka_for_sht(f);
    %x=x(end,:);
    m(kk+1)=m(kk)*b;
    kk=kk+1;
end;
a(x)