#define here all 3 file paths, separator char and number of separators
[System.Environment]::SetEnvironmentVariable('userfile','.\users.txt')
[System.Environment]::SetEnvironmentVariable('passfile','.\pass.txt')
[System.Environment]::SetEnvironmentVariable('file','.\breach_little.txt')
[System.Environment]::SetEnvironmentVariable('separator',':;')
[System.Environment]::SetEnvironmentVariable('NbrSeparator','2')

#removes all jobs
Remove-job -Name * -Force

#void all output files
Remove-Item -Path $env:userfile
New-Item -Path $env:userfile
Remove-Item -Path $env:passfile
New-Item -Path $env:passfile
#wait for file creation process to end
sleep -Seconds 1

#async block for user file 
$blockUser = {
    foreach($line in Get-Content $env:file ) {
        if($line -match $regex){
                    
            $pos = $line.IndexOf($env:separator)
            $leftPart = $line.Substring(0, $pos)
            #write file
            $leftPart | Out-File -Append -FilePath $env:userfile -Encoding ascii
        }
    }
}

$blockPass = {
    foreach($line in Get-Content $env:file  ) {
        if($line -match $regex){

            $pos = $line.IndexOf($env:separator)
            $rightPart = $line.Substring($pos+$env:NbrSeparator)
            #write file
            $rightPart| Out-File -Append -FilePath $env:passfile -Encoding ascii
        }
    }
}

#starts async jobs
Start-Job -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ScriptBlock $blockUser -Name "write user file" 
Start-Job -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ScriptBlock $blockPass -Name "write pass file"
#wait  for full creation of the jobs
sleep 1

$i = 0
#wait for all jobs to end
while($(Get-Job -name * | where -Property State -eq Running) -ne $null){
 sleep 1
 $i = $i + 1
 cls ; write-host "not finished, time elapsed : $i"
 }

#remove all env variables
[System.Environment]::SetEnvironmentVariable('file', $null)
[System.Environment]::SetEnvironmentVariable('userfile',$null)
[System.Environment]::SetEnvironmentVariable('passfile',$null)
[System.Environment]::SetEnvironmentVariable('separator',$null)
[System.Environment]::SetEnvironmentVariable('NbrSeparator',$null)
#write final line
Write-Host "`n all jobs finished, very gud `n"

