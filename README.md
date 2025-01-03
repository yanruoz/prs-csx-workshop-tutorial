# PRS-CSx Phenotype Simulation and Workshop Tutorial

This repository contains the code used for generating simulated phenotypes and the tutorial materials for running, using, and evaluating PRS-CSx in Jupyter Notebooks.
Please download all files in this repository to a single folder (You can navigate to the main page of the repository. Above the list of files, click Code. Click Download ZIP.) for the code to run smoothly.

## Phenotype Simulation (`phenotype_simulation`)
This folder includes the script, the input files, and the output files of running phenotype simulation.
#### `scripts`:
1. phenotype_simulation.ipynb: the Jupyter Notebook for simulating phenotypes
   
#### `inputs`:
1. genotopye vector ($X$): genotype_vector
3. coefficient vector for EAS population ($W_{eas}$): W_eas
4. coefficient vector for EUR population ($W_{eur}$ ): W_eur

#### `outputs`:
1. simulated phenotype vector ($y''$): simulated_phenotype_vector
2. the validation dataset for genotypes: genotype_vali
3. the test dataset for genotypes: genotype_test
4. the validation dataset for phenotypes: phenotype_vali
5. the test dataset for phenotypes: phenotype_test

## Running, Using, and Evaluating PRS-CSx (`run_use_evaluate_prscsx`)
The three folders in the `run_use_evaluate_prscsx` folder inlcude the tutorials for running, using, and evaluating PRS-CSx respectively. Each part can be run on its own.
### Part 1. Running PRS-CSx for variants' weights (`run`)
#### `scripts`:
1. run_prscsx.ipynb: the Jupyter Notebook tutorial for running PRS-CSx to obtain variants' weights
2. run_prscsx.sh: the bash script for running PRS-CSx (whose execution is embedded in run_prscsx.ipynb)

#### `inputs`:
1. reference panel for EAS population: ldblk_1kg_eas.tar.gz (from dropbox)
2. reference panel for EUR population: ldblk_1kg_eur.tar.gz (from dropbox)
3. SNP information: snpinfo_mult_1kg_hm3 (from dropbox)
4. EAS population summary statistics for schizophrenia: EAS_sumstats.txt (from test data in PRS-CSx Github folder)
5. EUR population summary statistics for schizophrenia: EUR_sumstats.txt (from test data in PRS-CSx Github folder)

#### `outputs`
1. EAS PRS (contains population-specific posterior SNP effect size estimates for each individual): test_EAS_pst_eff_a1_b0.5_phi1e-02_chr22.txt
2. EUR PRS (contains population-specific posterior SNP effect size estimates for each individual): test_EUR_pst_eff_a1_b0.5_phi1e-02_chr22.txt

### Part 2. Using the variants' weights to estimate individual risks (`use`)
#### `scripts`
1. use_prscsx.ipynb: the Jupyter Notebook tutorial for using the variants' weights to estimate individual risks

#### `inputs`:
1. EAS PRS (contains population-specific posterior SNP effect size estimates for each individual): test_EAS_pst_eff_a1_b0.5_phi1e-02_chr22.txt
2. EUR PRS (contains population-specific posterior SNP effect size estimates for each individual): test_EUR_pst_eff_a1_b0.5_phi1e-02_chr22.txt
3. the validation dataset for genotypes: genotype_vali
4. the test dataset for genotypes: genotype_test
5. the validation dataset for phenotypes: phenotype_vali
6. the test dataset for phenotypes: phenotype_test

#### `outputs`:
1. the coefficient vector for EAS population ($W_{eas}$): W_eas
2. the coefficient vector for EUR population ($W_{eur}$ ): W_eur
3. the weight parameter for the EAS population: a_hat (displayed in Notebook only)
4. the weight parameter for the EUR population: a_hat (displayed in Notebook only)
5. the predicted phenotypes of the validation dataset: y_hat_vali
6. (intermediate output) the cut test_EAS_pst_eff_a1_b0.5_phi1e-02_chr22.txt with only the "rsid" and "effect size" column for the EAS population: EAS_prscsx_output_cut
7. (intermediate output) the cut test_EUR_pst_eff_a1_b0.5_phi1e-02_chr22.txt with only the "rsid" and "effect size" column for the EUR population: EUR_prscsx_output_cut
8. (intermediate output) the txt file that includes overlapping risk variants between the test data of EUR and EAS populations: overlap_risk_variants.txt

### Part 3. Evalutating the estimates for individual risks (`evaluate`)
#### `scripts`
1. use_prscsx.ipynb: the Jupyter Notebook tutorial for evalutating the estimates for individual risks

#### `inputs`
1. the validation dataset for genotypes: genotype_vali
2. the test dataset for genotypes: genotype_test
3. the validation dataset for phenotypes: phenotype_vali
4. the test dataset for phenotypes: phenotype_test
5. the predicted phenotypes of the validation dataset: y_hat_vali

#### `outputs`
1. the plot of true values against predicted values for validation and test data: true_against_pred.png
2. the deviance based on the y_hat for the test data (total squared difference between the true output values and the predicted output values): deviance (displayed in Notebook only)
3. the null deviance (total squared difference between the true output values and their mean): deviance_null (displayed in Notebook only)
4. the deviance-based: R_squared (displayed in Notebook only)
