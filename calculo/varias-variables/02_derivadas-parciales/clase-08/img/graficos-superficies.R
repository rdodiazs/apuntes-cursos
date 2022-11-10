#================================================
#
#           Gráficos de superficies.
#
#================================================

# Función f(x, y) = -y ---------------------
y <- seq(from = -4, to = 4, length.out = 30)
x <- rep(x = 1, times = length(y))
z <- outer(X = x, Y = y, FUN = \(x, y) (-x) * y)

# Creo el gráfico y lo guardo.
png(filename = "plano_var_cte.png")
par(mar = rep(1, 4)) # Achico el padding del gráfico.
persp(z = z, theta = 135, phi = 30, xlab = "x", ylab = "y",
      zlab = "z = f(x, y)", shade = 0.2, cex.lab = 1.8)

dev.off()


# Función g(x, y) = 1 - x^2 - y^2 -------------
y <- seq(from = -4, to = 4, length.out = 30)
x <- y
z <- outer(X = x, Y = y, FUN = \(x, y) 1 - (x^2) - (y^2))

# Creo el gráfico y lo guardo.
png(filename = "superficie.png")
par(mar = rep(1, 4)) # Achico el padding del gráfico.
persp(z = z, theta = 135, phi = 30, xlab = "x", ylab = "y",
      zlab = "z = g(x, y)", shade = 0.2, cex.lab = 1.8)

dev.off()

