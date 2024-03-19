# dali-classifier

Jupyter notebook to train a computer vision model to recognize our cat, Dali.
I wrote about it in this [blog post](https://tlbvr.com/blog/deep-learning-cat-classifier/).

This project uses [`nix`](https://nixos.org/) to set up the python environment.

The original train set is not included in this repository because it contains personal images. However, the notebook's output shows you the kind of images I used.

Open `train.ipynb` in Jupyter Notebook.

```console
jupyter notebook
```
Note: I trained this model on apple silicon, so I had to set the environment variable `PYTORCH_ENABLE_MPS_FALLBACK=1` to avoid an error. You may not need to do this.

```console
PYTORCH_ENABLE_MPS_FALLBACK=1 jupyter notebook
```