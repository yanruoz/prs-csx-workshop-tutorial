# PRS-CSx Phenotype Simulation and Workshop Tutorial

This repository contains the code used for generating simulated phenotypes and the tutorial materials for running and evaluating PRS-CSx in Jupyter Notebooks.

## Phenotype Simulation

### Files Needed
1. **`phenotype_simulation.ipynb`**: The Jupyter Notebook for simulating phenotypes used in the workshop from scratch.
2. **`integrated_call_samples_v3.20130502.ALL.panel`**: The 1kg genotype data. *This file is needed for phenotype simulation.*
3. **`chr22_phase3_b_no_dup.zip`**: The zipped bfiles that contain genotype information for chr22. *This file is needed for phenotype simulation.*

### Simulation Details

The simulation is based on the following equation:

\[ y = a X \cdot W_{\text{eas}} + b X \cdot W_{\text{eur}} \]

where:
- \( y \) is the phenotype matrix containing the simulated phenotype for each individual.
- \( X \) is the genotype matrix where rows represent individuals, columns represent variants, and each entry is the allele count for that individual at that variant.
- \( W_{\text{eas}} \) and \( W_{\text{eur}} \) are the weight matrices for the East Asian and the European genotype matrices respectively, where each entry is the effect size of each variant based on the PRS-CSx output.
- \( a \) is the weight parameter for the East Asian genotype matrix, set to 0.9.
- \( b \) is the weight parameter for the European genotype matrix, set to 0.1.

## PRS-CSx Workshop

### Files Needed
1. **`PRSCSx_workshop_lecture.ipynb`**: The Jupyter Notebook for conducting a workshop on running and evaluating PRS-CSx.
2. **`genotype_phenotype_1kgEAS.txt`**: The txt file with genotype (from 1kg) and phenotype (EAS population) info. This file is generated from phenotype simulation and used for the workshop. It is prepared such that it contains 504 rows (individuals) and 902 columns (variants + effect sizes). The entries for the first 901 columns are the allele counts for each variant, and the entries of the last column are the simulated phenotype values for each individual.
