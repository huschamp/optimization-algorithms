clc;
clear all;
A=[5 8 0 9 0;-3 0 6 1 8;-9 3 6 -1 4];
c=[5 -9 0 0 7]';
b=[22 12 3]';
n=length(A);
L=c;
%%%proverka na otricatelnost
for i=1:length(b)
if b(i)<0
A(i,:)=-A(i,:);
b(i)=-b(i);
end;
end;
Acopy=A;
b1=[b;0]; % 0 if L=0
L1=-sum(Acopy(:,:));
c1=-c;
J=[Acopy;c1'];
GGG=[0;-1;0;0]
J=[J GGG]
J=[J b1];
Awithb=[Acopy b];
L1=-sum(Awithb(:,:))
L1=[L1(1:6-1), 0, L1(6:length(L1))]
J=[J;L1] %%% J - table with synthetic basis unknown
Jcopy=J;
k=0;
NB=[];
iINDEX=[];
ni=[];
for e=1:length(J(1,:))-3
  ni=[ni 0];  %%unknown for calculate position x=0 
end;
for ik=(length(J(1,:))-3):-1:1 %%
h=[];
[minn j]=min(J(length(J(:,1)),1:length(J(1,:))-1)); %% razreshausiy stolbec
%%%
F=0;
for g=1:(length(J(:,1))-2)
h=[h J(g,length(J(1,:)))/J(g,j)]; %% otnoshenie b/a_is
end;
for g=1:(length(J(:,1))-2)
if  J(g,j)<0
    h(g)=1/0;  %% tak kak vibor tolko dly pologitelnih znachenii a_is
end;           %% to dly otricatelnih obrashaem v beskonechnost (budem schitati minimum)
end;
while F~=1  %%% cikl, dly togo chtobi ne povtorylis vivedennie i vvedennie v bazis peremennie
[minh i]=min(h)
BBBBB=isempty(find(iINDEX==i))
if isempty(find(iINDEX==i))==0
    h(i)=1/0;
else
    F=1;
end;
end;
iINDEX=[iINDEX i];  %%% i - razreshaushay stroka (3 cikla sverhu dly ee vichisleniy)
% % %   
RE=J(i,j);
J1=J;
J(:,j)=-J(:,j);
J(i,j)=1
for ii=1:n
    for jj=1:n+1-k
     if (ii~=i && jj~=j)
     J(ii,jj)=J1(ii,jj)*RE-J1(ii,j)*J1(i,jj)   %% algoritm
     end;
    end;
end;
J(:,:)=J(:,:)/RE;
k=k+1;
ni(i)=j;  %%% nomera peremennih vvedenih v bazis
if k~=1
if j>=NB(k-1)
    ni(i)=j+1;
end;
end;
if k==1
   NB=[NB j] 
end;
if k~=1
if j>=NB(k-1)
    NB=[NB j+1]
else
     NB=[NB j]
end;
end;
J(:,j)=[]
end;
NB=ni; %%% nomera bazisnih peremennih
J(length(J(:,1)),:)=[];
XBasis=NB
Xb=J(1:length(J(:,1))-1,length(J(1,:)))
XneBasis=[];
for i=1:length(c)
if isempty(find(XBasis==i))==1
XneBasis=[XneBasis i];  %%% nomera nebazisnih peremennih
end;
end;
FX=[Xb XBasis'];
FX=sortrows(FX,2);
FX=FX(:,1)';
for i=length(XneBasis):-1:1
p=ceil(XneBasis(i));
if p>length(FX)
FX=[FX 0];
else
FX=[FX(1:p-1), 0, FX(p:length(FX))];
end;
end;
XOpor=FX;  %% nachalnoe opornoe reshenie
Lprom=XOpor*c
sc=0;
PromTable=[];
Razdelitel=[];
for u=1:length(J(:,1))
Razdelitel=[Razdelitel;0]; %%%% tablici budut razdelytsy nulymi (0)
end;
while min(J(length(J(:,1)),1:length(J(1,:))-1))<0  %% 2-oi etap simplex-metoda
    sc=sc+1;
    PromTable=[PromTable J];
    PromTable=[PromTable Razdelitel];
h=[];
[minn j]=min(J(length(J(:,1)),1:length(J(1,:))-1));
for g=1:(length(J(1,:)))
h=[h J(g,length(J(1,:)))/J(g,j)];
end;
for g=1:(length(J(1,:)))
if  J(g,j)<0
    h(g)=1/0;
end;
end;
[minh i]=min(h)
a=XBasis(i);
b=XneBasis(j);
XBasis(i)=b;
XneBasis(j)=a;
RE=J(i,j);
J1=J;
J(:,j)=-J(:,j);
J(i,j)=1
for ii=1:length(J(:,1)) %n-1
    for jj=1:length(J(1,:)) % n-2
     if (ii~=i && jj~=j)
     J(ii,jj)=J1(ii,jj)*RE-J1(ii,j)*J1(i,jj)
     end;
    end;
end;
J(:,:)=J(:,:)/RE;
end;
PromTable=[PromTable J];
XOptimal=J(1:length(J(:,1))-1,length(J(1,:)))';
XOptimal=[XOptimal;XBasis]';
XOptimal=sortrows(XOptimal,2)';
XOptimal=XOptimal(1,:);
XneBasis=sort(XneBasis);
for i=1:length(XneBasis)
p=ceil(XneBasis(i));
if p>length(XOptimal)
XOptimal=[XOptimal 0];
else
XOptimal=[XOptimal(1:p-1), 0, XOptimal(p:length(XOptimal))];
end;
end;
OTBET=XOptimal