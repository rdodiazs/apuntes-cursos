# Gráfico de las elipses.
library(ggplot2)
source("ellipse_data.R")

ellipse_values <- ellipse_data(
                    a = 5, b = -2, c = 8, k = 36,
                    evalues = c(4, 9),
                    evector_1 = c(2/sqrt(5), 1/sqrt(5)),
                    evector_2 = c(-1/sqrt(5), 2/sqrt(5))
                  )

polar_df <- ellipse_values$polar_df
axes_df <- ellipse_values$axes_df

# Gráfico de la elipse
ellipse_graph <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_path(data = polar_df, aes(x = x_theta, y = y_theta)) +
  expand_limits(x = c(-4, 4), y = c(-3, 3)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = "x", y = "y")

ggsave(file = "ellipse-graph.jpg", plot = ellipse_graph,
       width = 6, height = 4)

# Gráfico de la elipse con sus ejes principales.
ellipse_axes_graph <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_path(data = polar_df, aes(x = x_theta, y = y_theta)) +
  geom_segment(data = axes_df,
               aes(x = c(0, 0), xend = c(a_axis[1], b_axis[1]),
                   y = c(0, 0), yend = c(a_axis[2], b_axis[2])),
               color = "#f40e0e", size = 1
              ) +
  geom_segment(data = axes_df,
               aes(x = c(0, 0), xend = c(eigenvec_1[1], eigenvec_2[1]),
                   y = c(0, 0), yend = c(eigenvec_1[2], eigenvec_2[2])),
               color = "#0e6af4", size = 1, arrow = arrow(length = unit(0.4, "cm"))
              ) +
  expand_limits(x = c(-4, 4), y = c(-3, 3)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = "x", y = "y")

ggsave(file = "ellipse-axes-graph.jpg", plot = ellipse_axes_graph,
       width = 6, height = 4)


# Gráfico elipse canónica.
source("ellipse_canonical_function.R")

canonical_df <- canonical_ellipse_data(a = 3, b = 2)

ellipse_canonical <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgray") +
  geom_hline(yintercept = 0, color = "lightgray") +
  geom_vline(aes(xintercept = c(-3, 3)), linetype = "dashed", color = "lightgrey") +
  geom_hline(aes(yintercept = c(-2, 2)), linetype = "dashed", color = "lightgrey") +
  geom_path(data = canonical_df, aes(x = x_theta, y = y_theta)) +
  expand_limits(x = c(-4, 4), y = c(-3, 3)) +
  geom_segment(aes(x = c(-3, 0), xend = c(3, 0), y = c(0, -2), yend = c(0, 2)),
               color = "#f40e0e", size = 1) +
  scale_x_continuous(breaks = -4:4, label = -4:4) +
  scale_y_continuous(breaks = -3:3, label = -3:3) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = expression(y[1]), y = expression(y[2]))

ggsave(file = "ellipse-canonical.jpg", plot = ellipse_canonical,
       width = 6, height = 4)


