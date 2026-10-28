$argumentList = @(
  "--quiet=true",
  "--conf-path=aria2.conf",
  "--input-file=adk.txt"
)
aria2c $argumentList

.\adksetup /quiet /features OptionId.DeploymentTools /log adksetup.log
.\adkwinpesetup /quiet /log adkwinpesetup.log
