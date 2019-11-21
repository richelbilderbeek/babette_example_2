# babette example 1: default settings

library(babette)

# Create a FASTA file
fasta_filename <- "primates.fas"
save_nexus_as_fasta(
  nexus_filename = beastier::get_beast2_example_filename("Primates.nex"),
  fasta_filename = fasta_filename
)

inference_results <- bbt_run(
  fasta_filename = fasta_filename
  mrca_prior = create_mrca_prior(
    taxa_names = get_taxa_names(fasta_filename),
    alignment_id = get_alignment_id(fasta_filename),
    is_monophyletic = TRUE,
    mrca_distr = create_normal_distr(
      mean = 15.0,
      sigma = 0.025
    )
  )
)

png("result.png", width = 600, height = 600)
plot_densitree(inference_results$primates_trees, alpha = 1.0)
dev.off()
