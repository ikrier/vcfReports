args <- commandArgs(trailingOnly = TRUE)

libname=args[1]
diamtablename=args[2]
vcffile=args[3]
targetsname=args[4]
pindelresults=args[5]

for(i in 1:5)
{
  cat(args[i],"\n")
}

system(command = paste("mkdir variantreportdir",libname,sep="_"))
setwd(paste("variantreportdir",libname,sep="_"))

diamtable=read.csv(diamtablename,header=F)

diamname=diamtable$V2[as.numeric(libname)]
if(diamname=="NONE"){diamname="Aucun"}

Sweave("/data/vcfReports/VariantsReport.Rnw",)
tools::texi2pdf("VariantsReport.tex")

system(command=paste("mv VariantsReport.pdf ../VariantsReport_Lib",libname,".pdf",sep=""))
