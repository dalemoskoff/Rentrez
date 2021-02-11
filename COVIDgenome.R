## Download the SARS-CoV-2 reference genome from Genbank.

Genbank_id<-"NC_045512.2" # Genbank accession number for the SARS-CoV-2 reference genome.
library(rentrez) # Load rentrez library.
Covid<-entrez_fetch(db="nuccore",id=Genbank_id,rettype="fasta") # Download the SARS-CoV-2 reference genome from the NCBI database 'nuccore' (which includes Genbank) using accession number NC_045512.2. Get data in fasta format.


## Isolate S protein from the genome; starts at bp position 21,563 and ends at position 25,384.

# First, isolate just the sequence (e.g. remove the header text).
Sequence<-gsub("\n","",Covid) # Remove "\n" from beginning of sequence.
Sequence<-gsub(".*[:lower:]","",Sequence) # Remove lower case text (only found in the header).

# Next, isolate just the S protein.
SProtein<-substring(Sequence,first=21563,last=25384) # Object now contains only the sequence from bp position 21,563 to bp position 25,384.


##I would say this gene is highly conserved because 96 identical sequences were returned in the BLAST search. The other sequences returned were a 99.92-99.97% match. This indicates that this gene has remained largely unchanged across specimens collected in different places and at different times. This makes sense as this gene is important for infection and thus is integral to the propagation of the virus.   