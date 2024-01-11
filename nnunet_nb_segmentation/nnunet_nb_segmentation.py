
import os
import subprocess



def nnunet (path_folder_nii, path_out):


    y ='nnUNet_predict -i ' + str(path_folder_nii) + ' -o ' + str(path_out) + ' -tr nnUNetTrainerV2 -ctr nnUNetTrainerV2CascadeFullRes -m 3d_fullres -p nnUNetPlansv2.1 -t Task004_Neuroblastoma'
    print(y)

    subprocess.run(y, shell=True)


path_project='/data'

path_DDBB='/data/BBDD'

path_DDBB_results='/data/BBDD_result'

os.makedirs(path_DDBB_results,exist_ok=True)

patients=os.listdir(path_DDBB)

for pat in patients:

    path_pat=os.path.join(path_DDBB, pat)
    path_pat_mod_2=os.path.join(path_DDBB_results, pat)

    studies=os.listdir(path_pat)

    for study in studies:

        path_study=os.path.join(path_pat, study)
        path_study_mod_2=os.path.join(path_pat_mod_2, study)

        try:
            os.makedirs(path_pat_mod_2,exist_ok=True)
            os.makedirs(path_study_mod_2,exist_ok=True)

        except:
            print('error')

        nnunet (path_study, path_study_mod_2)

