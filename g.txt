clc
clear all
close all
%A = [3 5 ; 5 2];
%B = [15 ; 10];
A = [1 1;6 2;1 5;1 0;0 1]
B = [4;8;4;3;3]
A = [A;eye(2)]
B = [B;zeros(2,1)]
m = length(B);
x1 = 0:0.001:max(B)

%color = ['r','b','k','c'];

for i = 1:m
    x2 = (B(i) - A(i,1) * x1)/A(i,2);
    x22 = max(0,x2);
    plot(x1,x22);
    hold on
end
plot([3, 3], [min(B), max(B)], 'r');
pts = [];

for i = 1:m
    for j = i+1:m
        AA = [A(i,:) ; A(j,:)];
        BB = [B(i);B(j)];
        if det(AA) ~= 0
            X = AA\BB;
            pts = [pts,X];
        end
    end
end
pts


%c1 = @(x1,x2)3*x1 + 5*x2 -15;
%c2 = @(x1,x2)5*x1 + 2*x2 - 10;
%z = @(x1,x2) 5*x1 + 3*x2;
c1 = @(x1,x2) x1+x2-4;
c2 = @(x1,x2) 6*x1 + 2*x2 - 8;
c3 = @(x1,x2) x1 + 5*x2 -4;
c4 = @(x1) x1 - 3;

c5 = @(x2) x2 -3;
z = @(x1,x2) 2*x1 + 3*x2

fp=[];
Z=[];
for i = 1:length(pts)
    pt1 = pts(1,i);
    pt2 = pts(2,i);
    
    %if c1(pt1,pt2)<= 0 && c2(pt1,pt2)<=0
    if c1(pt1,pt2)<=0 && c2(pt1,pt2)>=0 && c3(pt1,pt2)>=0 && c4(pt1)<=0 && c5(pt2)<=0        
        fp = [fp,pts(:,i)];
        plot(pt1,pt2,'*r');
        Z = [Z,z(pt1,pt2)]
    end
end   
[optval,pos] = min(Z)
optsol = fp(:,pos)



