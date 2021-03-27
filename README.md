# Essay Title
**TODO: this section has a short summary,  link to the essay, and an author list/links. this is also where a big picture is added!** \
(EXAMPLE) Code repository for our version of ["Essay Title"](Essay_full_link) by [Author1](Author1_site_full_link), ..... at Technion - Israel Institute of Technology.

<p align="center">
	<img src="ESSAY_BIG_SHOWCASE_IMAGE_full_link" | height=250>
</p>
<p align="center">
	<img src="https://i.imgur.com/kM2iPv7.png" | height=250>
</p>


For comparison and demonstation videos, please [see](https://www.vision-and-sensing.com/post/CREATE_A_POST_IF_YOU_NEED_THIS_SECTION).


## Requirements
**TODO: python/linux/matlab versions used, if you feel this is nessecary** \
(EXAMPLE:) This code was implemented with Python 3.6.3 and PyTorch 1.3.1 on Ubunto 18.04. \
All relevant packages can be installed using pip:
```bash
pip install -r requirements.txt
```

## Data & directory tree
**TODO: here you can put information about all data needed (to download and prepare before the run for example), all data used, \
all data created during the differnet algorithm phases, etc., as you see fit. use the following directory tree structure as needed.**
```
├── DepthCompVar # code
├── data  # KITTI's directory tree
|   ├── data_depth_annotated
|   |   └── val_selection_cropped # actual validation
|   ├── data_rgb
|   |   └── test
├── data_new # empty, at first. Will contain relevant data for a specific run
```

## Run algorithm
**TODO: please write all the common use cases of the algorithm commands here** \
(EXAMPLE1) A complete list of parameters is available with:
```bash
python main.py -h
```
(EXAMPLE2)
```bash
# Desired total budget of 2048 samples, accumulated during 2 phases, 3 predictors/mini-sets, train with d input
# in all phases + final
python main.py -B 2048 -K 2 -M 3 --just-d
```

## Runtime
**TODO: if needed (long runtime for example), detail the resources used and the time it took with these resources** \
(EXAMPLE:)
It may be different to your machine, due to different CPUs.
Our complete algorithm:
- A run with default parameters takes ~18.6h on 2 GeForce RTX 2080 Ti. A similar run with 4 GPUs and pred-bs=8 saves ~33% of the time.
Generating samples & depth predictions on 'test':
- Takes ~22 minutes for 797 images with default parameters on 2 GeForce RTX 2080 Ti.


## Citation
**TODO: change this with your citation section** \
If you find our work useful, please cite our paper:
```bash
@article{gofer2020adaptive,
  title={Adaptive LiDAR Sampling and Depth Completion using Ensemble Variance},
  author={Gofer, Eyal and Praisler, Shachar and Gilboa, Guy},
  journal={arXiv preprint arXiv:2007.13834},
  year={2020}
}
```

Feel free to place issues here or contact me via the e-mail in my personal page.


## Acknowledgements:
**TODO: add more acknowledgements or remove this entire section entirely, as needed** \
We took inspirations for this documentation from [Shachar Praisler](https://github.com/shacharp/Adaptive-LiDAR-Sampling) and we thank him for that.
