######################################################
#
# Gráfica de una sucesión acotada pero no convergente.
#
######################################################

# options(help_type = "text")

# Librerías. ----------------------------------------
library(ggplot2)


# Gráfico. ------------------------------------------

# Fórmula de la sucesión a graficar.
# \{a_{n}\} = (-1)^{n}

# Código del gráfico de la sucesión.
n <- 1:15
a_n <- (-1)^n
seq_df <- data.frame(n, a_n)

bounded_not_convergent_plot <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = c(-1, 1), linetype = "dashed") +
  geom_point(data = seq_df, aes(x = n, y = a_n),
             color = "#2b68d8", size = 2) +
  expand_limits(x = 0, y = c(-2, 2)) +
  scale_x_continuous(breaks = c(0,n)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(y = expression(a[n]))

ggsave(file = "bounded-not-convergent-plot.jpg",
       plot = bounded_not_convergent_plot, height = 4, width = 7)








