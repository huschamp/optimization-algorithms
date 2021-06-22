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
J=[J b1];
Awithb=[Acopy b];
L1=-sum(Awithb(:,:))
NB=[];
iINDEX=[];
ni=[];
AA=[];
for i=1:length(b)
AA=eye(3);
end;
AA=[AA A]
c1=1:length(AA(1,:));
for i=1:length(c1)
if i>length(b)
c1(i)=L1(i-length(b));
else
c1(i)=0;
end;
end;
%c1=L1(1:length(L1)-1);
L1=L1(length(L1))
Bp=1:length(b);
NB=length(b)+1:length(AA(1,:))

cb=zeros(1,length(Bp));
iter=1
cdo=-c1;
cc=-c1;
bb=b;
B=eye(length(Bp));
for i=1:length(Bp)
B(:,i)=AA(:,Bp(i));
%B(:,i)=AA(:,i);
end;
iB=inv(B);
coefS=[-1 -1];
ni=NB;
while min(coefS)<0
%if iter==1
%cb=zeros(1,length(Bp));
%end;
if iter~=1
%cb(iter-1)=cdo(NB(mm));
cb(ms)=cdo(oldB);
end;
cs=[];
for i=1:length(NB)
cs=[cs cb*iB*AA(:,NB(i))-cc(NB(i))];  %%coeff pri nebazis perem
end;
coefS=cs;
[coef mm]=min(coefS);
 if coef>=0
     XB=iB*bb;
     LLL=cb*iB*bb+L1
     display 'optimalnoe reshenie';
     break
 end;
ib=NB(mm);
As=iB*AA(:,NB(mm));
if max(As)<=0
    display 'Celevay funcia ne ogranichena na dopust mnogestve';
    return
end;
bbs=iB*bb;
MB=[];
for j=1:length(bbs)
MB=[MB bbs(j)/As(j)];
end;
for j=1:length(bb)
if As(j)<0
MB(j)=999999;
end;
end;
[s ms]=min(MB);
RazS=ni(ms);
Et=B;
for i=1:length(bbs)
    if i==ms
        e(i)=1/As(ms);
    else
        e(i)=-As(i)/As(ms)
    end
end
Et(:,ms)=e; %% elementarnay matrica
iB2=Et*iB;
iB=iB2;
iter=iter+1;
 oldB=NB(mm);
 NB(mm)=Bp(ms);
 Bp(ms)=oldB;
end;




iter=1;
%AA=A;
Bp=int8(Bp);
cc=1:length(c);
bb=J(1:length(J(:,1))-1,length(J(1,:))); %%pravay chast tablici (znacheniy bazisn peremennih)
for i=1:length(NB)
AA(:,NB(i))=J(1:length(J(:,1))-1,i);
cc(NB(i))=-J(length(J(:,1)),i);
end;
%AAA=AA(:,Bp(1)-1)
%AAA2=AA(:,Bp(2))
%AA=[AA(:,Bp(1)), [1;1;1], AA(:,Bp(1)+1)];
EY=eye(length(Bp));
for i=1:length(Bp)
AA(:,Bp(i))=EY(:,i);  %%tablica coefficentov pered peremennimi
cc(Bp(i))=0;  %% coefficienti v func celi (vida L=)
end;
L=J(length(J(:,1)),length(J(1,:))) %znachenie func celi pri x_nebasis=0
for i=1:length(NB)
cdo=cc(NB(i));
end;
cdo=cc;
B=eye(length(Bp));
for i=1:length(Bp)
B(:,i)=AA(:,Bp(i));
%B(:,i)=AA(:,i);
end;
iB=inv(B);
cb=zeros(1,length(Bp));
coefS=[-1 -1];
while min(coefS)<0
%if iter==1
%cb=zeros(1,length(Bp));
%end;
if iter~=1
%cb(iter-1)=cdo(NB(mm));
cb(ms)=cdo(oldB);
end;
cs=[];
for i=1:length(NB)
cs=[cs cb*iB*AA(:,NB(i))-cc(NB(i))];  %%coeff pri nebazis perem
end;
coefS=cs;
[coef mm]=min(coefS);
 if coef>=0
     XB=iB*bb;
     LLL=cb*iB*bb+L
     display 'optimalnoe reshenie';
     return
 end;
ib=NB(mm);
As=iB*AA(:,NB(mm));
if max(As)<=0
    display 'Celevay funcia ne ogranichena na dopust mnogestve';
    return
end;
bbs=iB*bb;
MB=[];
for j=1:length(bbs)
MB=[MB bbs(j)/As(j)];
end;
for j=1:length(bb)
if As(j)<0
MB(j)=999999;
end;
end;
[s ms]=min(MB);
RazS=ni(ms);
Et=B;
for i=1:length(bbs)
    if i==ms
        e(i)=1/As(ms);
    else
        e(i)=-As(i)/As(ms)
    end
end
Et(:,ms)=e; %% elementarnay matrica
iB2=Et*iB;
iB=iB2;
iter=iter+1;
 oldB=NB(mm);
 NB(mm)=Bp(ms);
 Bp(ms)=oldB;
end;