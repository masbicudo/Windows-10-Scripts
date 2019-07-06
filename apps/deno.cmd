call require posh.cmd

:: TODO: remove this - deno is not the future!

poshca "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iwr https://deno.land/x/install/install.ps1 | iex"
