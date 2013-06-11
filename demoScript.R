## demoScript.R

## Erich S. Huang
## Brian M. Bot
## Sage Bionetworks
## Seattle, WA

## REQUIRED LIBRARIES
require(synapseClient) # a Sage Bionetworks R package
require(rGithubClient) # another Sage Bionetworks R package
require(RCurl)

## LOAD GITHUB REPO AS R OBJECT
# Brian Bot has written an R package that interrogates the Github application programming interface (API)
# which pulls down both metadata and the actual source code in a Github repository and stores it in
# memory in the R workspace

# So let's pulldown the Github repository ('repo', for short) that underlies the entire Science
# Translational Medicine paper, Margolin et. al. 'Systematic Analysis of Challenge-Driven Improvements 
# in Molecular Prognostic Models for Breast Cancer', Sci Trans Med, doi 10.1126/scitranslmed.3006112
stmRepo <- getRepo('sage-bionetworks/STM-metaAnalysis-clearScience', ref = 'tag', refName = 'v1.0')
show(stmRepo)

## LET'S LOOK AT FIGURE 5 
# If we are interested in the boxplots in Figure 5 of the paper, let's 'load in' the runnable
# source code for those panels
sourceRepoFile(stmRepo, 'functions/figureFiveBCDE.R')

## RUN FIGURE 5 CODE!
# Let's now run it on the fly.
fig5Result <- figureFiveBCDE()

# Now look at the figure panels on the left

## WHAT DOES THE SOURCE CODE THAT GENERATED THIS LOOK LIKE?
# We can even ask R to show us the actual Github page of the specific source code in question
view(stmRepo, 'functions/figureFiveBCDE.R')

## WHAT DO SOME OF THE UNDERLYING DATA LOOK LIKE?
# And we can show the data in an easy-to-read format
rstudio::viewData(fig5Result$clinicalGroupLogicalMatrix)

## LET'S GET REAL GEEKY AND LOOK AT THE PROVENANCE
fig5Activity <- getActivity('1767637')
show(fig5Activity)

getURL(file.path(synapseClient:::synapseServiceEndpoint("REPO")$endpoint, "activity/1767637"))
