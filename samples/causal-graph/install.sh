# Rscript -e 'install.packages(c("V8","sfsmisc","clue","randomForest","lattice","devtools","MASS"),repos="http://cran.us.r-project.org")'
Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite(c("CAM", "SID", "bnlearn", "pcalg", "kpcalg", "D2C"))'
Rscript -e 'library(devtools); install_github("cran/momentchi2"); install_github("Diviyan-Kalainathan/RCIT")'
Rscript -e 'install.packages(c("sparsebn"),repos="http://cran.us.r-project.org")'
