# options(help_type = "text")
library(ggplot2)

# Fórmula de la sucesión:
#   \{a_{n}\} = (-1)^{n + 1} \cdot \frac{1}{n}
# Límite de la sucesión
#   \lim_{n \to \infty} a_{n} = 0

# Data frame.
seq_df_fun <- function(n, epsilon) {
  n <- as.integer(n)
  stopifnot(exprs = {
      "n debe ser un entero positivo" = n > 0L
      "epsilon debe ser mayor a cero" = epsilon > 0L
    }
  )
  n <- 1:n
  a_n <- ((-1)^(n+1))*(1/n)
  lim <- 0
  error <- abs(x = a_n - lim)
  lt_epsilon <- error < epsilon
  
  data.frame(n, a_n, error, lt_epsilon)
}

# Gráfico.
seq_fun_plot <- function(n, epsilon, N)
{
  stopifnot("n debe ser mayor a N" = n > N)

  some_df <- seq_df_fun(n = n, epsilon = epsilon)
  n <- some_df$n
  lim <- 0
  epsilon <- epsilon
  upper_band <- lim + epsilon
  lower_band <- lim - epsilon

  ggplot() +
    geom_rect(aes(xmin = min(n)-3, xmax = max(n)+2,
                  ymin = lower_band, ymax = upper_band),
              fill = "lightgray", alpha = 0.6, color = "gray") +
    geom_hline(yintercept = lim, lty = "dashed") +
    geom_point(data = some_df, aes(x = n, y = a_n), color = "#2b68d8") +
    geom_text(data = some_df[some_df$n == N, ],
              aes(x = n, y = a_n,
                  label = paste0("(", n, ", ", round(a_n, 2), ")")),
              check_overlap = TRUE, nudge_y = -0.1
              ) +
    annotate(geom = "text",
             x = rep(min(n)-0.45, 2), y = c(lower_band/2, upper_band/2),
             label = "epsilon", parse = TRUE, size = 5) +
    annotate(geom = "text",
             x = rep(max(n)-0.5, 2), y = c(lower_band-0.08, upper_band+0.08),
             label = c("L - epsilon", "L + epsilon"), parse = TRUE) +
    expand_limits(y = c(lower_band + 1.5, upper_band - 1.5)) +
    coord_cartesian(xlim = c(0.5, max(n))) +
    list(
      if(max(n) <= 35L) scale_x_continuous(breaks = 0:max(n))
    ) +
    theme_light() +
    theme(panel.grid.minor = element_blank()) +
    labs(y = expression(a[n]),
         title = bquote(expr = "n máx" == .(max(n)) ~ ", "
                               ~ epsilon == .(epsilon) ~ ", "
                               ~ "N" == .(N))
         )
}

# Gráfico 1.
lim_seq_plot_1 <- seq_fun_plot(n = 20, epsilon = 0.4, N = 2)

ggsave(file = "limit-seq-01.jpg", plot = lim_seq_plot_1,
       height = 4, width = 7)

# Gráfico 2.
lim_seq_plot_2 <- seq_fun_plot(n = 20, epsilon = 0.15, N = 2)

ggsave(file = "limit-seq-02.jpg", plot = lim_seq_plot_2,
       height = 4, width = 7)


