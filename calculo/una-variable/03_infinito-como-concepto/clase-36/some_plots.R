#========================================
#
# Gráficos usados en la Clase 36.
#
#========================================

# Cargando librerías. ----------------------------------
library(tibble)
library(ggplot2)


# Gráficos ---------------------------------------------

# 1. Gráfico de función e^{-kx} para k = 2 (debe ser mayor a cero) y del
# área bajo su curva.

exp_neg_df <- function(start = -1, end = 3) {
  tibble(x = seq(from = start, to = end, length.out = 200),
         y = exp(-2*x))
}

exp_neg_plot <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_area(data = exp_neg_df(0, 4), aes(x = x, y = y),
            fill = "#192fd3") +
  geom_path(data = exp_neg_df(-0.5, 4), aes(x = x, y = y)) +
  annotate(geom = "text", x = 0.5, y = 1.25,
           label = "f(x) == exp(-kx)", parse = TRUE, size = 4.5) +
  geom_segment(aes(x = 0.3, xend = 1, y = 0.3, yend = 0.55),
               arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  annotate(geom = "text", x = 1.5, y = 0.6,
           label = "integral(exp(-k*x)*dx, 0, infinity) == over(1, k)",
           parse = TRUE, size = 4.5) +
  coord_cartesian(xlim = c(-0.3, 3.5), ylim = c(0, 2)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = NULL, y = NULL)

ggsave(filename = "example-01.jpg", plot = exp_neg_plot, path = "img",
       width = 7, height = 3.5)


# 2. Gráfico de curva y área bajo ella de `e^(x^2)`.
bell_fun <- function(start, end) {
  tibble(
    x = seq(from = start, to = end, length.out = 200),
    y = exp((-(x^2)))
  )
}

bell_tail_plot <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_area(data = bell_fun(1.5, 2.5), aes(x = x, y = y),
            fill = "#192fd3") +
  geom_path(data = bell_fun(-7, 7), aes(x = x, y = y)) +
  geom_segment(aes(x = 1.6, xend = 1.65, y = 0.03, yend = 0.2),
               arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  annotate(geom = "text", x = 1.65, y = 0.25, label = "Cola", size = 4.5) +
  annotate(geom = "text", x = 0.7, y = 1, label = "f(x) == exp(-x^2)",
           parse = TRUE, size = 4.5) +
  coord_cartesian(xlim = c(-2, 2), ylim = c(0, 1.5)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = NULL, y = NULL)

ggsave(filename = "bell-curve-tail.jpg", plot = bell_tail_plot,
       path = "img", width = 7, height = 3.5)



# 3. Gráfico de curva y área bajo ella de `1/sqrt(x - 2)`.
exmp_5_df <- function(start, end) {
  tibble(
    x = seq(from = start, to = end, length.out = 200),
    y = 1/sqrt(x-2)
  )
}

exmp_5_plot <- ggplot() +
  geom_vline(xintercept = 0, color = "lightgrey") +
  geom_hline(yintercept = 0, color = "lightgrey") +
  geom_area(data = exmp_5_df(2, 5), aes(x = x, y = y), fill = "#192fd3") +
  geom_path(data = exmp_5_df(2, 10), aes(x = x, y = y)) +
  annotate(geom = "text", x = 3.2, y = 2.5,
           label = "f(x) == over(1, sqrt(x - 2))", parse = TRUE,
           size = 4.5) +
  geom_segment(aes(x = 3, xend = 4, y = 0.5, yend = 1.2),
               arrow = arrow(length = unit(0.2, "cm"), type = "closed")) +
  annotate(geom = "text", x = 5.2, y = 1.5,
           label = "integral(over(1, sqrt(x - 2))*dx, 2, 5) == 2*sqrt(3)",
           parse = TRUE, size = 4.5) +
  coord_cartesian(xlim = c(0, 9), ylim = c(0, 4)) +
  scale_x_continuous(breaks = c(0, 2, 5, 7)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = NULL, y = NULL)

ggsave(filename = "example-05.jpg", plot = exmp_5_plot, path = "img",
       width = 7, height = 3.5)


