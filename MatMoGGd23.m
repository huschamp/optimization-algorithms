A=[5 8 0 9 0;-3 0 6 1 8;-9 3 6 -1 4];
b=[22 12 3];
c=[5 -9 0 0 7];
x1=1;x2=1;x3=1;x4=1;x5=1;
x=[x1 x2 x3 x4 x5];
y=[x(1:3-1), 76, x(3:length(x))]
L=(c'*x)
L=L(:,1)'
J1=[A;L];
J1=cat(2,J1,[b 0]');
J1=[-2+2/9	1+4/9	 2/9;
 5/9	 8/9	2+4/9;
1+2/9	-1+1/5	1;    
3+5/9	 2/3	7+1/5
]
JJJ=J1;
xr=[0 0 1]
xB=J1*xr'
xB1=[xr(1:2) xB(1:3)']
j=2;%выводим из базиса
i=2;%вводим в базис
J=J1;
XB=xB1;

for i=1:3
    for j=1:2
RE=J1(i,j);
J2=J1;
J2(:,j)=-1*J2(:,j);
J2(i,j)=1
for ii=1:4
    for jj=1:3
     if (ii~=i && jj~=j)
     J2(ii,jj)=J1(ii,jj)*RE-J1(ii,j)*J1(i,jj) %%ii,2 * 2,jj
     end;
    end;
end;
J2=J2/RE;
%J2(i,j)=1
J=[J;J2]
xr=[0 0 1];
xB=J2*xr';
xB=xB(1:3)';
    if i==2
    res=xB(1);
    xB(1)=xB(2);
    xB(2)=res;
    end;
    if i==3
    res=xB(1);
    xB(1)=xB(3);
    xB(3)=res;
    end;
if i==1
   p=2;
end;
if i==2
   p=3;
end;
if i==3
   p=4;
end;
if j==1
    p2=2;
else
    p2=1;
end;
 preserve=p2;
 if p2<p
 p2=p;
 p=preserve;
end;
xBas=[xB(1:p2-1), 0, xB(p2:length(xB))];
xBas=[xBas(1:p-1), 0, xBas(p:length(xBas))];
XB=[XB;xBas]
end;
end;
J1=JJJ;
J2=J1;
%%%%%%%%%%%%%%%%%%
for l=1:2
    J2=JJJ;
for j=1:2
    i=1;
if j==2
    J1=J2;
    i=2;
    if l==2
        i=3;
    end;
end;
RE=J1(i,j);
J2(:,j)=-1*J2(:,j);
J2(i,j)=1
for ii=1:4
    for jj=1:3
     if (ii~=i && jj~=j)
     J2(ii,jj)=J1(ii,jj)*RE-J1(ii,j)*J1(i,jj)
     end;
    end;
end;
J2=J2/RE;
%J2(i,j)=1
xr=[0 0 1];
xB=J2*xr';
xB=xB(1:3)';
if l==2 && i==3
    res=xB(2);
    xB(2)=xB(3);
    xB(3)=res;
end;
end;
p=4;
p2=3;
if l==2
    p=5;
    p2=3;
end;
xBas=[xB(1:p2-1), 0, xB(p2:length(xB))];
xBas=[xBas(1:p-1), 0, xBas(p:length(xBas))];
XB=[XB;xBas]

end;
%%%%%%%%%%%%
J1=JJJ;
J2=J1;
for j=1:2
    i=2;
if j==2
    J1=J2;
    i=3;
end;
RE=J1(i,j);
J2(:,j)=-1*J2(:,j);
J2(i,j)=1
for ii=1:4
    for jj=1:3
     if (ii~=i && jj~=j)
     J2(ii,jj)=J1(ii,jj)*RE-J1(ii,j)*J1(i,jj)
     end;
    end;
end;
J2=J2/RE;
%J2(i,j)=1
xr=[0 0 1];
xB=J2*xr';
xB=xB(1:3)';
if j==1
    res=xB(1);
    xB(1)=xB(2);
    xB(2)=res;
end;
if j==2
    res=xB(1);
    xB(1)=xB(2);
    xB(2)=xB(3);
    xB(3)=res;
end;
end;
p=4;
p2=4;
xBas=[xB(1:p2-1), 0, xB(p2:length(xB))];
xBas=[xBas(1:p-1), 0, xBas(p:length(xBas))];
XB=[XB;xBas]

otv=[];
for l=1:10
ot=A*XB(l,:)'
otv=[otv ot];
end;
xOpor=[];
for i=1:10
    s=0;
    for j=1:5
    if XB(i,j)<0
        s=1;
    end;
%      if otv(:,i)~=b(:)
%          s=1;
%      end;
    end;
    if s==0
       xOpor=[xOpor;XB(i,:)]; 
    end;
end;
L=[];
for i=1:length(xOpor(:,1))
    L=[L c*xOpor(i,:)']
end;
[m index]=max(L);
OptimalX=xOpor(index,:) %%%Ответ