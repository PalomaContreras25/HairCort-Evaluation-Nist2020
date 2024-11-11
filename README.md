# test-3

A [workflowr][] project.

[workflowr]: https://github.com/workflowr/workflowr

 Test#3 was an ELISA assay to quantify cortisol concentrations on human hair. 
 The output from the plate reader, as well as all the information to interpret it, are stored in this repository. 
 We used the original output from Myassays as it provides a better fitting curve than one calculated manually.


 All samples in this essay were obtained from the same person, and were extracted using the same protocol. 
 The parameters that we want to optimize vary for different samples:  
- The buffer volume for the reconstitution
- The weight of each sample
- Addition (or not) of a spike using same dilution as for STD 1.


Visualizations were conducted using dataset obtained from Myassays.com, i.e. before calculating final values including weight, buffer vol, and spike. 
This was because I wanted to look at the general performance of the assay, as well as visualizing the influence of different parameters of interest before controlling for them.

 
 
 # Hair Cortisol ELISA Analysis

## Overview
This repository contains a detailed record of the analysis pipeline for measuring hair cortisol using ELISA (Enzyme-Linked Immunosorbent Assay). The files within serve as documentation of the computational steps, model applications, and visualizations used to derive cortisol concentrations from hair samples, specifically for projects focusing on physiological stress measurements.

## Repository Structure
- **about.Rmd**: Background information on the ELISA protocol, including objectives, sample preparation, and initial setup.
- **ELISA_computation.Rmd**: QC and Step-by-step calculations for cortisol concentrations, including data processing and any specific transformations.
- **ELISA_models.Rmd**: Detailed overview of statistical models applied in the analysis, with explanations of parameter selection and model diagnostics.
- **ELISA_visualizations.Rmd**: Visualizations of the cortisol concentration data and other related plots, providing insights into the results.

## Usage
To reproduce these analyses, ensure you have the necessary R packages installed. Each Rmarkdown file is structured as a standalone module, and can be run independently:

```r
# Required Packages
install.packages(c("tidyverse", "ggplot2", "dplyr", "broom", "ggpubr"))

