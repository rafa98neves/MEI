setwd("D:/Users/joaom/Documents/MEI/Projeto/MEI/Projeto2-HP");
data = read.table(file="all_results.in", header=TRUE);
aggregate(data[, 2:3], list(data$ALGORITHM), mean);
aggregate(data[, 2:3], list(data$ALGORITHM), sd);
cills = read.table(file="confidence_interval_LLS.in", header=TRUE);
add.error.bars <- function(X,Y,SE,w,col=1){
 X0 = X; Y0 = (Y-SE); X1 =X; Y1 = (Y+SE);
 arrows(X0, Y0, X1, Y1, code=3,angle=90,length=w,col=col);
}

plot(cills$ALGORITHM, cills$MEAN, ylim=c(20,80));
> lines(cills$ALGORITHM, cills$MEAN);
> add.error.bars(c(1:4), cills$MEAN, cills$UPPER-cills$MEAN, 0.1, col=1);
