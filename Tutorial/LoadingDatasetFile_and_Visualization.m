
%% Example code for loading the images and landamrks

%The example files used in this code can be downloaded in our dataset
% https://doi.org/10.5281/zenodo.10553242:
%'case1_img1.nii', 'case2_img1.nii' 
%'case1_landmarks1.txt' 'case1_landmarks2.txt'
% You can change them into any specific cases in our dataset
%

%Loading images
img1_nifti = niftiread('case1_img1.nii'); % img1
img2_nifti = niftiread('case2_img2.nii'); % img2
%Permute the image orientation for matlab visualization
img1_nifti = permute(img1_nifti, [2 1 3]);
img2_nifti = permute(img2_nifti, [2 1 3]);

%Loading image voxelsize info
info1 = niftiinfo('case1_img1.nii');
info2 = niftiinfo('case1_img1.nii');
info1.PixelDimensions(:,[1 2])=info1.PixelDimensions(:,[2 1]);
info2.PixelDimensions(:,[1 2])=info2.PixelDimensions(:,[2 1]);

%Loading landmarks
landmarks1_nifti = readmatrix('case1_landmarks1.txt'); %landmark 1
landmarks2_nifti = readmatrix('case1_landmarks2.txt'); %landmark 2
landmarks1_nifti(:,[1 2])=landmarks1_nifti(:,[2 1]);
landmarks2_nifti(:,[1 2])=landmarks2_nifti(:,[2 1]);


%% Visualize using MatchGui 

%Pleae add matchgui folder to matlab path before calling matchgui function
%(see our Tutorial)
num_landmarks = size(landmarks1_nifti,1);

landmark_pairs1= [(1:num_landmarks)' landmarks1_nifti ones(num_landmarks,1) landmarks1_nifti ones(num_landmarks,1) ones(num_landmarks,1)];
matchgui(img1_nifti, img1_nifti, 'landmarks',landmark_pairs1,'ratio',info1.PixelDimensions)

landmark_pairs2= [(1:num_landmarks)' landmarks2_nifti ones(num_landmarks,1) landmarks2_nifti ones(num_landmarks,1) ones(num_landmarks,1)];
matchgui(img2_nifti, img2_nifti, 'landmarks',landmark_pairs2,'ratio',info1.PixelDimensions)

%%
% To visualize image 1 and image 2 as a pair in the same matchgui interface,
% both of the images need to be preprocessed to the same image size.
% 
% Make sure img1 and img2 are in the same image size before utilizing the
% follwing exmaple:
landmark_pairs= [(1:num_landmarks)' landmarks1_nifti ones(num_landmarks,1) landmarks2_nifti ones(num_landmarks,1) ones(num_landmarks,1)];
matchgui(img_nifti, img2_nifti, 'landmarks',landmark_pairs2,'ratio',info1.PixelDimensions)








