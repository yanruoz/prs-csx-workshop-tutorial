# prs-csx-workshop-tutorial

# This repo contains tutorials for running and evaluating PRS-CSx in Jutpyte Notebooks. 
# The workshop tutorial is designed for running on the Snellius server. However, one could skip the server connection part and change directories to files to run on local environments. 
# Reference panels and SNP information could be found in the PRS-CSx repository.

# PRS-CSx_workshop_lecture.ipynb -- The lecture version of Jupyter Notebook workshop tutorial.
# PRS-CSx_workshop_workshop.ipynb -- The workshop version of Jupyter Notebook workshop tutorial with code blocks removed to encourage typing along.
# genotype_phenotype_1kgEAS.txt -- A txt file that contains the genotype and phenotype information for each individual. This txt file is prepared such that it is 504 rows (individuals) x 902 columns (variants + effect sizes). The entries for the first 901 columns are the allele count for each variant, and the entries of the last column are the simulated phenotype values for each individual.
# jupyterhub_setup.txt -- A txt file with step-to-step guide to link JupyterHub with the Snellius server. Only useful for Snellius users.
