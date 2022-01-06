REM grmode.exe Updated January 8 2020 at 8:00 AM
Rem
Rem
Open "Ispentthismuch.dat" For Output As #2
Close #2

_FullScreen
start:
Cls
Print
Print "Lotto Max Lottery Simulator RC6 Version 2020 "
Print "Released on January 8 2020 at 6:00 AM "
Print "Written By Russ Campbell of Kitchener, Ontario, Canada"
Print "------------------------------------------------------"
Print
Input "Do want colour screens [default Yes]       : ", cs$
If cs$ = "y" Then
    cs$ = "Y"
ElseIf cs$ = "n" Then
    cs$ = "N"
End If
If cs$ = "" Then
    cs$ = "Y"
End If
Input "Do you have a printer online and do you want to use it [default NO]  : ", printer$
If printer$ = "y" Then
    printer$ = "Y"
ElseIf printer$ = "n" Then
    printer$ = "N"
End If
If printer$ = "" Then
    printer$ = "N"
End If
Input "Do you wish to display the output of data on the screen [Y]es or [N]o : ", answer$
If answer$ = "N" Or answer$ = "n" Then
    display$ = "N"
Else
    display$ = "Y"
End If
Input "Do you wish to display any help files on the screen --- [Y]es or [N]o : ", answer$
If answer$ = "N" Or answer$ = "n" Then
    helpfile$ = "N"
Else
    helpfile$ = "Y"
End If
Input "Which speed do you wish to display on the screen [R]eadable or [F]ast : ", answer$
If answer$ = "R" Or answer$ = "r" Then
    speed$ = "Readable"
Else
    speed$ = "Fast"
End If

Cls
Print
Print "Graphics Mode For Lotto Max"
Print
Print "[A]  -  No Graphics Card"
Print "[B]  -  VGA Mode"
Print "[C]  -  HDMI Mode"
Print
Print "[Return] defaults to HDMI Mode ..."
Print
Input "Enter [A B C] : ", answer$
If answer$ = "a" Or answer$ = "A" Then
    stype = 0
    stype$ = "None"
ElseIf answer$ = "b" Or answer$ = "B" Then
    stype = 1
    stype$ = "VGA"
ElseIf answer$ = "c" Or answer$ = "C" Then
    stype = 2
    stype$ = "HDMI"
ElseIf answer$ = "" Then
    stype = 2
    stype$ = "HDMI"
End If
qqqq:

Print
Input "How many Numbers in the Wheeling System [14 to 42] [defaults to 14] : ", qqq
If qqq < 14 Or qqq > 42 Then
    qqq = 14
End If
Print
Cls
Print
Print "Challenge Level of Lotto Max RC6 Lottery Simulator"
Print
Print " [1]  Easy Skill Game"
Print " [2]  Medium Skill Game"
Print " [3]  Hard Skill Game"
Print " [4]  Real Time Game"
Print " [5]  Impossible Game"
Print
Input " Skill Level : ", skill
If skill = 1 Then money = 1000000: skill$ = "Easy"
If skill = 2 Then money = 50000: skill$ = "Medium"
If skill = 3 Then money = 10000: skill$ = "Hard"
If skill = 4 Then money = 25000: skill$ = "Real Time"
If skill = 5 Then money = -25000: skill$ = "Impossible"
Print
Cls
Print
Print "Lotto Max RC6 Lottery Simulator System Configuration"
Print
Print "Printer  Online                               :  "; printer$
Print "Color Screens                                 :  "; cs$
Print "Graphics Mode                                 :  "; stype$
Print "Wheeling System                               :  "; qqq; "Numbers"
Print "Starting Money                                :  "; "$"; money; "Dollars"
Print "Skill Level                                   :  "; skill$
Print "Display text output on screen                 :  "; display$
Print "Display Speed [R]eadable or [F]ast            :  "; speed$
Print
Input "Is the above correct [Y]es or [N]o : ", answer$
If answer$ = "n" Or answer$ = "N" Or answer$ = "no" Or answer$ = "NO" Then
    GoTo start
End If


Open "grmode.dat" For Output As #1
Print #1, printer$
Print #1, cs$
Print #1, stype
Print #1, qqq
Print #1, skill$
Print #1, display$
Print #1, helpfile$
Print #1, speed$
Close #1
money:
Open "totalbalance.dat" For Output As #2
Print #2, money
Print #2, 0
Print #2, 0
Print #2, money
Close #2
chainit:
Chain "Lotto_max_simulation"
finish:
End

