#last ned pakker
library(dplyr)
library(ggplot2)
library(tidyr)


# Read command-line arguments
args <- commandArgs(trailingOnly = TRUE)


species_a <- args[1] # The first argument is the name of the first species

# EXERCISE: Store the second arguments as species_b.

species_b <- args[2]

# EXERCISE: Convert the third argument to an integer and store it as image_size.

image_size <- as.integer(args[3])

# EXERCISE: Put species_a and species_b into one vector called selected_species.
#
selected_species <- c(species_a, species_b)

iris_data <- datasets::iris

species_colours <- c(
  setosa = "tomato",
  versicolor = "steelblue",
  virginica = "gold"
)

# Keep only data from the selected species
selected_iris <- iris_data %>%
  filter(Species %in% selected_species)

# EXERCISE: Create an output filename using species_a and species_b.
output_file <- paste0( "iris_", species_a,"_vs_", species_b, ".png")


# Open plot
petal_plot <- ggplot(
  data = selected_iris,
  mapping = aes(
    x = Petal.Width,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  labs(
    title = paste(species_a, "and", species_b),
    x = "Petal width",
    y = "Petal length",
    colour = "Species"
  )
ggsave(
  filename = output_file,
  plot = petal_plot,
  width = image_size,
  height = image_size,
  units = "px",
  dpi = 300
)
