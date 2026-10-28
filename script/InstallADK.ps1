$argumentList = @(
  "--quiet=true",
  "--conf-path=aria2.conf",
  "--input-file=adk.txt"
)
aria2c $argumentList

.\adksetup /quiet /features OptionId.DeploymentTools
.\adkwinpesetup /quiet
