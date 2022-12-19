#rm(list = ls())

library(bnlearn)
#setwd("D:\\FIU\\Causal Network Inference in Cancer") # This is input folder, input and output file will be in this directory


input <- function(inputfile) {
   data_file_name <<- inputfile #input file
   dff <<- read.csv(data_file_name)
}

##########################################################################################
# PC STABLEa
# Input: asv.transpose.norm.csv
# Output: Plot
run <- function() {
print("RUNNING PC STABLE...")
#### Pc stable Algorithm
dff <<- dff[,-1]
dades <- lapply(dff, as.numeric)
bn_df <- data.frame(dades)
bn_df <- na.omit(bn_df)
resGS<<- pc.stable(bn_df)
print("DONE.")
}

output <- function(outputfile) {
pdf(paste(outputfile,"pdf",sep="."))
	print("PLOTTING...")
####
p <- plot(resGS)
  # Add title to each plot
  # Save the graphic to file.
  #height = 10*300); #,)
  print("Generating plot...")
  #result <<- PCoA(physeq)
  #y <- plot_sparsity(p0)
  #print(str(y))
  print("Generating CSV...")
  #rich <- richness(physeq, index = c("observed", measure))
  #print(str(y$data))
  #print(str(resGS))
  write.csv(resGS$arcs, paste(outputfile,"csv",sep="."))
  print(p)#plot_bar(HMP, x="Description", fill=diffcol))
  dev.off()
#saveRDS(resGS, outputfile)
print("DONE.")
}
##########################################################################################

