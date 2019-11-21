# babette_example_2

Branch   |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)                                                                                           |[![AppVeyor logo](pics/AppVeyor.png)](https://appveyor.com)                                                                                               
---------|--------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |[![Build Status](https://travis-ci.org/richelbilderbeek/babette_example_2.svg?branch=master)](https://travis-ci.org/richelbilderbeek/babette_example_2) |[![Build status](https://ci.appveyor.com/api/projects/status/wb2ou15cq5y5oltd/branch/master?svg=true)](https://ci.appveyor.com/project/richelbilderbeek/babette-example-2/branch/master)
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/babette_example_2.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/babette_example_2)|[![Build status](https://ci.appveyor.com/api/projects/status/wb2ou15cq5y5oltd/branch/develop?svg=true)](https://ci.appveyor.com/project/richelbilderbeek/babette-example-2/branch/develop)

A [babette example](https://github.com/richelbilderbeek/babette_examples).

## Example #2: fixed crown age

The way to do so, is to date the node of the most recent common ancestor
of all taxa:

![Example #2: using a MRCA to specify a crown age](pics/mrca_crown_age.png)

```{r}
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
```

Here we use an MRCA prior with fixed (non-estimated) values of the mean
and standard deviation for the common ancestor node's time.

## Result

![](result.png)
