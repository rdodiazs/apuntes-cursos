# options(help_type = "text")

library(ggplot2)
library(patchwork)

int_test_fun <- function(side = "l") {
  # Vectores n_1, n_2 y a_n para data.frame de sucesiones.
  for(i in 1:2) {
    assign(x = paste0("n_", i), value = 1:5)
  }
  a_n <- 1/(n_1^2)
  
  # Función: curva
  x_1 <- seq(from = min(n_1) - 0.2, to = max(n_1) + 2, length.out = 200)
  f_x_1 <- 1/(x_1^2)
  fun_df <- data.frame(x = x_1, f_x = f_x_1)

  # Función: área
  x_2 <- seq(from = min(n_1), to = max(n_1) + 1, length.out = 200) 
  f_x_2 <- 1/(x_2^2)
  area_df <- data.frame(x = x_2, f_x = f_x_2)

  # Texto para eje horizontal y puntos.
  text <- c(as.character(n_1[1:3]), NA, "n - 1")
  
  if(side == "r") {
    n_2 <- n_2 + 1
    a_n <- a_n[-1]
    a_n[length(n_1)] <- 1/(max(n_1)+1)^2 
    text <- text[-1]
    text[5] <- "n"
  }

  # Data frames: Sucesión.
  seq_df_1 <- data.frame(n = n_1 + 0.5, a_n) # barras.
  seq_df_2 <- data.frame(n = n_2, a_n)       # puntos.
  seq_df_2[seq_df_2$n == 4, ] <- NA

  # Gráfico
  ggplot() +
    geom_vline(xintercept = 0, color = "lightgrey") +
    geom_hline(yintercept = 0, color = "lightgrey") +
    geom_col(data = seq_df_1, aes(x = n, y = a_n),
             width = 1, fill = "#b0e9fc", color = "#2f3138") +
    geom_path(data = fun_df, aes(x = x, y = f_x)) +
    geom_area(data = area_df, aes(x = x, y = f_x),
              fill = "#fc2385", alpha = 0.4) +
    geom_point(data = seq_df_2, aes(x = n, y = a_n), na.rm = TRUE) +
    geom_text(data = seq_df_2,
              aes(x = n, y = a_n,
                  label = paste0("f(", text, ") == ", "a[", text, "]")),
              parse = TRUE, na.rm = TRUE, vjust = -0.2, hjust = -0.01) +
    annotate(geom = "text", x = c(0.6, 6.5), y = rep(1.2, 2),
             label = c("y = f(x)", ifelse(side == "l", "(I)", "(II)")),
             size = c(4, 5)) +
    scale_x_continuous(breaks = 0:6,
                       labels = c(as.character(0:3), "...",
                                  "n - 1", "n")) +
    coord_cartesian(xlim = c(0, max(n_1)+1.5), y = c(0, 1.25)) +
    theme_light() +
    theme(panel.grid = element_blank()) +
    labs(x = "x", y = "y")
}

#Gráficos finales.
int_test_plot <- int_test_fun() / int_test_fun("r")

ggsave(file = "int-test-plot.jpg", plot = int_test_plot,
       width = 8, height = 5)

