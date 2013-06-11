## demoScript.R

## Erich S. Huang
## Brian M. Bot
## Sage Bionetworks
## Seattle, WA

## REQUIRED LIBRARIES
require(synapseClient)
require(rGithubClient)

## LOAD GITHUB REPO AS R OBJECT
stmRepo <- getRepo('sage-bionetworks/STM-metaAnalysis-clearScience')

## LET'S LOOK AT FIGURE 5 
sourceRepoFile(stmRepo, 'functions/figureFiveBCDE.R')

## RUN FIGURE 5 CODE!
fig5Result <- figureFiveBCDE()

## WHAT DOES THE SOURCE CODE THAT GENERATED THIS LOOK LIKE?
view(stmRepo, 'functions/figureFiveBCDE.R')