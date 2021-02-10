##Load library and download NCBI data. 

library(rentrez) #Load rentrez library
ncbi_ids<-c("HQ433692.1","HQ433694.1","HQ433691.1") #Create a vector of 3 IDs for records in the NCBI database; IDs are in the form of an NCBI accession followed by a version number.
Bburg<-entrez_fetch(db="nuccore",id=ncbi_ids,rettype="fasta") #Download data from the 'nuccore' NCBI database that matches the three unique IDs specified by the ncbi_ids vector. Get data in fasta format.
Bburg #View object. Contains 3 different sequences of the 16S gene of Borrelia burgdorferi.


##Create a new object with three elements, each containing one sequence of the gene and the corresponding NCBI IDs and description.

Sequences<-strsplit(Bburg,split="\n\n") #Creates object as a list.
Sequences<-unlist(Sequences) #Converts object to a dataframe.


##Separate sequences from the headers and create a new dataframe.

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) #Isolate headers.
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences) #Isolate sequences.
Sequences<-data.frame(Header=header,Sequence=seq) #New data frame with separate columns for header and sequence.
#Save new data frame to file called "Sequences.csv".
write.csv(Sequences,"Sequences.csv") 
