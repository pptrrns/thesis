#----- R Code

# Mariana Sánchez Mendoza & José Ángel Torrens Hernández

#----- Install required packages

# install.packages('bib2df') install.packages('tidyverse') install.packages('janitor')
# install.packages('devtools') devtools::install_github('r-lib/conflicted')

#----- Load libraries

library(conflicted)
library(tidyverse)
library(bib2df)
library(janitor)

#----- Convert .bib file to DataFrame

df_bib <- bib2df("references.bib", separate_names = TRUE) %>%
  clean_names()

#----- Analyze and visualize references

df_bib %>%
  select(year, author, title, bibtexkey, category) %>%
  tidyr::unnest(author) %>%
  ggplot(aes(
    x = as.factor(year),
    y = reorder(bibtexkey, desc(year)),
    color = category
  )) + 
  geom_point(size = 2) +
  labs(
    x = "Publication Year",
    y = "Reference Key",
    title = "Publication Year and Author of References",
    subtitle = "An Overview of Reference Trends"
  ) +
  theme_bw() + 
  scale_color_manual(values = c("#F5025D", "#438EF7", "#009B77")) + 
  theme(
    text = element_text(family = "Roboto"),
    plot.title = element_text(
      face = "bold",
      hjust = 0.5,
      size = 16,
      color = "#1B2128"
    ),
    plot.subtitle = element_text(
      hjust = 0.5,
      size = 14,
      color = "#747577"
    ),
    plot.caption = element_text(
      face = "plain",
      size = 10,
      color = "#747577"
    ),
    legend.title = element_blank(),
    legend.position = "top",
    legend.text = element_text(
      face = "plain",
      size = 10,
      color = "#747577"
    ),
    legend.spacing = unit(0.5, "cm"),
    legend.key.height = unit(0.5, "cm"),
    legend.key.width = unit(0.7,
                            "cm"),
    axis.text.x = element_text(size = 8, color = "#1B2128"),
    axis.text.y = element_text(size = 8, color = "#1B2128"),
    axis.title.x = element_text(
      face = "bold",
      size = 11,
      color = "#1B2128",
      hjust = 0.5,
      margin = margin(r = 0.5,
                      unit = "cm")
    ),
    axis.title.y = element_text(
      face = "bold",
      size = 11,
      color = "#1B2128",
      hjust = 0.5,
      margin = margin(r = 0.5,
                      unit = "cm")
    ),
    axis.line = element_line(color = "#E0E0DD"),
    plot.margin = margin(1, 1, 1, 1, "cm")
  )