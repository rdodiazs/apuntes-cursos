#-----------------------------------
# Gráficos sobre geometría de la SVD.
#------------------------------------

# 1. Cargando librerías. ---------------

library(dplyr)
library(ggplot2)

# 2. Funciones personalizadas.--------------------------

geom_vector <- function(vec) {
  arrow_shape <- arrow(length = unit(0.4, "cm"))

  list(
    geom_segment(aes(x = 0, xend = vec[1], y = 0, yend = vec[2]),
                   arrow = arrow_shape, size = 1)
  )
}

text_annot <- function(vec, h_just=0, v_just = 0, label, size = 4.5, ...) {
  list(
    annotate(geom = "text", x = vec[1]+h_just, y = vec[2]+v_just,
             label = label, parse = TRUE, size = size, ...)
  )
}

geom_biaxis <- function() {
  list(
    geom_vline(xintercept = 0, color = "lightgrey"),
    geom_hline(yintercept = 0, color = "lightgrey")
  )
}


# 3. Cálculo y gráfico de matriz y vectores iniciales. --------------------

# Matriz A y vectores x y Ax.
A_m <- matrix(data = c(1, 3, 1, -4), nrow = 2, ncol = 2)
x_v <- c(3, 2)
Ax_v <- (A_m %*% x_v)[, 1]

# Gráfico de vectores x y Ax.
svd_geom_01 <- ggplot() +
  geom_biaxis() +
  geom_vector(vec = x_v) +
  geom_vector(vec = Ax_v) +
  text_annot(vec = x_v, v_just = 0.1, label = "bold(x)") +
  text_annot(vec = Ax_v, v_just = 0.1, label = "bold(Ax)") +
  expand_limits(x = 5.2) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = NULL, y = NULL)

ggsave(file = "svd-geom-01.jpg", plot = svd_geom_01,
       width = 6, height = 4)

# 3. Cálculo SVD de A y gráfico con x.---------------------

# Matrices de la SVD de A.
sv_decomp <- svd(A_m)
U_m <- sv_decomp$u
D_m <- diag(sv_decomp$d)
V_m <- sv_decomp$v

# Vectores del producto entre las matrices de la SVD y x.
tV_x <- (t(V_m)%*%x_v)[,1]     # V^{T} \vec{x}
D_tVx <- (D_m%*%tV_x)[,1]      # \Sigma (V^{T} \vec{x})
U_DtVx <- (U_m%*%D_tVx)[,1]    # U (\Sigma V^{T} \vec{x})

# Gráfico de SVD de A aplicado a vector x.
svd_geom_02 <- ggplot() +
  geom_biaxis() +
  geom_vector(vec = x_v) +
  geom_vector(vec = tV_x) +
  geom_vector(vec = D_tVx) +
  geom_vector(vec = U_DtVx) +
  text_annot(vec = x_v, v_just = 0.3, label = "bold(x)") +
  text_annot(vec = tV_x, v_just = -0.3, label = "bold(V^T*x)") +
  text_annot(vec = D_tVx, v_just = -0.3, label = "(bold(Sigma*V^T))*bold(x)") +
  text_annot(vec = U_DtVx, h_just = -0.3, v_just = 0.5, label = "(bold(U*Sigma*V^T))*bold(x) == bold(Ax)") +
  expand_limits(x = c(-1.2, 5.2), y = -5.2) +
  scale_x_continuous(breaks = -1:5) +
  scale_y_continuous(breaks = c(-5:2)) +
  theme_light() +
  theme(panel.grid = element_blank()) +
  labs(x = NULL, y = NULL)

ggsave(file = "svd-geom-02.jpg", plot = svd_geom_02,
       width = 6, height = 4)


