$argumentList = @(
  "--quiet=true",
  "--conf-path=aria2.conf",
  "--input-file=adk.txt"
)
aria2c $argumentList

$argumentList = @(
  "/quiet",
  "/features", "OptionId.DeploymentTools",
  "/log", "adksetup.log"
)
Start-Process -Wait -FilePath adksetup -ArgumentList $argumentList

$argumentList = @(
  "/quiet",
  "/log", "adkwinpesetup.log"
)
Start-Process -Wait -FilePath adkwinpesetup -ArgumentList $argumentList
