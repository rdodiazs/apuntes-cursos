#=====================================
#
#        Gráficos de contorno.
#
#=====================================

# Función g(x) = 1 - x^2 - y^2 -----------------
y <- x <- seq(from = -4, to = 4, length.out = 30)
z <- outer(X = x, Y = y, FUN = \(x, y) 1 - (x^2 + y^2))

# Gráfico
png(filename = "contorno-01.png", height = 340, width = 500)
par(mar = c(4, 4, 2, 2)+0.1) # Default mar = c(5, 4, 4, 2) + 0.1
contour(z = z, labcex = 1.2, xlab = "x", ylab = "y", cex.lab = 1.5,
        cex.axis = 1.4)
dev.off()


# Función h(x, y) = y^{2} - x^{2} -----------------
y <- x <- seq(from = -4, to = 4, length.out = 30)
z <- outer(X = x, Y = y, FUN = \(x, y) y^2 - (x^2))

png(filename = "contorno-03.png", height = 340, width = 1000)
par(mfcol = c(1, 2), mar = c(4, 4, 2, 2)+0.1)
persp(z = z, theta = 120, phi = 16, shade = 0.4, zlim = c(-20, 20),
      main = "(a)", cex.main = 1.6, xlab = "x", ylab = "y",
      zlab = "z = h(x, y)", cex.axis = 1.3, cex.lab = 1.6,
      ticktype = "detailed")
contour(z = z, labcex = 1.2, main = "(b)", cex.main = 1.6,
        xlab = "x", ylab = "y", cex.lab = 1.4, cex.axis = 1.3)
dev.off()


