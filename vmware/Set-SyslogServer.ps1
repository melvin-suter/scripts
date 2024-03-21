Import-Module VMware.PowerCLI
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -confirm:$false

Connect-VIServer

Get-VMHost  | % {
    Get-AdvancedSetting -Entity $_ -Name 'Syslog.global.logHost' | Set-AdvancedSetting -Confirm:$false -Value "tcp://graylog.domain.local:1514"
    Get-VMHostFirewallException -VMHost $_ -Name "syslog" | Set-VMHostFirewallException -Enabled:$true -Confirm:$false
}

Disconnect-VIServer -Confirm:$false
