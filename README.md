# HoloAutopsy
This is a public GitHub repository for the Mixed Reality Digital Autopsy project (HoloAutopsy), which serves as supplementary material for our paper titled "Working with Forensic Practitioners to Understand the Opportunities and Challenges for Mixed-Reality Digital Autopsy" for CHI Conference on Human Factors in Computing Systems 2023.


# Instruction
The project was built on Unity 2020.3.24f and Mixed Reality Toolkit (MRTK) 2.7.3. It has been also tested with Unity 2021.3.19f and MRTK 2.8.2.

Steps to run the project:
1. Open project with Unity.
2- From menu Volume Rendering>Import, import your dataset through the relevant option.
3- Put the added object as a child of the existing VolumeRendereredObject.
4- Click on VolumeRenderedObject, and toggle lighting option (in Edit mode).
5- Change the transform of VolumeContainer to adjust the object to the center of VolumeRenderedObject.

# Citation
To acknowledge this project on Mixed Reality Digital Autopsy (HoloAutopsy), please cite our paper available at https://doi.org/10.1145/3544548.3580768

# Acknowledgement
This project uses and customises "UnityVolumeRendering," which is available at github.com/mlavik1/UnityVolumeRendering. Please refer to this repository for licensing and additional information. The project also utilises "OpenDicom," which is available at https://sourceforge.net/projects/opendicom/. Please refer to this website for licensing and additional information.

# Disclaimer
This is a research prototype, and deployment may not be seamless, and it is not intended for real or commercial use as there is no warranty for its functionality.
