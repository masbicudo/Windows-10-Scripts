call require posh.cmd

poshca "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iwr https://deno.land/x/install/install.ps1 | iex"
