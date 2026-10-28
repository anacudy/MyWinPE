$hash = (Get-FileHash -Path WinPE.iso -Algorithm MD5).Hash.ToLower()
Set-Content -Path WinPE.md5 -Value $hash -Encoding utf8
