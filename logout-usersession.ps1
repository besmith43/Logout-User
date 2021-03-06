param (
    [Parameter(Mandatory=$true)][string]$user
)

$hostname = hostname

$sessionId = ((quser | Where-Object { $_ -match $user }) -split ' +')[2]

if (!$sessionId)
{
    Invoke-RDUserLogoff -HostServer $hostname -unifiedsessionid $sessionId
}