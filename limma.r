library(limma)

brca <- read.csv("brca_for_r.csv",header=T,row.names=1)

design <- c(rep(0,98),rep(1,58),rep(2,362))
design.mat <- model.matrix(~design)
fit <- lmFit(brca,design.mat)
fit <- eBayes(fit)
brca_deg <- topTable(fit,coef = "design",number=100,p.value=0.01)

write.table(row.names(brca_deg),file="brca_deg_list.txt",quote=F,sep="\t")
