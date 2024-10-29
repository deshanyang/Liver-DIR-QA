# Dataset Tutorial
To help researchers to get started with the dataset, we included this tutorial to help with loading data into and using MatchGui. For more specific questions, please message us or email at deshan.yang@duke.edu.

## Matchgui installation
The source code for MatchGui is located in the matchgui folder of this Github repository. Download the folder to a desired location, unzip and add it to the Matlab path either by using the command addpath(foldername) or by going to Home->Set Path-> Add Folder. MatchGui should be compatible with Matlab R2022a, provided other dependencies are met. It is currently not stable on Matlab2019a or Matlab2017a.

## Load Dataset files
From our Zenodo dataset page, all image pairs in their original quality and the corresponding landmarks were provided. The image data was provided as NIfTI files. The landmark coordinate locations are saved as text files. You can easily follow the provided Matlab code file 'LoadingDatasetFile_and_Visualization.m' to load the dataset files into Matlab variables for any further processing.

## MatchGui 
One the images and landmarks are loaded properly to MATLAB. We can use MathGui to visualize the landmarks on images.

MatchGui accepts images and landmarks in the command line by the following structure: 
matchgui(img1,img2,'landmarks',landmark_pairs). 

The landmark_pairs argument should be structured as
landmark_pairs= [(1:num_landmarks)' landmarks1 ones(num_landmarks,1) landmarks2 ones(num_landmarks,1) ones(num_landmarks,1)]; where num_landmarks=length(landmarks1);

The order of the landmarks (landmarks1 vs landmarks2) from left to right in this argument should be the same as the order of the images in the call of matchgui. If the order is switched, the landmarks will occur on the wrong image. This likely will be visually apparent, and the adjustment can be made by calling the matchgui function again with the order of the images flipped (or flip the landmark pair order).

If the user desires, they can include a number of other arguments in their initial call of MatchGui, including 'windowcenter' and 'windowwidth', to help in the display of the images. These parameters can also be adjusted in the MatchGui interface. For more parameters, please see the miscellaneous instructions below.

#### Please note:
Due to the way images are loaded into MatchGui, they must be the same size, otherwise they will not properly display. To account for this, images with different dimensions that are loaded into MatchGui are resized automatically by adding the respective number of slices to each dimension needed. However this may affect the visualization of the landmarks properly. Therefore, in order to visualize the img1 and img2 in the same interface, the image pairs need to be resampled to the same image size.

### Miscellaneous MatchGui Instructions
There are some features included in the MatchGui program that are not a part of this tutorial either because they are incomplete or likely not useful for this specific dataset. This tutorial is included just so researchers can get started with the data, and is not meant to be a comprehensive guide on MatchGui. However, if there are any questions, please reach out to us at deshan.yang@duke.edu.

#### Matchgui Keyboard shortcuts
T = to toggle the flag “This is a good match”
F = to automatically re-assign the current feature position
Shift-d or “D”= to delete the re-assign the positions of the current feature pair (cannot be undone for now. A undo feature is not available.)
1, 2, 3 = the set the feature size scale for automatic position re-assigning
A = the manual re-assign the feature positions at the position of the last mouse click for the image that was clicked the last.
Left/right = to go to the previous / next feature pair
Shift-left/right = to jump to the previous / next feature pair in a step of 10
Shift-ctrl-left/right = to jump to the previous / next feature pair in a step of 100
Up/down = to go to the previous/next slice on the view which was mouse clicked the last
Shift-up/down = to go to the previous/next slice on the view on both images together
G = toggle between the original and the re-assigned positions
U = toggle up-sampling
