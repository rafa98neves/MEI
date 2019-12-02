title1 = "1 - Repetitions:50  ||  n:100  ||  eps:1/n  ||  maxr: n"
title2 = "2 - Reducing probability of memory failure eps = [1/n to 15/n] by 0.1/n, n = 100"
title3 = "3 - Raise array size n=[100 to 1000] by 10"

quick = read.table(file="quick_results.in", nrows=1, header=FALSE)
merge = read.table(file="merge_results.in", nrows=1, header=FALSE)
insertion = read.table(file="insertion_results.in", nrows=1, header=FALSE)
bubble = read.table(file="bubble_results.in", nrows=1, header=FALSE)

quick_ = read.table(file="quick_errors.in", nrows=1, header=FALSE)
merge_ = read.table(file="merge_errors.in", nrows=1, header=FALSE)
insertion_ = read.table(file="insertion_errors.in", nrows=1, header=FALSE)
bubble_ = read.table(file="bubble_errors.in", nrows=1, header=FALSE)

#1 - Values of eps changes
q1 = as.numeric(quick[1,])
b1 = as.numeric(bubble[1,])
m1 = as.numeric(merge[1,])
i1 = as.numeric(insertion[1,])

quick = read.table(file="quick_results.in", nrows=1, skip=1, header=FALSE)
merge = read.table(file="merge_results.in", nrows=1, skip=1, header=FALSE)
insertion = read.table(file="insertion_results.in", nrows=1, skip=1, header=FALSE)
bubble = read.table(file="bubble_results.in", nrows=1, skip=1, header=FALSE)

quick_ = read.table(file="quick_errors.in", nrows=1, skip=1, header=FALSE)
merge_ = read.table(file="merge_errors.in", nrows=1, skip=1, header=FALSE)
insertion_ = read.table(file="insertion_errors.in", nrows=1, skip=1, header=FALSE)
bubble_ = read.table(file="bubble_errors.in", nrows=1, skip=1, header=FALSE)

#2 - Values of eps changes
q2 = rev(as.numeric(quick[1,]))
b2 = rev(as.numeric(bubble[1,]))
m2 = rev(as.numeric(merge[1,]))
i2 = rev(as.numeric(insertion[1,]))

#2 - Values of errors quantity on eps changes
q2_ = rev(as.numeric(quick_[1,]))
b2_ = rev(as.numeric(bubble_[1,]))
m2_ = rev(as.numeric(merge_[1,]))
i2_ = rev(as.numeric(insertion_[1,]))

quick = read.table(file="quick_results.in", nrows=1, skip=2, header=FALSE)
merge = read.table(file="merge_results.in", nrows=1, skip=2, header=FALSE)
insertion = read.table(file="insertion_results.in", nrows=1, skip=2, header=FALSE)
bubble = read.table(file="bubble_results.in", nrows=1, skip=2, header=FALSE)

quick_ = read.table(file="quick_errors.in", nrows=1, skip=2, header=FALSE)
merge_ = read.table(file="merge_errors.in", nrows=1, skip=2, header=FALSE)
insertion_ = read.table(file="insertion_errors.in", nrows=1, skip=2, header=FALSE)
bubble_ = read.table(file="bubble_errors.in", nrows=1, skip=2, header=FALSE)

#3 - Values of array size changes
q3 = as.numeric(quick[1,])
b3 = as.numeric(bubble[1,])
m3 = as.numeric(merge[1,])
i3 = as.numeric(insertion[1,])

#3 - Values of errors quantity on changes on array size changes
q3_ = as.numeric(quick_[1,])
b3_ = as.numeric(bubble_[1,])
m3_ = as.numeric(merge_[1,])
i3_ = as.numeric(insertion_[1,])


#Plot question 1 - LLS 
par(mfrow=c(2,2))
boxplot(q1, ylab="LLS - Quick sort")
boxplot(b1, ylab="LLS - Bubble sort")
boxplot(m1, ylab="LLS - Merge sort")
boxplot(i1, ylab="LLS - Insertion sort")

mtext(title1, side = 3, line = -2, outer = TRUE)


#Plot for question 2 - probability increase impact on algorithms  
x <- seq(from = 1/100, to = 15/100, by = 0.1/100)

par(mfrow=c(2,2))
plot(x,	q2, ylab="LLS - Quick sort", xlab="probability of memory fault", ylim=c(0, 100))
plot(x, q2_, ylab="Errors found - Quick sort", xlab="probability of memory fault")
plot(x, b2, ylab="LLS - Bubble sort", xlab="probability of memory fault", ylim=c(0, 100))
plot(x, b2_, ylab="Errors found - Bubble sort", xlab="probability of memory fault")

mtext(title2, side = 3, line = -2, outer = TRUE)

par(mfrow=c(2,2))
plot(x, m2, ylab="LLS - Merge sort", xlab="probability of memory fault", ylim=c(0, 100))
plot(x, m2_, ylab="Errors found - Merge sort", xlab="probability of memory fault")
plot(x, i2, ylab="LLS - Insertion sort", xlab="probability of memory fault", ylim=c(0, 100))
plot(x, i2_, ylab="Errors found - Insertion sort", xlab="probability of memory fault")


#Plot for question 3 - size increase impact on algorithms  
x <- seq(from = 100, to = 1000, by = 10)

par(mfrow=c(2,2))
plot(x,	q3, ylab="LLS - Quick sort", xlab="probability of memory fault")
abline(lm(q3~x))
plot(x, q3_, ylab="Errors found - Quick sort", xlab="probability of memory fault")
abline(lm(q3_~x))
plot(x, b3, ylab="LLS - Bubble sort", xlab="probability of memory fault")
abline(lm(b3~x))
plot(x, b3_, ylab="Errors found - Bubble sort", xlab="probability of memory fault")
abline(lm(b3_~x))

mtext(title3, side = 3, line = -2, outer = TRUE)

par(mfrow=c(2,2))
plot(x, m3, ylab="LLS - Merge sort", xlab="probability of memory fault")
abline(lm(m3~x))
plot(x, m3_, ylab="Errors found - Merge sort", xlab="probability of memory fault")
abline(lm(m3_~x))
plot(x, i3, ylab="LLS - Insertion sort", xlab="probability of memory fault")
abline(lm(i3~x))
plot(x, i3_, ylab="Errors found - Insertion sort", xlab="probability of memory fault")
abline(lm(i3_~x))