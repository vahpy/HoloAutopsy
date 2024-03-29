# HoloAutopsy
This is a public GitHub repository for the Mixed Reality Digital Autopsy project (HoloAutopsy), which serves as supplementary material for our paper titled "Working with Forensic Practitioners to Understand the Opportunities and Challenges for Mixed-Reality Digital Autopsy" for CHI Conference on Human Factors in Computing Systems 2023.


# Instruction
The project was built on Unity 2020.3.24f and Mixed Reality Toolkit (MRTK) 2.7.3. It has been also tested with Unity 2021.3.19f and MRTK 2.8.2.

Steps to run the project:
1. Open the project using Unity.
2. Go to `Volume Rendering` in the menu bar and select `Import`. Import your dataset using the appropriate option.
3. Add the imported object as a child of the existing `VolumeRenderedObject`.
4. Select `VolumeRenderedObject` and toggle the `lighting` option.
5. Adjust the transform of `VolumeContainer` to centre the object within `VolumeRenderedObject`.

# Citation
To acknowledge this project on Mixed Reality Digital Autopsy (HoloAutopsy), please cite our paper available at https://doi.org/10.1145/3544548.3580768

# Acknowledgement
Please refer to Acknowledgement.txt for libraries used by this project.

# Disclaimer
This is a research prototype, and deployment may not be seamless, and it is not intended for real or commercial use as there is no warranty for its functionality.
