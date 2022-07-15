#########################################################
# Ejemplos de transformaciones que no son y son lineales.
#########################################################

# 1. Librería.----
library(ggplot2)
library(patchwork)

# 2. Gráficos.----
# 2.1 Preámbulo.
a <- seq(-3, 3, 0.01)
b <- seq(-5, 5, 0.01)
set.seed(2022)
v1 <- c(sample(x = a, size = length(a)),0) # 1er componente de vector `v`.
v2 <- c(sample(x = b, size = length(a)),0) # 2do componente de vector `v`.

transf_plot <- function(x1, x2, color = color,
                        xaxis = NULL, yaxis = NULL,
                        parse = FALSE, ...) {
  if(parse) {
    if(!is.null(xaxis)) xaxis <- parse(text = xaxis)
    if(!is.null(yaxis)) yaxis <- parse(text = yaxis)
  }

  ggplot() +
    geom_vline(xintercept = 0) +
    geom_hline(yintercept = 0) +
    geom_point(aes(x = x1, y = x2), color = color, alpha = 0.4) +
    expand_limits(x = c(-7, 7), y = c(-7, 7)) +
    theme_light() +
    labs(x = xaxis, y = yaxis, ...)
}

# Gráfico vectores de entrada.
input_vects <- transf_plot(
  x1 = v1, x2 = v2, color = "#fc1b1f",
  xaxis = "v[1]", yaxis = "v[2]", parse = TRUE
)

# 2.2 Transformaciones no lineal.
# 2.2.1 Espacio curvado.
t_v1 <- v1 + cos(v2)
t_v2 <- v2 + sin(v1)

transf_curv <- input_vects +
  transf_plot(x1 = t_v1, x2 = t_v2, color = "#1b1bfc",
              xaxis = "T(v[1])", yaxis = "T(v[2])", parse = TRUE)

ggsave(filename = "transf-curv.jpg", plot = transf_curv,
       width = 8, height = 4)

# 2.2.2 Transformación afín (traslación).
t_v1 <- v1 + 4
t_v2 <- v2 + (-3)

transf_afin <- input_vects +
  transf_plot(x1 = t_v1, x2 = t_v2, color = "#1b1bfc",
              xaxis = "T(v[1])", yaxis = "T(v[2])", parse = TRUE)

ggsave(filename = "transf-afin.jpg", plot = transf_afin,
       width = 8, height = 4)

# 2.3 Transformaciones lineales.
# 2.3.1 Rotaciones con respecto al origen.
t_v1 <- -v2 # Rotación en 90° (pi/2).
t_v2 <- v1  # Rotación en 90° (pi/2).
#t_v1 <- (cos(pi/4)*v1) - (sin(pi/4)*v2) # Rotación en 45° (pi/4).
#t_v2 <- (sin(pi/4)*v1) + (cos(pi/4)*v2) # Rotación en 45° (pi/4).

transf_rotacion <- input_vects +
  transf_plot(x1 = t_v1, x2 = t_v2, color = "#1b1bfc",
                xaxis = "T(v[1])", yaxis = "T(v[2])", parse = TRUE)

ggsave(filename = "transf-rotacion.jpg", plot = transf_rotacion,
       width = 8, height = 4)

# 2.3.2 Transvección (shear transformation).
t_v1 <- v1 + (2*v2)
t_v2 <- v2

transf_plot(x1 = t_v1, x2 = t_v2, color = "#1b1bfc")


