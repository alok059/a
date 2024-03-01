A = [6 4 1 0 0 0;1 2 0 1 0 0;-1 1 0 0 1 0;0 1 0 0 0 1]
B=[24;6;1;6]
[m,n] = size(A)
C =[5 4 0 0 0 0]
bs=[];
bfs=[];

if n>=m
    P = nchoosek(n,m);
    Pair = nchoosek(1:n,m);
    for i = 1:P
        x = zeros(n,1);
        bv_index = Pair(i,:);
        AA = A(:,bv_index);
        y = AA\B;
       
        bs = [bs,y];
        x(bv_index)=y;
        if x>=0
            bfs = [bfs,x];
        end
    end
end
bs
bfs
Z = @(x) C*x
z = Z(bfs)
[opval,pos]=max(z)
optsol = bfs(:,pos)
