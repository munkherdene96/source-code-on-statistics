#
# Linear Regression
# Seminar 5
# Author: galaa
# Created on 2016/10/07 15:30:00
#

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Exercise 2

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Data

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

y = c(-7.4, 14.5, 9.9, 2.3, 3.1, 3.3, -0.1, -2.8, 10.8, -4.5, 14.9, -2.7, 14.3, 13.1, 28.6)

X = matrix(
  data = c(1.6, 9.7, 4.7, 7.8, 4.1, 5.4, 2.1, 1.9, 7.8, 1.9, 4.3, 0, 8.3, 8.3, 9.6, 2.7, 1, -0.7, 1.2, 0.6, 2.4, 1, 1.7, 2, 2.5, -1.5, 0.9, 0.9, 2.7, -0.9, 4.7, 9.2, 5.8, 8.1, 8.2, 8.4, 1.6, 1.4, 13.4, 2, 10.8, 5.6, 6.3, 6.9, 1.4),
  nrow = 15,
  ncol = 3,
  byrow = FALSE
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# by using function lm() from the package stats

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

summary(lm(y ~ X))

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Detialed computation

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# sample size

n = length(y)

# add constant term

X <- cbind(rep(x = 1, times = n), X)

# blocks

X1 = X[,1:2]; X2 = X[,3:4]

# matrix M2

I_n = matrix(rep(c(1,0*(1:n)), times = n), nrow = n, ncol = n)

M2 = I_n - X2 %*% solve(t(X2) %*% X2) %*% t(X2)

# b1.hat

b1.hat = solve(t(X1) %*% M2 %*% X1) %*% t(X1) %*% M2 %*% y

print(b1.hat)
