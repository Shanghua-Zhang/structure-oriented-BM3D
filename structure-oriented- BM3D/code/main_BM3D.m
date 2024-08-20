clear
tic
%% Import data
load post_signal.mat
load post_nsignal.mat

%% Select BM3D transformation type ('dct', 'dst', 'hadamard'):
par.transform_2D_HT_name     = 'bior1.5'; 
par.transform_2D_Wiener_name = 'dct';     
par.transform_3rd_dim_name   = 'haar';    

%% Hard threshold filtering parameters:
par.N1                  = 8;   
par.Nstep               = 4;   
par.N2                  = 8;   
par.Ns                  = 39;  
par.lambda_thr3D        = 0.4;

%% Wiener filtering parameters:
par.N1_wiener           = 8;
par.Nstep_wiener        = 4;
par.N2_wiener           = 8;
par.Ns_wiener           = 39;
par.sigma               = 0.4;

par.decLevel            = 0;   

%% Denoising
deno=call_bm3d(n_signal,par,'w'); 

%% Draw figures
figure;imagesc(signal);colormap(seismic);clim([-1.8,1.8]);colorbar;xlabel('Trace number','FontSize',12);ylabel('Time(ms)','FontSize',12);title('clean data','FontSize',12);

figure;imagesc(n_signal);colormap(seismic);clim([-1.8,1.8]);colorbar;xlabel('Trace number','FontSize',12);ylabel('Time(ms)','FontSize',12);title('noisy data','FontSize',12);

figure;imagesc(deno);colormap(seismic);clim([-1.8,1.8]);colorbar;xlabel('Trace number','FontSize',12);ylabel('Time(ms)','FontSize',12);title('denoised data','FontSize',12);

figure;imagesc(n_signal-deno);colormap(seismic);clim([-1.8,1.8]);colorbar;xlabel('Trace number','FontSize',12);ylabel('Time(ms)','FontSize',12);title('removed noise','FontSize',12);

% Calculate SNR
noise = signal - deno;
SNR = get_SNR(signal,noise);

toc
