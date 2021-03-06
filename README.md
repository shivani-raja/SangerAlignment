---
# Sanger Alignment
## Shivani Raja 
### 11/08/2021

---
### Introduction 

SangerAlignment allows you to align the sequences of 5 DNA strings, which can be Sanger sequencing files or gRNA text sequences.   

In this example, I have 3 .ab1 (Sanger files) containing information about my CRISPR-knockdown cell line, one .ab1 file for the wild-type cell line, and my target gRNA sequence: CTCAGCGATAGTAAAGTGCA.   
 
*These files are in the github repository (shivani-raja/SangerAlignment) if you would like to practice with them.*  

### Loading the SangerAlignment package

SangerAlignment is currently available on GitHub, so you will first need to install remotes to install the package from GitHub.

Note: Make sure you are using the latest version of R. Update any packages if asked to do so when installing.

```{r}
#installing SangerAlignment
  if(!"remotes" %in% row.names(installed.packages())){
    install.packages("remotes")
}
library(remotes)
remotes::install_github("shivani-raja/SangerAlignment")
library(SangerAlignment)
```

### Loading the files into R

Make sure to a) save your .ab1 files into the same folder as your R working directory so they can be easily loaded into R, and b) give them easily identifiable file names. Then we'll load them into R using the 'readsangerseq' function.

```{r}
#loading the Sanger files 
KD1 <- sangerseqR::readsangerseq(file="KD1.ab1")
KD2 <- sangerseqR::readsangerseq(file="KD2.ab1")
KD3 <- sangerseqR::readsangerseq(file="KD3.ab1")
WT <- sangerseqR::readsangerseq(file="WT.ab1")
```

You should currently have your gRNA sequence as a text, but we want to import it into R as a string so we can align it with our sequences. To do this, we assign the gRNA sequence to the object 'gRNA'.

```{r}
#adding our gRNA sequence into R
gRNA <- c("CTCAGCGATAGTAAAGTGCA")
```

You'll notice that your gRNA sequence will come up under 'Values' within the global environment. However, your sanger sequencing files are under the 'Data' section. Don't worry about this, as we will be using the makestring() function to turn all our sequences into DNA strings, which will allow us to align them.

```{r}
#make a string for each sequence
WT <- makestring(WT)
KD1 <- makestring(KD1)
KD2 <- makestring(KD2)
KD3 <- makestring(KD3)
gRNA <- makestring(gRNA)
```

Now we have our strings, we can align them using alignsequences(). Note that the function requires 5 sequences to work correctly (3 KD, 1 WT and a gRNA sequence.) You can change the order of the sequences if you wish, but I reccommend putting the wild-type cell line first.

```{r}
#align the sequences
alignsequences(WT,KD1,KD2,KD3,gRNA)
```

The output should open in a browser, and show the sequences aligned. Now you can compare the wild-type sequence with the KD cell line to see if the CRISPR machinery had any effect on the genome.
