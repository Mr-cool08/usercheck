Set objShell = Wscript.CreateObject ("Wscript.shell")
dim islocked


    call checklock



'=================================
'Functions
'=================================

function checklock
    Dim computer : computer = "."

    If WScript.Arguments.Count = 1 Then
        computer = WScript.Arguments(0)
    End If

    If locked(computer) Then
        Wscript.Quit
    Else
        do 
WScript.Sleep(600000)
objShell.Run "python C:\users\%username%\usercheck\check.py"
loop 
        wscript.sleep 3000 'for debugging - allow time to enter lock screen
    End If      
end function


Function locked(computer)
    Dim wmi : Set wmi = GetObject("winmgmts://" & computer & "/root/cimv2")
    Dim lockapp_count : lockapp_count = wmi.ExecQuery ("SELECT * FROM Win32_Process WHERE Name = 'lockapp.exe'").Count
    Dim explorer_count : explorer_count = wmi.ExecQuery ("SELECT * FROM Win32_Process WHERE Name = 'explorer.exe'").Count
    locked = (lockapp_count >= explorer_count)
End Function
