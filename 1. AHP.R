
#-------------:   used to Update R version    :-------------
# installing/loading the package:
if(!require(installr)) {
  install.packages("installr"); require(installr)} #load / install+load installr

# using the package:
updateR() # this will start the updating process of your R installation. 

#-------------:   used to download the "ahp" package    :-------------
install.packages("devtools")
library(devtools)
devtools::install_github("gluc/ahp", build_vignettes = TRUE)

# -------------: Example of car purchase :--------------
library(ahp)
ahpFile <- system.file("extdata", "car.ahp", package="ahp")
#carAhp <- LoadFile(ahpFile) # LoadFile was defined in older version
carAhp <- Load(ahpFile) 
Calculate(carAhp)

library(data.tree)
print(carAhp, filterFun = isNotLeaf)

Calculate(carAhp)
print(carAhp, priority = function(x) x$parent$priority["Total", x$name])

Visualize(carAhp)

Analyze(carAhp)

AnalyzeTable(carAhp)

AnalyzeTable(carAhp, 
             variable = "priority", 
             sort = "orig",
             pruneFun = function(node, decisionMaker) PruneByCutoff(node, decisionMaker, 0.05),
             weightColor = "skyblue",
             consistencyColor = "red",
             alternativeColor = "green")

#-------------: Just an amazing tool by R[AHP] :-------------
RunGUI()

#-----------: Another example of vaction :-------------
ahpFile <- system.file("extdata", "vacation.ahp", package="ahp")
vacationAhp <- Load(ahpFile)
Calculate(vacationAhp)

Visualize(vacationAhp)

AnalyzeTable(vacationAhp)

AnalyzeTable(vacationAhp, decisionMaker = "Dad")
AnalyzeTable(vacationAhp, decisionMaker = "Mom")
AnalyzeTable(vacationAhp, decisionMaker = "Kid")

# ------------: Another example :---------
# make sure you are in directory of this file below
myAhp <- Load("ChoosetheMostSuitableLeader.ahp")
Calculate(myAhp)
Analyze(myAhp)

#-------------problems in method----------
# if i do have uncomparable criterias then decision making
# may be halted.
# so we can choose to use techniques as SMART | TOPSIS | ELECTRE IV
# these are all MCDM approaches (i.MODM ii.MADM(a. AHP b.SMART c. TOPSIS d. ELECTRE ...))

#----------look for DST | ibelief | EVcombR packages
install.packages("ibelief")
install.packages("dst")
install.packages("EvCombR")
