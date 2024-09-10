
%% Example code for loading the images and landamrks

%Loading images
img1_nifti = niftiread('case1_img1.nii'); % img1
img2_nifti = niftiread('case2_img2.nii'); %
%Permute the image orientation for matlab visualization
img2_nifti = permute(img2_nifti, [2 1 3]);
img1_nifti = permute(img1_nifti, [2 1 3]);

%Loading image voxelsize info
info1 = niftiinfo([pathNii,num2str(caseno),'_img1.nii']);
info2 = niftiinfo([pathNii,num2str(caseno),'_img2.nii']);
info1.PixelDimensions(:,[1 2])=info1.PixelDimensions(:,[2 1]);
info2.PixelDimensions(:,[1 2])=info2.PixelDimensions(:,[2 1]);

%Loading landmarks
landmarks1_nifti = readmatrix('case1_landmarks1.txt');
landmarks2_nifti = readmatrix('case1_landmarks2.txt');
landmarks1_nifti(:,[1 2])=landmarks1_nifti(:,[2 1]);
landmarks2_nifti(:,[1 2])=landmarks2_nifti(:,[2 1]);

%% Adding noise blur to the images
Noise_std = 3 + 3*rand; %Please adjust the Noise_std value to control the motion blur level
img1_size = size(img1_nifti); 
img2_size = size(img2_nifti);
img1_noise = img1_nifti + Noise_std.*randn(img1_size);
img2_noise = img2_nifti + Noise_std.*randn(img2_size);


%% Adding Motion blur to the images
 %Please adjust the SIGMA value to control the motion blur level
SIGMA =  3 + 2*rand;
fprintf(['SIGMA',num2str(SIGMA)]);
h = fspecial('gaussian',[1 5],SIGMA); h = reshape(h,[1 1 5]);
img1_blur = convn(img1_nifti,h,'same');
img2_blur = convn(img2_nifti,h,'same');





