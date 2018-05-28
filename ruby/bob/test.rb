s = gets.strip
frequencies = {}

s.each_char do |char|
  frequencies[char] = (frequencies[char] || 0) + 1
end
p frequencies
values = frequencies.values

if values.uniq.count == 1 ||
   values.sort[1..-1].uniq.count == 1 ||
   values.sort[1..-2].uniq.count == 1
  puts 'YES'
else
  puts 'NO'
end

$REFRESHTOKEN = "c7900971c9647bdcaa07a9d68a9eddeda7efe760"
$SERVERTEMPLATEHREF = "/api/server_templates/370123403"
$DEPLOYMENTHREF = "/api/deployments/496875003"
$INSTANCEHREF = "/api/clouds/3389/instances/CLQAC4S0IO687"
$APIHOST = "https://purple1-moo-403.test.rightscale.com"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://rightlink.rightscale.com/rll/10/rightlink.enable.ps1", "$pwd\rightlink.enable.ps1")

Powershell -ExecutionPolicy Unrestricted -File rightlink.enable.ps1 -refreshToken $REFRESHTOKEN -serverTemplateHref $SERVERTEMPLATEHREF -deploymentHref $DEPLOYMENTHREF -instanceHref $INSTANCEHREF -ApiServer $APIHOST
