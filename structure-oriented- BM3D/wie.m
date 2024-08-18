function a1=wie(a,Tforward, Tinverse,Tforward3rd, Tinverse3rd,sigma)

[m,n,o]=size(a);
s=a*0;

for i=1:o
    for j=1:n
        s(:,j,i)=Tforward*reshape(a(:,j,i),[m,1]); 
    end
end

for i=1:o
    for j=1:m
        s(j,:,i)=Tforward*reshape(s(j,:,i),[n,1]); 
    end
end

for i=1:n
    for j=1:m
        s(j,i,:)=Tforward3rd*reshape(s(j,i,:),[o,1]); 
    end
end
 
weit=s.^2./(s.^2+sigma);
s=s.*weit;

a1=s*0;

for i=1:n
    for j=1:m
        a1(j,i,:)=Tinverse3rd*reshape(s(j,i,:),[o,1]);
    end
end

for i=1:o
    for j=1:m
        a1(j,:,i)=Tinverse*reshape(a1(j,:,i),[n,1]);
    end
end

for i=1:o
    for j=1:n
        a1(:,j,i)=Tinverse*reshape(a1(:,j,i),[m,1]);
    end
end

end