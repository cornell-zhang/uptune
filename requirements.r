r = getOption("repos")
r["CRAN"] = "http://cran.us.r-project.org"
options(repos = r)

install.packages(c("V8","sfsmisc","clue","randomForest","lattice","devtools","MASS"));
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("graph", "CAM", "SID", "bnlearn", "pcalg", "kpcalg", "D2C"));

library(devtools); 
install_github("cran/momentchi2"); 
install_github("Diviyan-Kalainathan/RCIT");
install.packages(c("sparsebn"), repos="http://cran.us.r-project.org");
