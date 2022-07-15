# Función para graficar una forma cuadrática y junto con sus ejes principales
# usando el Teorema del Eje Principal.

ellipse_data <- function(a, b, c, k,           # Coeficientes de la forma cuadrática.
                         evalues = NULL,       # Vector con eigenvalores
                         evector_1 = NULL,     # Eigenvector 1 normalizado
                         evector_2 = NULL      # Eigenvector 2 normalizado
                         ) {
  # Ecuación Polar de la forma cuadrática ax^2 + 2bxy + cy^2 = k
  theta <- seq(from = 0, to = 2*pi, length.out = 200)
  denom_r_theta <- (a*(cos(theta))^2) + b*sin(2*theta) + (c*(sin(theta))^2)
  r_theta <- sqrt(k/denom_r_theta)
  x_theta <- (r_theta*cos(theta))
  y_theta <- (r_theta*sin(theta))

  polar_df <- data.frame(theta, r_theta, x_theta, y_theta)

  # Ejes Principales de la forma cuadrática
  # Si no se dan los eigenvalores o eigenvectores, entonces se calculan por el
  # método de eigendecomposición usado en R.
  if(is.null(evalues) || is.null(evector_1) || is.null(evector_2)) {
    coef_matrix <- matrix(data = c(a, b, b, c), nrow = 2, ncol = 2, byrow = TRUE)
    eigen_decomp <- eigen(coef_matrix)
    eigenvalues <- eigen_decomp$values
    eigenvec_1 <- eigen_decomp$vectors[, 1]
    eigenvec_2 <- eigen_decomp$vectors[, 2]
  } else {
    if(length(evalues) == 1 || length(evector_1) == 1 || length(evector_2) == 1) {
      stop("Longitud de evalues, evector_1 y evector_2 debe ser mayor a 1")
    }
    eigenvalues <- evalues
    eigenvec_1 <- evector_1
    eigenvec_2 <- evector_2
  }

  magnitude_vec <- function(x) sqrt((x[1])^2+(x[2])^2) # Calcula la magnitud de un vector.

  positive_sqrt <- function(x) sqrt(sign(x)*x) # Para obtener sqrt de números positivos y que sean reales.
  
  a_length <- positive_sqrt(k/eigenvalues[1])
  b_length <- positive_sqrt(k/eigenvalues[2])

  a_axis <- (a_length/magnitude_vec(eigenvec_1)) * eigenvec_1
  b_axis <- (b_length/magnitude_vec(eigenvec_2)) * eigenvec_2

  axes_df <- data.frame(eigenvec_1, eigenvec_2, a_axis, b_axis)

  list(polar_df = polar_df, axes_df = axes_df)

}

