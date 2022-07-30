from tkinter import *
import subprocess
from time import sleep
import time

root = Tk()
root.geometry('400x250')

display = Label(root, text='Are you there?', font=('', 20))
display.pack(pady=40)


def locking():
    cmd = 'rundll32.exe user32.dll, LockWorkStation'
    subprocess.call(cmd)

    but['state'] = 'disable'


def cancel():

    root.after_cancel(L)
    display['text'] = 'You can close this windows now'


# Take a reference of after
L = root.after(60000, locking)

but = Button(root, text='Im here', command=cancel)
but.pack(side='bottom', pady=30)


mainloop()
