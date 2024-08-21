Code: Seismic random noise suppression by structure-oriented BM3D

This is the code for the article "Seismic random noise suppression by structure-oriented BM3D".

This repository contains two folders：
1. "data"
2. "code"

"data" contains the data used in the article, divided into three subfolders：
1. "field": Data used for the field examples in the article.
2. "synthetic": Data used for the synthetic examples in the article.
3. "flatten_test":  Data used for the demonstration of flattening and restoring the events in the article.

"code" contains the code needed in the article. Below is a brief explanation of these code files:

main script files:
1. main_BM3D: BM3D denoising.
2. main_Structural_filtering: Structural filtering denoising.
3. main_SBM3D: Structure-oriented BM3D denoising.
4. flatten_test: The test of flattening and restoring events corresponds to Figure 5 in the article.
5. line_chart: Line chart code for Figures 18 and 19 in the article.

Function files:  
(a) BM3D code:
1. call_bm3d: This function is used to perform BM3D algorithm denoising on the input image and return different denoising results according to the parameter selection.
2. BM3Dz: This function implements the two main steps of the BM3D algorithm.
3. bm3dfun: This function performs the first step of denoising by searching, matching, and stacking similar image patches and performing hard thresholding on them.
4. Hthre: It is a sub-process in the bm3dfun function, which performs three-dimensional transformation, hard threshold processing and inverse transformation on the stacked three-dimensional image block array to remove noise and restore the image blocks.
5. bm3dfunw: This function performs the second step of denoising by searching, matching, and stacking similar image patches and performing hard thresholding on them.
6. wie: It is a sub-process in the bm3dfunw function, which performs three-dimensional transformation, wiener filtering processing and inverse transformation on the stacked three-dimensional image block array to remove noise and restore the image blocks.
7. getTransfMatrix: This function generates and returns the forward transformation matrix and the corresponding inverse transformation matrix of the specified size and type for image block transformation and inverse transformation operations.
8. bm3d_wiet: This function implements the weighted average processing in the BM3D algorithm. 

(b) PWD for local slope code:  
9. str_dip2d: This function implements the 2D data dip estimation based on shaping regularized PWD algorithm.  
10. str_conv_allpass: This function is a convolution operator implemented by an all-pass filter.  
11. str_divne: This function implements the N-dimensional smooth division rat=num/den.  
12. str_pwsmooth_lop2d: This function uses a two-dimensional plane wave smoothing algorithm to smooth the input noisy data.  
13. str_pwspray_lop2d: This function implements the 2D plane-wave spray operator.

(c) Structure-oriented BM3D code:  
14. SBM3D: This function implements the structure-oriented BM3D denoising.  
15. pw_flatten: The function implements flattening of seismic events.  
16. pwd_weit:  The function is used to calculate weight coefficient.  
17. seismic: This is the colormap for seismic images.  
18. get_SNR: The function is used to calculate SNR.

Note: This file "parameters.txt" is the parameters used in the article.


