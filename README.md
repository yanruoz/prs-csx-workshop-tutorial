# PRS-CSx Phenotype Simulation and Workshop Tutorial

This repository contains the code used for generating simulated phenotypes and the tutorial materials for running, using, and evaluating PRS-CSx in Jupyter Notebooks.
Please download all files in this repository to a single folder (You can navigate to the main page of the repository. Above the list of files, click Code. Click Download ZIP.) for the code to run smoothly.

## Scripts
1. **`phenotype_simulation.ipynb`**: The Jupyter Notebook for simulating phenotypes.
2. **`run_use_evaluate_prscsx.ipynb`**: The Jupyter Notebook tutoiral for running, using, and evaluating PRS-CSx.
3. **`run_prscsx.sh`**: The bash script to run PRS-CSx.

## Inputs
1. **`genotype_matrix`**: The file that contains the genotype information for EAS population.
2. **`W_eas`**: The weight matrix for EAS population.
3. **`W_eur`**: The weight matrix for EUR population.

## Outputs
1. **`simulated_phenotype_matrix`**: The file that contains the simulated phenotypes (effect sizes) for all EAS individuals.
2. **`genotype_phenotype_matrix`**: The txt file with genotype (from 1kg) and phenotype (EAS population) info. This file is generated from phenotype simulation and used for the workshop. It is prepared such that it contains 504 rows (individuals) and 902 columns (variants + effect sizes). The entries for the first 901 columns are the allele counts for each variant, and the entries of the last column are the simulated phenotype values for each individual.
3. **`test_EAS_pst_eff_a1_b0.5_phi1e-02_chr22.txt`**: An output of PRS-CSx, which contains population-specific posterior SNP effect size estimates for each individual in the EAS population.
4. **`test_EUR_pst_eff_a1_b0.5_phi1e-02_chr22.txt`**: An output of PRS-CSx, which contains population-specific posterior SNP effect size estimates for each individual in the EUR population.
5. **`EAS_prscsx_output_cut`**: test_EAS_pst_eff_a1_b0.5_phi1e-02_chr22.txt with only the "rsid" and "effect size" column for the EAS population.
6. **`EUR_prscsx_output_cut`**: test_EUR_pst_eff_a1_b0.5_phi1e-02_chr22.txt with only the "rsid" and "effect size" column for the EUR population.
7. **`overlap_risk_variants.txt`**: The txt file that includes overlapping risk variants between the test data of EUR and EAS populations.
8. **`true_against_pred.png`**: The plot that demonstrate the relationship between true and predicted values.
