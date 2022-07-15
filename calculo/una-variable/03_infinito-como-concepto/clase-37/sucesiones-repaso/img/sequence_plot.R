##################################
# Gráficos de Sucesión.
#################################

# options(help_type = "text")
library(ggplot2)

# Sucesión a graficar:
# a_{n} = \frac{n - 1}{n}

n <- 1:17   # Defino 17 términos para la sucesión.

some_data <- data.frame(
  n,
  x = rep(0, length(n)),
  a_n = (n - 1)/n
)

# Gráficos.
xy_plane_plot <- ggplot(data = some_data) +
  geom_point(aes(x = n, y = a_n), color = "#2b68d8", size = 2) +
  expand_limits(y = c(0, 1.5)) +
  scale_x_continuous(breaks = 1:max(n)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(y = expression(a[n]))

ggsave(file = "xy-plane-plot.jpg", plot = xy_plane_plot,
       height = 3.5, width = 7)


rect_line_plot <- ggplot(data = some_data) +
  geom_segment(aes(x = -0.5, xend = 1.05, y = 0, yend = 0),
               arrow = arrow(length = unit(0.3, "cm"))) +
  geom_point(aes(x = a_n, y = x), color = "#2b68d8", size = 2) +
  coord_cartesian(xlim = c(0, 1.05), ylim = c(-0.02, 0.02)) +
  theme_light() +
  theme(panel.grid = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()) +
  labs(x = expression(a[n]), y = NULL)

ggsave(file = "rect-line-plot.jpg", plot = rect_line_plot,
       height = 3.5, width = 7)


