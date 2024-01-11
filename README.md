# nnUNet Segmentation Pipeline

This code implements a workflow for the automatic segmentation Neuroblastic tumor in T2-weighted magnetic resonance images.

### Usage

This code runs through a Docker image. To build the image, it's necessary to mount a `/data` volume containing the Database (BBDD) folder  with input images.
~~~~
docker run -v /project_path:/data nnunet_segmentation
~~~~
Make sure to replace /project_path/ with the actual path to your database.

### Database Structure
The structure of the database (BBDD) must follow the following format:

/project_path/BBDD
- Patient 1
	- Study
		- SequenceName1_0000.nii.gz
- Patient 2
	- Study 1
		- SequenceName2_0000.nii.gz
	- Study 2
		- SequenceName3_0000.nii.gz
- ...
- Patient N
	- Study 1
		- SequenceNameN_0000.nii.gz

Images should have names ending with _0000.nii.gz.

### Results
Segmented results will be saved in the BBDD_result directory with the following structure:

/project_path/BBDD_result
- Patient 1
	- Study
		- SequenceName1.nii.gz
- Patient 2
	- Study 1
		- SequenceName2.nii.gz
	- Study 2
		- SequenceName3.nii.gz
- ...
- Patient N
	- Study 1
		- SequenceNameN.nii.gz

### Developers
This code has been developed within the PRIMAGE project framework by Leonor Cerda Alberich, Diana Veiga Canuto and Matías Fernandez Paton of Biomedical Imaging Research Group (GIBI230) at Hospital Politécnico La Fe.