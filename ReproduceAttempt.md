ReproduceAttempt
================
Jennifer Chang
11/17/2020

## Run

Load the function, install dependencies that are not already on my
computer.

``` r
source("R/genotype_plot.R")

# Install Dependencies
# pkg_list = c("ggdendro","vcfR","ggplot2","tidyr","data.table")
# install.packages(pkg_list)
```

Input files and run function

``` r
# Inputs
#VCF_FILE = "~/Desktop/2020-10-15/gatk_atlas/first-round_merged_snps-only_snp-only.pass-only.vcf"
VCF_FILE = "input.vcf.gz"

our_popmap = readr::read_delim("popmap.txt", delim="\t")
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   ind = col_character(),
#>   pop = col_character()
#> )

# Run function
# Actual function run
#new_plot <- genotype_plot(vcf = VCF_FILE,
#                          chr = "chr1",
#                          start = 0, #1e6,
#                          end = 1e6,  #2e6
#                          popmap = our_popmap,
#                          cluster = FALSE,
#                          snp_label_size=1e5,
#                          colour_scheme = c("#d4b9da","#e7298a","#980043"))
```

Getting output


       *****       ***   vcfR   ***       *****
       This is vcfR 1.12.0 
         browseVignettes('vcfR') # Documentation
         citation('vcfR') # Citation
       *****       *****      *****       *****

    Registered S3 method overwritten by 'data.table':
      method           from
      print.data.table     
    data.table 1.13.2 using 1 threads (see ?getDTthreads).  Latest news: r-datatable.com
    **********
    This installation of data.table has not detected OpenMP support. It should still work but in single-threaded mode.
    This is a Mac. Please read https://mac.r-project.org/openmp/. Please engage with Apple and ask them for support. Check r-datatable.com for updates, and our Mac instructions here: https://github.com/Rdatatable/data.table/wiki/Installation. After several years of many reports of installation problems on Mac, it's time to gingerly point out that there have been no similar problems on Windows or Linux.
    **********
    The `i` argument of ``[`()` can't be a matrix as of tibble 3.0.0.
    Convert to a vector.
    This warning is displayed once every 8 hours.
    Call `lifecycle::last_warnings()` to see where this warning was generated.Scanning file to determine attributes.
    File attributes:
      meta lines: 31
      header_line: 32
      variant count: 70300
      column count: 36
    Meta line 31 read in.
    All meta lines processed.
    gt matrix initialized.
    Character matrix gt created.
      Character matrix gt rows: 70300
      Character matrix gt cols: 36
      skip: 0
      nrows: 70300
      row_num: 0
    Processed variant: 70300
    All variants processed
    Error in x@gt[i, j, drop = FALSE] : invalid subscript type 'list'

Some kind of error, maybe some auto conversion of a data type.

List of generated files

    # Input
    -rw-r--r--  1 jenchang  staff   9.4M Nov 17 20:00 input.vcf.gz
    -rw-r--r--  1 jenchang  staff   822B Nov 17 20:11 input.vcf.gz.tbi
    -rw-r--r--  1 jenchang  staff   431B Nov 17 20:22 popmap.txt
    -rw-r--r--@ 1 jenchang  staff   2.7K Nov 17 20:31 ReproduceAttempt.Rmd # <= script

    # Output
    -rw-r--r--  1 jenchang  staff    49M Nov 17 20:26 gt_plot_tmp.vcf      # <= intermediate
    -rw-r--r--  1 jenchang  staff   2.9K Nov 17 20:31 ReproduceAttempt.md
