
canonical_ellipse_data <- function(a, b) {
  theta <- seq(from = 0, to = 2*pi, length.out = 200)
  denom_r_theta <- sqrt((b*cos(theta))^2 + (a*sin(theta))^2)
  r_theta <- (a*b)/denom_r_theta

  x_theta <- r_theta*cos(theta)
  y_theta <- r_theta*sin(theta)

  data.frame(theta, r_theta, x_theta, y_theta)
}

