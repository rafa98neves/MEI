data = read.table(file="p_results.in", header=TRUE);
bubble = data[data$ALGORITHM == 'bubble',];
quick = data[data$ALGORITHM == 'quick',];
merge = data[data$ALGORITHM == 'merge',];
insertion = data[data$ALGORITHM == 'insertion',];

plot(merge$ERRORS ~ merge$PROBABILITY)
lr.out = lm(merge$ERRORS ~ merge$PROBABILITY);
summary(lr.out)
abline(lr.out, col="RED")

