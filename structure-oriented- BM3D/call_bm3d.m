function sup3=call_bm3d(a1,par,verb)

z=(a1-min(min(a1)))./(max(max(a1))-min(min(a1))); % Normalization

[x,xw]=BM3Dz(z,par);

x=x.*(max(max(a1))-min(min(a1)))+min(min(a1)); 

xw=xw.*(max(max(a1))-min(min(a1)))+min(min(a1)); 

if verb=='h'
    sup3=x;
else
    sup3=xw;
end
end