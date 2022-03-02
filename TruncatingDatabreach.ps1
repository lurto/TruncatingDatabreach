#!!!!work in local dir!!!!!

#define here all 3 file paths, separator char and number of separators
[System.Environment]::SetEnvironmentVariable('userfile','users.txt') #don't use ".\"
[System.Environment]::SetEnvironmentVariable('passfile','pass.txt')  #don't use ".\"
[System.Environment]::SetEnvironmentVariable('file','breach_little.txt') #don't use ".\"
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
    try
    {
        #open stream for read
        $stream = [System.IO.StreamReader]::new("$pwd\"+"$env:file")
        #open stream for write
        $writer = [System.IO.File]::CreateText("$pwd\"+"$env:userfile")

        while ($line = $stream.ReadLine())
        {
            #seperate line
            $leftPart = $line.Substring(0, $($line.IndexOf($env:separator)))
            #write file
            $writer.WriteLine($leftPart)
        }
    }
    finally
    {
        $stream.Dispose()
        $writer.Close()
    }
}

$blockPass = {
    try
    {
        #open stream for read
        $stream = [System.IO.StreamReader]::new("$pwd\"+"$env:file")
        #open stream for write
        $writer = [System.IO.File]::CreateText("$pwd\"+"$env:passfile")

        while ($line = $stream.ReadLine())
        {
            #seperate line
            $rightPart = $line.Substring($($line.IndexOf($env:separator))+$env:NbrSeparator)
            #write file
            $writer.WriteLine($rightPart)
        }
    }
    finally
    {
        $stream.Dispose()
        $writer.Close()
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
cls; Write-Host "`n all jobs finished in $i, very gud."
