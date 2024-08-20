function weit=bm3d_weit(a,f,s,Nstep)

[m,n]=size(a);

a1=padarray(a,[f,f],'symmetric');
m1=f+1;
m2=f+m;
n1=f+1;
n2=n+f;

a1=a1*0+1;
out1=a1*0;

% Loop of search window
for i=m1:Nstep:m2
    for j=n1:Nstep:n2

        refer=a1(i-s:i+s-1,j-s:j+s-1);   
        temp=out1*0;                     
        temp(i-s:i+s-1,j-s:j+s-1)=refer; 
        out1=out1+temp;                  
    end

end
weit=out1;
end