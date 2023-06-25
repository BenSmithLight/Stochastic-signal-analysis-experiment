n = 0:319;
x = cos(pi/4*n)+randn(size(n));
periodogram(x,hamming(length(x)))

