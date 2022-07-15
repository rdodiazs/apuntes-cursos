##########################################
# Gráfico ejemplo sobre regla de L'Hôpital
#              en sucesiones.
#########################################

# options(help_type = "text")

# Paquete a usar. ----------------
library(ggplot2)


# Gráfico. ----------------------
n <- 2:30
a_n <- ((n + 1)/(n - 1))^(n)
seq_df <- data.frame(n, a_n)

limit_lhopital_plot <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = exp(2), linetype = "dashed") +
  geom_point(data = seq_df, aes(x = n, y = a_n),
             color = "#2b68d8", size = 2) +
  annotate(geom = "text", x = 1.5, y = exp(2) - 0.5,
           label = "y = exp(2)", size = 4.5) +
  expand_limits(x = 0, y = c(0, 10)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(y = expression(a[n]))

ggsave(file = "limit-lhopital-example.jpg", plot = limit_lhopital_plot,
       height = 4, width = 7)


