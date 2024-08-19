function [outstep1,outstep2]=BM3Dz(z,par)

% Get the forward and inverse transformation matrix
[Tfor, Tinv]   = getTransfMatrix(par.N1, par.transform_2D_HT_name, par.decLevel); 

[TforW, TinvW] = getTransfMatrix(par.N1_wiener, par.transform_2D_Wiener_name, 0); 

[Tfor3rd, Tinv3rd]   = getTransfMatrix(par.N2, par.transform_3rd_dim_name, 0);    

% Perform hard threshold filtering to obtain the results of the first stage
outstep1=bm3dfun(z,(par.Ns-1)/2,(par.N1)/2,par.Nstep,par.N2,Tfor, Tinv,Tfor3rd, Tinv3rd,par.lambda_thr3D);

% Perform Wiener filtering to obtain the results of the second stage
outstep2=bm3dfunw(z,outstep1,(par.Ns_wiener-1)/2,(par.N1_wiener)/2,...
    par.Nstep_wiener,par.N2_wiener,TforW, TinvW,Tfor3rd, Tinv3rd,par.sigma);

end

