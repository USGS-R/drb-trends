library(targets)

# source scripts that hold your functions
source('src/site_selection_code.R')
source('src/map_code.R')

# Set target-specific options such as packages.
tar_option_set(packages = c('sf', 'tidyverse'))

# End this file with a list of target objects.
list(
  # example of how you could read in all temperature data
  # and summarize annual data availability by river reach (seg_id_nat)
  tar_target(annual_summary, 
             evaluate_annual('in/obs_temp_drb.rds')),
  
  # example of how you could select some sites and map them using
  # all river segments from our modeling framework
  tar_target(site_map_png,
             map_sites(annual_summary, 'in/network.rds'), format = 'file')
)
