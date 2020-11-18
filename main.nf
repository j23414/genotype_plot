#! /usr/bin/env nextflow

nextflow.enable.dsl=2

// Parameters
params.vcf = false
params.pop = false

// Processes
process prep_vcf {
  input:
  path(vcf)

  output:
  tuple path("${vcf}.gz"), path("${vcf}.gz.tbi")

  script:
  """
  #! /usr/bin/env bash
  bgzip -c ${vcf} > ${vcf}.gz
  tabix -p vcf ${vcf}.gz
  """
}

process genotype_plot {
  input:
  tuple path(vcf_gz), path(vcf_index), path(pop_file)

  output:
  path("plot.png")

  script:
  """
  #! /usr/bin/env Rscript
  source('genotype_plot.R')  # in bin folder or copy here

  our_popmap = readr::read_delim('$pop_file', delim='\t')

  new_plot <- genotype_plot(vcf=\"${vcf_gz}\",
                          chr="chr1",
                          start=1e6,
                          end=2e6,
                          popmap=our_popmap,
                          cluster=FALSE,
                          snp_label_size=1e5,
                          colour_scheme=c("#d4b9da","#e7298a","#980043"))
  # check structure
  str(new_plot)

  # Add plotting functions here (cowplot, ggdendro)
  # p <- new_plot\$dendrogram .... rest of commands here

  ggplot2::ggsave("plot.png", plot = p)
  """
}

// Main
workflow {
  pop_ch = channel.fromPath(params.pop)              // tsv
  vcf_ch = channel.fromPath(params.vcf) | prep_vcf   // gz and index

  vcf_ch |
    combine(pop_ch) |
    genotype_plot |
    view
}
