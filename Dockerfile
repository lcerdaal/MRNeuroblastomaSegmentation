FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN mkdir /app

WORKDIR /app

ADD requirements.txt .

RUN pip install  --upgrade pip
RUN pip install --upgrade keyrings.alt
RUN pip install  -r requirements.txt

RUN mkdir -p /mnt/nnUNet_raw_data_base/nnUNet_preprocessed && \
    mkdir -p /mnt/nnUNet_raw_data_base/nnUNet_raw_data && \
    mkdir -p /mnt/nnUNet_raw_data_base/nnUNet_trained_models

WORKDIR /mnt/nnUNet_raw_data_base/nnUNet_trained_models

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        p7zip-full wget libglib2.0-0 libsm6 libxext6 libxrender-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY nnUNet /mnt/nnUNet_raw_data_base/nnUNet_trained_models/nnUNet

ENV nnUNet_preprocessed=/mnt/nnUNet_raw_data_base/nnUNet_preprocessed
ENV nnUNet_raw_data_base=/mnt/nnUNet_raw_data_base
ENV RESULTS_FOLDER=/mnt/nnUNet_raw_data_base/nnUNet_trained_models

ENV APP nnunet_nb_segmentation

WORKDIR /module

COPY nnunet_nb_segmentation /module/nnunet_nb_segmentation

ENTRYPOINT ["python", "/module/nnunet_nb_segmentation/nnunet_nb_segmentation.py"]


