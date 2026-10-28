$argumentList = @(
  "--quiet=true",
  "--conf-path=aria2.conf",
  "--input-file=adk.txt"
)
Start-Process -Wait -FilePath aria2c -ArgumentList $argumentList

$argumentList = @(
  "/quiet",
  "/features",
  "OptionId.DeploymentTools"
)
Start-Process -Wait -FilePath adksetup -ArgumentList $argumentList

$argumentList = @(
  "/quiet"
)
Start-Process -Wait -FilePath adkwinpesetup -ArgumentList $argumentList
