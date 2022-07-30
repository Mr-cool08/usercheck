Set objShell = Wscript.CreateObject ("Wscript.shell")
do 
WScript.Sleep(600000)
objShell.Run "python C:\users\%username%\usercheck\check.py"
loop 