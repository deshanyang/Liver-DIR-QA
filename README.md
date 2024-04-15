# Liver-DIR Validation Dataset
A dataset of CT image pairs with liver vessel landmarks for deformable image registration (DIR) algorithm verification and quality assurance (QA).

The landmark dataset introduced here is the first collection of large-scale liver CT DIR landmarks prepared on real patient images. This dataset can provide researchers with a dense set of ground truth benchmarks for the quantitative evaluation of DIR algorithms within the liver. 

![image](https://github.com/deshanyang/Liver-DIR-QA/assets/157416527/6a9a7aa1-69b3-4687-938a-acd7eb20bfad)




## Dataset Overview
This dataset contains 30 different cases of abdominal-pelvis CT image pairs, with a high number of liver vessel bifurcation landmark pairs identified in each case. These landmarks can be used for DIR algorithm validation and quality assurance. Images are obtained from several publicly available image repositories as well as clinical scans from Barnes Jewish Hospital.

We hope to publish the results of this study in a dataset article. Due to the size of the image files, the full dataset is saved on our publicly available Zenodo repository at https://zenodo.org/records/10553242. However, one example image pair with landmarks is included within this GitHub repository, along with a tutorial in loading and processing this data, to assist researchers in getting started with the dataset. Please see the tutorial folder in this GitHub for more information.

- The presented dataset comprises 30 pairs of intra-patient abdominal-pelvis CT images with various clinical quality. <br>
- Across the 30 cases, a total of 2028 landmark pairs were labeled, averaging ~68 pairs per case, far exceeding previous liver DIR evaluation reports.<br>
- The mean and standard deviations of the TREs were 0.64±0.40 mm evaluated using digital phantoms.<br>
- Landmark identification and pairing accuracy underwent rigorous manual validation by two observers.<br>



## Landmark Identification and Verification
Landmarks were identified using a semi-automatic pathway visualized below

![image](https://github.com/deshanyang/Liver-DIR-QA/assets/50779449/d24da18b-09f6-46d7-8fb4-db89378a300a)



During image preprocessing, images were denoised using FFDNet, a flexible deep learning based denoiser (Zhang et al., [2018]). Automatic segmentation of the liver was done using DirectORGANS (SIEMENS, [2021]). Liver vessel segmentation was accomplished using the Frangi vesselness filter (Frangi et al., [1998]) and hysteresis thresholding methods (Medina-Carnicer et al., [2009]). Bifurcations (landmarks) were detected directly on the skeleton of the vessel tree. The approximate registration is done using PTVReg (Vishnevskiy et al., [2017]). Links to the sources listed are provided at the bottom of this document.



## Use of Dataset
### Dataset Organization
The full dataset, available on zenodo (https://zenodo.org/records/10553242), is organized into NIfTI file format. The dataset folder contains the image data in the NIfTI file format, with the landmarks stored in a text file. Each image and its landmarks are stored in its own file and are labeled by each case. Imaging and landmark data dimensions are in the order [sagittal, coronal, axial], with slice order also in accordance with the DICOM coordinate system. Landmark locations are saved as 3 columns of pixel indices, with each column corresponding to the dimensions of the image, in the same order. Image intensity values are still Hounsfield units shifted by 1000.

The first is a folder containing 30 .mat files. In each of these files is the imaging data for both CT images in a pair, the landmark locations for each image, and the voxel sizes of each image. The imaging data in the .mat files is organized in the dimensions [coronal, sagittal, axial], with the order of the slices in accordance with DICOM formatting [anterior:posterior, right:left, inferior:superior]. Landmark locations are saved as 3 columns of pixel indices, with each column corresponding to the dimensions of the image, in the same order. Image intensity values are saved as Hounsfield units shifted by 1000.

### Visualizing Landmarks
For those interested in looking at the landmark pairs available in this dataset, we recommend the use of MatchGui (Deshan Yang, 2017). MatchGui is a Matlab based tool and allows the user to load in both CT images as well as the landmark locations for each image. In this way, users can visualize each landmark pair individually, with up-sampling tools that can help inform the user if the dataset is right for their purposes. There are also functions allowing the user to flag certain landmarks and adjust them if they feel necessary.

![image](https://github.com/deshanyang/Liver-DIR-QA/assets/50779449/39a6f658-91ca-4a1d-b9f5-7c2e012679db)

A screenshot from the MatchGUI interface showing a landmark pair from the dataset.

For more extensive instructions on how to use matchgui, please refer to the tutorial folder in our Github.

### Citing
The results of this study are publicly available for use in DIR algorithm verification. If you used our work in any way, please cite our paper at .

If you have any further questions about the dataset, please reach out to us at zhendong.zhang@duke.edu. Thank you!

## Sources
FFDNet- [https://arxiv.org/abs/1710.04026](https://github.com/cszn/FFDNet)

DirectORGANS - https://www.siemens-healthineers.com/en-us/radiotherapy/ct-for-rt/somatom-go-platform/directorgans-wp#29216a52

PTVReg - https://doi.org/10.1109/TMI.2016.2610583
