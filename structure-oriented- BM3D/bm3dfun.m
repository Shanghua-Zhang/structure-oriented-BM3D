function outstep1=bm3dfun(a,f,s,Nstep,N2,Tforward, Tinverse,Tforward3rd, Tinverse3rd,lambda_thr3D)

[m,n]=size(a);

a1=padarray(a,[f,f],'symmetric');

% Calculate the boundary information of array 
m1=f+1; 
m2=f+m; 
n1=f+1;
n2=n+f; 

out1=zeros(m+2*f,n+2*f);

% Loop of search window
for i=m1:Nstep:m2
    for j=n1:Nstep:n2
        
        ftemp=a1(i-f:i+f,j-f:j+f); % Select search window
         
        refer=ftemp(f+1-s:f+1+s-1,f+1-s:f+1+s-1); % Select reference block
        
        [p,q]=size(ftemp); 
        
        x1=s+1;
        x2=p-s+1;
        y1=s+1;
        y2=q-s+1;

        d=zeros(p-2*s+1,q-2*s+1); 
        
        % Loop of block
        for k1=x1:x2
            for k2=y1:y2

                stemp=ftemp(k1-s:k1+s-1,k2-s:k2+s-1); % Select candidate block
                
                d(k1-s,k2-s)=distan(refer,stemp); % Calculate the similarity between the reference block and the candidate block
            end
        end


        [md,nd]=size(d);
        
        [~,t]=sort(reshape(d,[md*nd,1])); 
        
        [maxv,maxt]=ind2sub([md,nd],t(1:N2)); 
        
        blk=zeros(2*s,2*s,N2); 

        % Stacking similar blocks into a 3D array
        for ii=1:N2
            blk(:,:,ii)=ftemp(maxv(ii):maxv(ii)+2*s-1,maxt(ii):maxt(ii)+2*s-1); 
        end
        
        % Perform Hard thresholding processing on each block in the array
        blk1=Hthre(blk,Tforward, Tinverse,Tforward3rd, Tinverse3rd,lambda_thr3D); 

        temp=out1*0; 
        temp(i-s:i+s-1,j-s:j+s-1)=mean(blk1,3); 
        out1=out1+temp; 
    
    end
end

% outstep1=ave(referx,f,s,Nstep,m,n);
weit=bm3d_weit(a,f,s,Nstep);
outstep1=out1./weit;
outstep1=outstep1(m1:m2,n1:n2); 

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dw=distan(a,b)
% Calculate similarity

a=reshape(a,[numel(a),1]);
b=reshape(b,[numel(b),1]);
c=a-b;

dw=(norm(c,2))^2;

end