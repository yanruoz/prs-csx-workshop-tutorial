# PRS-CSx Phenotype Simlation and Workshop Tutorial

This repo contains the code used for generating simulated phenotypes and the tutorial materials for running and evaluating PRS-CSx in Jutpyte Notebooks. 

The workshop tutorial was designed for running on the Snellius server. However, one could skip the server connection part and change directories to files to run on local environments. 

## Workflow
1. Follow the instructions on PRS-CSx repository (https://github.com/getian107/PRScsx#getting-started) to run PRS-CSx.

2. (Optional) Simulate phenotype by opening phen_simu_nonstd.ipynb and following the instructions. 
- The simulation is based on the equation:

  $$ y = a X \cdot W_{eas} + b X \cdot W_{eur} $$

where
- y is the phenotype matrix that contains the simulated phenotype for each individual.
- X is the genotype matrix where the rows represent the individuals, the column represent variants, and each entry is the allele count for that individual at that variant.
- $W_{eas}$ and $W_{eur}$ are the weight matrices for the East Asian and the European genotype matrices respectively, where each entry is the effect size of each variant based on the PRS-CSx output.
- a is the weight parameter for the East Asian genotype matrix and is set as 0.9.
- b is the weight parameter for the European genotype matrix and set as 0.1.

3. (Optional) Set up the Connection between Snellius server and JupyterHub by following the instructions on jupyterhub_setup.txt.

4. Go through the tutorial by following the instructions on PRS-CSx_workshop_lecture.ipynb. Make sure that the genotype_phenotype_1kgEAS.txt file that contains the genotype and phenotype information for each individual is in the same directory as the Notebook.
- This genotype_phenotype_1kgEAS.txt file is prepared such that it is 504 rows (individuals) x 902 columns (variants + effect sizes). The entries for the first 901 columns are the allele count for each variant, and the entries of the last column are the simulated phenotype values for each individual.

5. (Optional) Type along using PRS-CSx_workshop_workshop.ipynb, where some code blocks are removed.
