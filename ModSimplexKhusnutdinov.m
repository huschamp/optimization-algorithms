clc;
clear all;
A=[5 8 0 9 0;-3 0 6 1 8;-9 3 6 -1 4];
c=[5 -9 0 0 7]';
b=[22 12 3]';
bcopy=b;
ccopy=c;
n=length(A);
L=c;
%%%proverka na otricatelnost
for i=1:length(b)
if b(i)<0
A(i,:)=-A(i,:);
b(i)=-b(i);
end;
end;
 bcopy=b;
Acopy=A;
b1=[b;0];
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
%A=[A;-c']
AA=eye(length(b));
AA=[AA A];
c1=1:length(AA(1,:));
for i=1:length(c1)
if i>length(b)
c1(i)=L1(i-length(b));
else
c1(i)=0;
end;
end;
L1=L1(length(L1))
Bp=1:length(b);  %%% basisnie peremennie
NB=length(b)+1:length(AA(1,:))  %%nebasisnie peremennie
cb=zeros(1,length(Bp));
iter=1
cdo=-c1;
cc=-c1;
bb=b;
B=eye(length(Bp));
for i=1:length(Bp)
B(:,i)=AA(:,Bp(i));
end;
iB=inv(B);
coefS=[-1 -1];
ni=NB;
b1=b;
while min(coefS)<0
if iter~=1
cb(ms)=cdo(oldB); %coef pri basisnih peremennih
end;
cs=[];
for i=1:length(NB)
cs=[cs cb*iB*AA(:,NB(i))-cc(NB(i))];  %%coeff pri nebazis perem
end;
coefS=cs;
  for i=1:length(coefS)
   if abs(coefS(i))<0.00000000001
   coefS(i)=0;
   end;
  end;
[coef mm]=min(coefS);
 if coef>=0
     XB=iB*bb;
     LLL=cb*iB*bb+L1
     display 'optimalnoe reshenie';
     break;
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
fg=MB(j);
MB(j)=999999;
%if As(j)>-0.000001
%MB(j)=fg;
%end;
end;
MB(4)=999999;
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
oldB=NB(mm);
NB(mm)=Bp(ms);
Bp(ms)=oldB;
ni=NB;
iter=iter+1;
end;


B=eye(length(bcopy));
Bp=Bp(Bp~=length(b1))
NB=NB(NB>3)
for i=1:length(Bp)
Bp(i)=Bp(i)-3
end;

for i=1:length(NB)
NB(i)=NB(i)-3
end;
ni=NB;
iter=1;
cc=1:length(c);

bb=XB
AAA3=AA(:,4:8)
%AA=AA(1:3,5:9)
cc=c;
EY=eye(length(Bp));
for i=1:length(Bp)
AA(:,Bp(i))=EY(:,i);  %%tablica coefficentov pered peremennimi
cc(Bp(i))=0;  %% coefficienti v func celi (vida L=)
end;
L=XB(length(XB));
for i=1:length(NB)
cdo=cc(NB(i));
end;
cdo=cc;
cc=c;
cdo=c;
B=eye(length(Bp));
for i=1:length(Bp)
B(:,i)=AA(:,Bp(i));
%B(:,i)=AA(:,i);
end;
cb=zeros(1,length(Bp));
coefS=[-1 -1];
AA=AAA3;

for i=1:3
 for j=1:5
 if Bp(i)==j
 cb(i)=ccopy(j);
end
end
end

cc=cc';
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
     LLLk=cb*iB*bcopy
     display 'optimalnoe reshenie';
     return
 end;
ib=NB(mm);
As=iB*AA(:,NB(mm));
if max(As)<=0
    display 'Celevay funcia ne ogranichena na dopust mnogestve';
    return
end;
%bbs=iB*bb;
bbs=iB*bcopy
MB=[];
for j=1:length(bbs)
MB=[MB bbs(j)/As(j)];
end;
for j=1:length(bb)
if As(j)<0 
MB(j)=999999;
end;
if bbs(j)<0 
MB(j)=999999;
end;
end;
[s ms]=min(MB);
%RazS=ni(ms);
Et=B;
e=[];
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
ni=NB;
end;