function xopt=huka_for_sht(f)

%f=@(x) (x(1)+7)^4 + (3*x(1)+7*x(2))^2;
eps=0.000000001;
eps=0.000001;
x=[5 5];
n=length(x);
d1=[1 0];
d2=[0 1];
d=[d1;d2];
y=x;
k=1;
j=1;
x(k+1,:)=[1 2];
syms lymbda
norm(x(k+1,:)-x(k,:));
while norm(x(k+1,:)-x(k,:))>eps
    F=@(lymbda) f(y(j,:)+lymbda*d(j,:));
    lymbda= fminbnd(F, -10, 10);
    y(j+1,:)=y(j,:)+lymbda*d(j,:);
    if j<n
        j=j+1;
        continue;
    else
        k=k+1;
        x(k+1,:)=y(n+1,:);
        
            y(1,:)=x(k+1,:);
            j=1;
    end;
end;
m=length(x(:,1));
xopt=x(m,:);
%y=round(f([x(m,1) x(m,2)]))

