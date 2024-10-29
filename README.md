# Liver-DIR Validation Dataset
A dataset of CT image pairs with liver vessel landmarks for deformable image registration (DIR) algorithm verification and quality assurance (QA).

The landmark dataset introduced here is the first collection of large-scale liver CT DIR landmarks prepared on real patient images. This dataset can provide researchers with a dense set of ground truth benchmarks for the quantitative evaluation of DIR algorithms within the liver. 

![image](https://github.com/deshanyang/Liver-DIR-QA/assets/157416527/6a9a7aa1-69b3-4687-938a-acd7eb20bfad)




## Dataset Overview
This dataset contains 40 different cases of abdominal-pelvis CT image pairs, with a high number of liver vessel bifurcation landmark pairs identified in each case. These landmarks can be used for DIR algorithm validation and quality assurance. Images are obtained from several publicly available image repositories as well as clinical scans from Barnes Jewish Hospital.

We hope to publish the results of this study in a dataset article. Due to the size of the image files, the full dataset is saved on our publicly available Zenodo repository at https://zenodo.org/records/10553242. However, one example image pair with landmarks is included within this GitHub repository, along with a tutorial in loading and processing this data, to assist researchers in getting started with the dataset. Please see the tutorial folder in this GitHub for more information.

- The presented dataset comprises 40 pairs of intra-patient abdominal-pelvis CT images with various clinical quality. <br>
- Across the 40 cases, a total of 2220 landmark pairs were labeled, averaging ~55 pairs per case, far exceeding previous liver DIR evaluation reports.<br>
- Landmark identification and pairing accuracy underwent rigorous qauntitative analysis and manual validation.<br>



## Landmark Identification and Verification
Landmarks were identified using a semi-automatic pathway visualized below




During image preprocessing, images were denoised using FFDNet, a flexible deep learning based denoiser (Zhang et al., [2018]). Automatic segmentation of the liver was done using DirectORGANS (SIEMENS, [2021]). Liver vessel segmentation was accomplished using the Frangi vesselness filter (Frangi et al., [1998]) and hysteresis thresholding methods (Medina-Carnicer et al., [2009]). Bifurcations (landmarks) were detected directly on the skeleton of the vessel tree. The approximate registration is done using PTVReg (Vishnevskiy et al., [2017]) and GroupRegNet (Zhang et al., [2021]). Links to the sources listed are provided at the bottom of this document.

<img width="1080" alt="Landmark_pair_detectionV2" src="https://github.com/user-attachments/assets/62d1c4b4-ad4c-4a3f-b9d3-45cdb53519c2">


## Use of Dataset
### Dataset Organization
The full dataset, available on zenodo (https://zenodo.org/records/10553242), is organized into NIfTI file format. The dataset folder contains the image data in the NIfTI file format, with the landmarks stored in a text file. Each image and its landmarks are stored in its own file and are labeled by each case. Imaging and landmark data dimensions are in the order [sagittal, coronal, axial], with slice order also in accordance with the DICOM coordinate system. Landmark locations are saved as 3 columns of pixel indices (.txt file format), with each column corresponding to the dimensions of the image, in the same order. Image intensity values are still Hounsfield units shifted by 1000.



### Visualizing Landmarks
For those interested in looking at the landmark pairs available in this dataset, we recommend the use of MatchGui (Deshan Yang, 2017). MatchGui is a Matlab based tool and allows the user to load in both CT images as well as the landmark locations for each image. In this way, users can visualize each landmark pair individually, with up-sampling tools that can help inform the user if the dataset is right for their purposes. There are also functions allowing the user to flag certain landmarks and adjust them if they feel necessary.

![image](https://github.com/deshanyang/Liver-DIR-QA/assets/50779449/39a6f658-91ca-4a1d-b9f5-7c2e012679db)

A screenshot from the MatchGUI interface showing a landmark pair from the dataset.

For more extensive instructions on how to use matchgui, please refer to the tutorial folder in our Github. 

### Dataset Profiles:

| Case number | Voxel Size (mm) - Image 1                                     | Voxel Size (mm) - Image 2                                     | Landmark pair number  |
|-------------|---------------------------------------------------------------|---------------------------------------------------------------|-----------------------|
| 01          | 0.70, 0.70, 2.5                                               | 0.70, 0.70, 2.5                                               | 66                    |
| 02          | 0.82, 0.82, 2.5                                               | 0.82, 0.82, 2.5                                               | 58                    |
| 03          | 0.70, 0.70, 2.5                                               | 0.70, 0.70, 2.5                                               | 91                    |
| 04          | 0.82, 0.82, 2.5                                               | 0.82, 0.82, 2.5                                               | 30                    |
| 05          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 61                    |
| 06          | 0.70, 0.70, 2.5                                               | 0.70, 0.70, 2.5                                               | 38                    |
| 07          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 66                    |
| 08          | 0.70, 0.70, 2.5                                               | 0.70, 0.70, 2.5                                               | 39                    |
| 09          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 45                    |
| 10          | 0.74, 0.74, 2.5                                               | 0.74, 0.74, 2.5                                               | 65                    |
| 11          | 0.70, 0.70, 2.5                                               | 0.70, 0.70, 2.5                                               | 92                    |
| 12          | 0.82, 0.82, 2.5                                               | 0.82, 0.82, 2.5                                               | 88                    |
| 13          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 76                    |
| 14          | 0.86, 0.86, 2.5                                               | 0.86, 0.86, 2.5                                               | 69                    |
| 15          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 53                    |
| 16          | 0.90, 0.90, 2.5                                               | 0.90, 0.90, 2.5                                               | 53                    |
| 17          | 0.70, 0.70, 2.5                                               | 0.70, 0.70, 2.5                                               | 83                    |
| 18          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 144                   |
| 19          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 44                    |
| 20          | 0.86, 0.86, 2.5                                               | 0.86, 0.86, 2.5                                               | 44                    |
| 21          | 0.74, 0.74, 2.5                                               | 0.74, 0.74, 2.5                                               | 60                    |
| 22          | 0.86, 0.86, 2.5                                               | 0.86, 0.86, 2.5                                               | 118                   |
| 23          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 41                    |
| 24          | 0.78, 0.78, 2.5                                               | 0.78, 0.78, 2.5                                               | 42                    |
| 25          | 0.89, 0.89, 2                                                 | 0.61, 0.61, 2                                                 | 50                    |
| 26          | 0.98, 0.98, 1                                                 | 0.98, 0.98, 1                                                 | 68                    |
| 27          | 0.87, 0.87, 3                                                 | 0.96, 0.96, 3                                                 | 44                    |
| 28          | 0.68, 0.68, 2                                                 | 0.66, 0.66, 2                                                 | 56                    |
| 29          | 0.75, 0.75, 2                                                 | 0.73, 0.73, 2                                                 | 52                    |
| 30          | 0.66, 0.66, 2                                                 | 0.66, 0.66, 2                                                 | 82                    |
| 31          | 0.74, 0.74, 2.5                                               | 0.74, 0.74, 2.5                                               | 74                    |
| 32          | 0.74, 0.74, 2.5                                               | 0.74, 0.74, 2.5                                               | 30                    |
| 33          | 0.86, 0.86, 2.5                                               | 0.86, 0.86, 2.5                                               | 25                    |
| 34          | 0.94, 0.94, 2.5                                               | 0.94, 0.94, 2.5                                               | 23                    |
| 35          | 0.82, 0.82, 2.5                                               | 0.82, 0.82, 2.5                                               | 24                    |
| 36          | 0.90, 0.90, 2.5                                               | 0.90, 0.90, 2.5                                               | 18                    |
| 37          | 0.86, 0.86, 2.5                                               | 0.70, 0.70, 2.5                                               | 27                    |
| 38          | 0.84, 0.84, 1.25                                              | 0.75, 1.25, 1.25                                              | 17                    |
| 39          | 0.69, 0.69, 2                                                 | 0.64, 0.64, 0.7                                               | 35                    |
| 40          | 0.78, 0.78, 3                                                 | 0.76, 0.76, 3                                                 | 17                    |


### Citing
The results of this study are publicly available for use in DIR algorithm verification. If you used our work in any way, please cite our paper.

If you have any further questions about the dataset, please reach out to us at deshan.yang@duke.edu. Thank you!

## Sources
FFDNet- [https://arxiv.org/abs/1710.04026](https://github.com/cszn/FFDNet)

DirectORGANS - https://www.siemens-healthineers.com/en-us/radiotherapy/ct-for-rt/somatom-go-platform/directorgans-wp#29216a52

PTVReg - https://doi.org/10.1109/TMI.2016.2610583

GroupRegNet - https://doi.org/10.1088/1361-6560/abd956
