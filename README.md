# PRS-CSx Phenotype Simulation and Workshop Tutorial

This repository contains the code used for generating simulated phenotypes and the tutorial materials for running and evaluating PRS-CSx in Jupyter Notebooks.

## Phenotype Simulation
The simulation is based on the equation:

  $$ y = a X \cdot W_{eas} + b X \cdot W_{eur} + &#949;$$

where
- y is the phenotype matrix that contains the simulated phenotype for each individual.
- X is the genotype matrix where the rows represent the individuals, the column represent variants, and each entry is the allele count for that individual at that variant.
- $W_{eas}$ and $W_{eur}$ are the weight matrices for the East Asian and the European genotype matrices respectively, where each entry is the effect size of each variant based on the PRS-CSx output.
- a is the weight parameter for the East Asian genotype matrix and is set as 0.9.
- b is the weight parameter for the European genotype matrix and set as 0.1.
- &#949; is the non-genetic component that contributes to complex diseases.

### Juputer Notebooks
1. **`phenotype_simulation.ipynb`**: The Jupyter Notebook for simulating phenotypes.
2. **`PRSCSx_workshop_lecture_part1.ipynb`**: The Jupyter Notebook tutoiral for running PRS-CSx.
3. **`PRSCSx_workshop_lecture_part2.ipynb`**: The Jupyter Notebook tutoiral for evaluating PRS-CSx.

### Supplemental Files
5. **`genotype_phenotype_1kgEAS.txt`**: The txt file with genotype (from 1kg) and phenotype (EAS population) info. This file is generated from phenotype simulation and used for the workshop. It is prepared such that it contains 504 rows (individuals) and 902 columns (variants + effect sizes). The entries for the first 901 columns are the allele counts for each variant, and the entries of the last column are the simulated phenotype values for each individual.
6. **`overlap_risk_variants.txt`**: The txt file that includes overlapping risk variants between the test data of EUR and EAS populations.
7. **`extracted_genotypes_overlap_var_only_eas.raw`**: The genotype matrix.
8. **`W_eur.txt`**: The weight matrix for EUR population.
9. **`W_eas.txt`**: The weight matrix for EAS population.
