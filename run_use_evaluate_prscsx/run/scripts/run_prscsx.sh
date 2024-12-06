#!/bin/bash

## Setting Up PRS-CSx 

# 0. Set the working directory as the parent directory of which the script is located.
echo "Current working directory: $(realpath ./)"

# 1. Clone the PRS-CSx repository using the following git command:
git clone https://github.com/getian107/PRScsx.git

# 2. Create a sub-folder named `ref`. Download the LD reference panels to `ref` and extract files:
# For regions that don't have access to Dropbox, reference panels can be downloaded from the [alternative download site](https://personal.broadinstitute.org/hhuang/public/PRS-CSx/Reference/).
mkdir -p ./inputs/ref
echo "Downloading files..."
EAS_REF_URL="https://www.dropbox.com/s/7ek4lwwf2b7f749/ldblk_1kg_eas.tar.gz?dl=1"
EUR_REF_URL="https://www.dropbox.com/s/mt6var0z96vb6fv/ldblk_1kg_eur.tar.gz?e=1&dl=0"
EAS_REF_DIR="./inputs/ref/ldblk_1kg_eas.tar.gz"
EUR_REF_DIR="./inputs/ref/ldblk_1kg_eur.tar.gz"
curl -L -o "$EAS_REF_DIR" "$EAS_REF_URL"
curl -L -o "$EUR_REF_DIR" "$EUR_REF_URL"
echo "Download completed: 1)EAS ref: $(realpath "$EAS_REF_DIR"), 2) EUR ref: $(realpath "$EUR_REF_DIR")"
echo "Extracting files..."
tar -zxvf "$EAS_REF_DIR" -C "./inputs/ref"
tar -zxvf "$EUR_REF_DIR" -C "./inputs/ref"
echo "Extraction completed."

# 3. Download the SNP information file and put it in the same folder containing the reference panels:
SNP_INFO_URL="https://www.dropbox.com/s/rhi806sstvppzzz/snpinfo_mult_1kg_hm3?dl=0"
SNP_INFO_DIR="./inputs/ref/snpinfo_mult_1kg_hm3"
curl -L -o "$SNP_INFO_DIR" "$SNP_INFO_URL"

# 4. PRScsx requires Python packages `scipy` and `h5py` installed:
# Function to check and install a Python package
check_and_install_package() {
    PACKAGE=$1
    if python -c "import $PACKAGE" &> /dev/null; then
        echo "$PACKAGE is already installed."
    else
        echo "$PACKAGE is not installed. Installing..."
        pip install $PACKAGE
        if [ $? -eq 0 ]; then
            echo "$PACKAGE installed successfully."
        else
            echo "Failed to install $PACKAGE. Please check your Python and pip setup."
            exit 1
        fi
    fi
}

# Ensure pip is available
if ! command -v pip &> /dev/null; then
    echo "pip is not installed. Please install pip and rerun this script."
    exit 1
fi

# Check and install scipy and h5py
check_and_install_package "scipy"
check_and_install_package "h5py"

# 5. Once Python and its dependencies have been installed, running the following will print a list of command-line options:
echo "Printing PRScsx command options..."
./PRScsx/PRScsx.py --help 

## Using PRS-CSx with Test Data
# The test data contains EUR and EAS GWAS summary statistics and a bim file for 1,000 SNPs on chromosome 22.
# 1. Create a directory to store output:
mkdir -p outputs
OUTPUT_FOLDER_DIR=$(realpath "./outputs")
    
# 2. Run PRS-CSx:
echo "Running PRS-CSx on test data..."
python ./PRScsx/PRScsx.py \
    --ref_dir=./inputs/ref \
    --bim_prefix=./PRScsx/test_data/test \
    --sst_file=./PRScsx/test_data/EUR_sumstats.txt,./PRScsx/test_data/EAS_sumstats.txt \
    --n_gwas=200000,100000 \
    --pop=EUR,EAS \
    --chrom=22 \
    --phi=1e-2 \
    --out_dir=./outputs \
    --out_name=test
echo "PRS-CSx finished running: $OUTPUT_FOLDER_DIR"
