Rem *** Lotto Max Simulator Version 2022 RC22 Working Version With Automatic Draw Date Update
Rem *** Fully 99.999 % working copy Most up to date.
Rem *** Written by: Russ Campbell
Rem
Rem *** Last Update : Jan 06 2022  12:01 AM
Rem
_FullScreen _Stretch
Clear , , 600000
Dim temp(7): Timer On
Dim temp2(7)
Dim temp3(50)
Dim temp4(50)
Dim entry(50)
Dim numb(50)
Dim chart(100000, 11)
Dim bonus(50)
Dim outpt(50)
Dim outpt1(100)
Dim outpt2(50)
Dim m As Integer
Dim y As Integer
Dim Shared d1 As Integer
Dim Shared mnth As Integer
Dim Shared virtualyear As Integer
Dim Shared day0 As Integer
Dim Shared day2 As Integer
Dim Shared month2 As Integer
Dim Shared year2 As Integer
Dim Shared day3 As Integer
Dim Shared month3 As Integer
Dim Shared year3 As Integer
Dim Shared nextday As Integer
Dim Shared draw2$(10)
Dim Shared month$(12)
Dim Shared month3$(12)
Dim Shared day12 As Integer
Dim Shared month12 As Integer
Dim Shared year12 As Integer
Dim Shared linecounter As Integer
Rem $STATIC
Randomize Timer
Rem ON ERROR GOTO errorhandle
GoSub READDAYMONTHYEAR
GoSub grcheck
GoSub grinit
GoSub buildchart
GoSub convert
GoSub finalversion
Dim sources As String
Dim choices As String
Dim destination1 As String
Dim destination2 As String
Dim destination3 As String
Dim destination4 As String
Rem Program written by Russ Campbell
Rem parts of program taken from
Rem Pete at qb64.org

If crs$ = "Y" Then Color 1, 7
Cls
If crs$ = "Y" Then Color 11, 1
Rem build outer top corner at pos 3,6
Locate 3, 6
Print Chr$(201)
Rem build outer top line at line 3
For i = 2 To 66
    Locate 3, 5 + i
    Print Chr$(205)
Next i
Rem build outer end corner at pos 3,72
Locate 3, 72
Print Chr$(187)
Rem build outer box vertical lines on both sides
For i = 4 To 17
    Locate i, 6
    Print Chr$(186)
    Locate i, 72
    Print Chr$(186)
Next i
Locate 18, 6
Print Chr$(200)
Rem build outer box bottom line
For i = 2 To 66
    Locate 18, 5 + i
    Print Chr$(205)
Next i
Rem build outer box right bottom corner
Locate 18, 72
Print Chr$(188)
If crs$ = "Y" Then Color 7, 1
Rem build white speckled box  top line
For i = 8 To 70
    Locate 4, i
    Print Chr$(178)
Next i
Rem build white speckled box bottom line
For i = 8 To 70
    Locate 17, i
    Print Chr$(178)
Next i
Rem build white speckled box bot vertical lines
For i = 4 To 17
    Locate i, 7
    Print Chr$(178)
    Locate i, 71
    Print Chr$(178)
Next i
If crs$ = "Y" Then Color 3, 1
Locate 5, 8
Print Chr$(201)
For i = 9 To 69
    Locate 5, i
    Print Chr$(205)
Next i
Locate 5, 70
Print Chr$(187)
For i = 9 To 69
    Locate 16, i
    Print Chr$(205)
Next i
Rem build inner box vertical lines
For i = 5 To 16
    Locate i, 8
    If i = 5 Then
        Print Chr$(201) Rem correct
    ElseIf i = 8 Then
        Print Chr$(204) Rem correct
        Rem build inner box left corner
    ElseIf i = 15 Then
        Print Chr$(200)
    Else
        Print Chr$(186)
    End If
    Locate i, 70
    If i = 5 Then
        Print Chr$(187)
    ElseIf i = 8 Then
        Print Chr$(185)
        Rem build inner box lower  right corner
    ElseIf i = 16 Then
        Print Chr$(188)
    Else
        Print Chr$(186)
    End If
Next i
Rem build first middle line at location 8,9
For i = 9 To 69
    Locate 8, i
    Print Chr$(205)
Next i

Rem build second middle line at location  15,9
For i = 9 To 69
    Locate 15, i
    Print Chr$(205)
Next i
Locate 15, 70
Print Chr$(187)
If crs$ = "Y" Then Color 10, 5
Locate 6, 9
Print " Lotto Max 2022 RC2022 Version Lotto Max Simulator Final Vers"
Locate 7, 9
Print " You start off with variable amounts decided by skill level  "
If crs$ = "Y" Then Color 2, 14
Locate 9, 9
Print "                                                             "
Locate 10, 9
Print "                                                             "
Locate 11, 9
Print "                                                             "
Locate 12, 9
Print "                                                             "
Locate 13, 9
Print "                                                             "
Locate 14, 9
Print "                                                             "
If crs$ = "Y" Then Color 10, 5
Locate 10, 14
Print "Written By    : Russ Campbell                      "
Locate 11, 14
Print "Release Date  : Jan 6  -  12:01 AM                 "
Locate 12, 14
Print "Registered To :                                    "
Locate 12, 30
Print reg$
Locate 13, 14
Print "Serial Number : "; reg2$; "      "
If crs$ = "Y" Then Color 3, 1
For i = 9 To 70
    Locate 15, i
    Print Chr$(205)
Next i
If crs$ = "Y" Then Color 2, 12
Locate 16, 8
Print " Graphics Mode : "
Locate 16, 25
Print "["
Locate 16, 30
Print "]"
If crs$ = "Y" Then Color 4, 2
Locate 16, 26
Print "    "
Locate 16, 26
Print grmode$
Locate 16, 45
If crs$ = "Y" Then Color 15, 3
Locate 16, 31
Print
If crs$ = "Y" Then Color 15, 3
Locate 16, 63
Print "       "
If crs$ = "Y" Then Color 11, 6
Locate 16, 31
Print "     Press any key to continue...       "
If crs$ = "Y" Then Color 3, 1
Locate 15, 70
Print Chr$(188)
Do While InKey$ = ""
Loop
d1 = 10

GoTo main:
READDAYMONTHYEAR:
Restore monthread
For monthdata = 1 To 12
    Read month$(monthdata)
Next monthdata
Return

finalversion:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "Welcome to the Lotto Max 2022 Simulator. This program"
Print "has been written to show you that if you gamble a lot"
Print "of real money recklessly on ANY lottery, you will loose"
Print "BIG TIME. But for those of you who still think that by"
Print "spending a lot of money on ANY lottery, it will allow"
Print "to do just that for free, and will keep track of every"
Print "dollar spent , and every dollar won. This program will"
Print "try to follow the rules exactly so in this case I have "
Print "the payouts equal to the payouts from a $70,000,00 draw."
Print
Print "Here is where I give a disclaimer: This is just a game for"
Print "Entertainment purposes. I understand that I am not using"
Print "any real money in this game, nor will I win any real money"
Print "in this game. Any losses incurred from this program are my"
Print "own resposibility. Not the author of this game or anyone"
Print "Involved in it in any way shape or form."
Print
Print "Even though it is a game , it has been written for the"
Print "problem gambler, I hope I reach someone who needs it."
Print
Print "To continue using this Entertainment Only Game, please "
Print "Press a key to continue..."
Do While InKey$ = ""
Loop
Return
picker:
Print
Cls
If randome$ = "no" Then
    Print ""
    Print "This section will prompt you for 14 numbers of your choosing"
    Print "then create sets of numbers based on your chosen numbers."
    Print ""
ElseIf randome$ = "yes" Then
    Print ""
    Print "This section will pick random numbers for you"
    Print "then create as many sets of numbers as you desire."
    Print
End If
Print
Close #1


money:

Cls
Print
Input "Enter date of draw for your tickets in MM-DD-YYYY format : ", draw2$
If Mid$(draw2$, 3, 1) <> "-" Or Mid$(draw2$, 6, 1) <> "-" Then
    Print "Date Incorrect !!!!!! [Use MM-DD-YYYY format !!!!"
    GoTo money
End If
If realtime$ = "Fun" Then GoTo bypas
If Date$ > draw2$ Then
    Print
    Print "Draw is in the past !!! The system will not allow"
    Print "you to buy any tickets please try again"
    Print
    Print "Press a key to continue ....."
    Print
    Do While InKey$ = ""
    Loop
    counters = counters + 1
    If counters > 3 Then
        counters = 0
        GoTo main
    End If
    GoTo money
End If
bypas:
Open "moneyspent.dat" For Input As #1
Input #1, moneyspent
newbalance = previousbalance - moneyspent
Close #1
preveviousbalance = newbalance

Cls
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "You have  $ "; previousbalance; "dollars to spend."
Print "How many sets of tickets do you wish to buy ? "
Input "[At $5.00 per 3 sets of numbers  ]  : ", sets
If sets = 0 Then GoTo main
If (sets * 5) > previousbalance Then
    Print
    Print "You cannot spend that much, you only have $"; previousbalance; "to spend."
    Print "Try Again !!!!!!!!"
    Do While InKey$ = ""
    Loop
    GoTo bypas
End If
Print
Print "Disclaimer: This program and all of its contents"
Print "            is only for entertainment purposes."
Print
Print "You are not spending any money nor will you win"
Print "any money unless you actually buy a ticket from "
Print "any of the OLG agents. I do not condone any "
Print "any reckless gambling of real money. This is "
Print "just a game and all money won or lost is only"
Print "funny money, not real or negotiable anywhere."
Print
Print "By playing this game you agree that you are not"
Print "Spending or winning real money in any way , shape or form"
Print
Print "Do you agree to all of this before purchasing with funny money"
Print "Enter [Y]es or [N]o"
answer$ = Input$(1)
answer$ = UCase$(answer$)
If answer$ <> "Y" Then GoTo finish
GoSub banker
If randome$ = "N" Then
    Print "Using a : "; qqq; " Wheeling system."
End If
moneytotal = sets * 5
diskcop:
diskcopy$ = "Y"
Cls
Print
Print "Enter your filename for output to disk "
Print "For checking for winners later on"
Print "after the next draw of: "; draw2$
Print
Input "Filename [Without extension : "; file$
If file$ = "" Or file$ = " " Then
    file$ = "lottomax2020"
End If
file$ = file$ + ".da0"
Open file$ For Output As #2
Print #2, draw2$
Print "Filename is : ", file$
If display$ = "Y" Then
    If speed$ = "Readable" Then speed = 7500000
    If (sets * 3) > 100 Then speed = 1
Else
    speed = 10
End If

If randome$ = "yes" Then
    GoTo start
ElseIf randome$ = "no" Then
    GoTo previously
End If
previously:
Input "Do you wish to use a previously saved set of numbers  [Y] or [N] : ", answer$
If answer$ = "y" Or answer$ = "Y" Then
    Open "numbers.dat" For Input As #1
    Do Until EOF(1)
        counter = counter + 1
        Input #1, number
        entry(counter) = number
    Loop
Else
    GoTo entry
End If
Close #1
If counter < qqq Then
    qqq = counter
ElseIf counter > qqq Then
    qqq = counter
End If
GoTo start
pickthedrawnumber:
If randome$ = "yes" Then
    raaa = 35
End If
If randome$ = "no" Then
    raaa = 0
End If
rzzz = Int((qqq + raaa) * Rnd(1) + 1)
temp(y) = rzzz
temp3(rzzz) = temp3(rzzz) + 1
GoSub checkforduplicates

cleararrays:
Erase temp3
Return
getdate:
total = 52
mnth = month
virtualyear = year
'this is repaired     ------------------------------------------------------------------------------------------
d1 = day


For l = 1 To total

    today$ = ""

    Do Until today$ = "Tuesday" Or today$ = "Friday"
        today$ = GETDAYNAME(virtualyear, mnth, d1)
        If today$ = "Tuesday" Then
            nextday = 3
            d1 = d1 + nextday
            d5$ = "Friday"
        ElseIf today$ = "Friday" Then
            nextday = 4
            d1 = d1 + nextday
            d5$ = "Tuesday"
        End If
        d1 = d1 + 1
    Loop
    d1 = d1 - 1
    day0 = GETDAYNR(virtualyear, mnth, d1)
    If ISLEAPYEAR(virtualyear) And day0 > 366 Then virtualyear = virtualyear + 1: day0 = day0 - 366: d1 = d1 - 366
    If ISLEAPYEAR(virtualyear) = 0 And day0 > 365 Then virtualyear = virtualyear + 1: day0 = day0 - 365: d1 = d1 - 365
    realdate$ = GETDATE$(day0, virtualyear)
    day12 = Val(Mid$(realdate$, 9, 2))
    month12 = Val(Mid$(realdate$, 6, 2))
    year12 = Val(Mid$(realdate$, 1, 4))

    If today$ = "Friday" Or today$ = "Tuesday" Then Exit For
Next
'this is repaired     ------------------------------------------------------------------------------------------

Return

checkforduplicates:
If y > 1 Then
    If temp3(rzzz) > 1 Then
        GoSub pick
    End If
End If

Return


banker:


Open "Ispentthismuch.dat" For Append As #1
Print #1, Date$
Print #1, moneytotal
Close #1
Return

entry:

If randome$ = "yes" Then GoTo start
Cls
For zq = 1 To qqq
    1 Print "Entry #"; zq; " ";: Input ":", entry(zq)
    If entry(zq) = 0 Then
        If diskcopy$ = "Y" Then
            Close #2
        End If
        GoTo main
    End If
    If entry(zq) < 1 Or entry(zq) > 50 Then
        Print "Number Out of Range ! , Try Again !!"
        GoTo 1
    End If
    If zq > 1 Then
        For i = 1 To (zq - 1)
            If entry(zq) = entry(i) Then
                Print "Number already entered, pick another!"
                GoTo 1
            End If
        Next i
    End If
Next zq

Print
Cls
Print
Print "You have picked the following numbers: "
Print
For i = 1 To qqq
    Print "Entry # "; i; " "; entry(i)
Next i
Print
Input "Is this all correct [Y]es or [N]o  : ", answer$
If answer$ = "n" Or answer$ = "N" Then GoTo entry
Print
Input "Save Numbers to disk [Y] or [N] : ", answer$
If answer$ = "Y" Or answer$ = "y" Then
    Open "numbers.dat" For Output As #1
    For i = 1 To qqq
        Print #1, entry(i)
    Next i
    Close #1
End If
start:
If hardcopy$ = "Y" Or hardcopy$ = "y" Then
    LPrint
    LPrint "Lotto Max Number List"
    LPrint "---------------------"
    LPrint
End If

For x = 1 To sets
    For zzzr = 1 To 3
        For y = 1 To 7
            GoSub pick
        Next y
        If randome$ = "no" Then
            For i = 1 To 7
                temp(i) = entry(temp(i))
            Next i
        End If
        For i = 1 To 7
            temp2(i) = temp(i)
        Next i
        For j = 1 To 7
            marker = 99
            For i = 1 To 7
                If temp2(i) < marker Then
                    marker = temp2(i)
                    marker2 = i
                End If
            Next i
            temp2(marker2) = 99
            temp(j) = marker
        Next j

        atemp = temp(1): btemp = temp(2): ctemp = temp(3): dtemp = temp(4): etemp = temp(5): ftemp = temp(6): gtemp = temp(7)
        If display$ = "Y" Then
            Print Using "## ## ## ## ## ## ##       "; atemp, btemp, ctemp, dtemp, etemp, ftemp, gtemp
            For aaaa = 1 To speed: Next aaaa
        End If
        atemp = temp(1): btemp = temp(2): ctemp = temp(3): dtemp = temp(4): etemp = temp(5): ftemp = temp(6): gtemp = temp(7)

        Print #2, Using "## ## ## ## ## ## ##       "; atemp, btemp, ctemp, dtemp, etemp, ftemp, gtemp





        If hardcopy$ = "Y" Or hardcopy$ = "y" Then
            LPrint Using "## ## ## ## ## ## ##"; atemp, btemp, ctemp, dtemp, etemp, ftemp, gtemp
        End If


        GoSub cleararrays
    Next zzzr

    If hardcopy$ = "Y" Then
        LPrint ""
    End If
    Print ""
Next x
Close #2
moneytotal = sets * 5
Open "previousbalance.dat" For Output As #1
Print #1, previousbalance
Close #1
GoSub winningsandloosings
If hardcopy$ = "Y" And randome$ = "no" Then
    LPrint
    LPrint "The numbers that you have chosen are as follows: "
    LPrint
    For i = 1 To qqq
        LPrint entry(i); " ";
    Next i
    Print
End If
If hardcopy$ = "Y" Then
    LPrint
    LPrint "Program written by : Russ Campbell"
    LPrint

End If
If display$ = "N" Then
    Close #2
End If
Close #1
Close #2
GoSub moneycheck
GoTo main
moneycheck:
Close #1
Close #2
Open "cash3total.dat" For Input As #1
Input #1, cash3total
Close #1

GoSub winningsandloosings
GoSub banker

Cls

Open "cash3total.dat" For Input As #1
Input #1, oldcash3total
Close #1
If oldcash3total = 0 Then GoTo cash3total
If oldcash3total > moneytotal Then
    oldcash3total = oldcash3total - moneytotal
End If
If oldcash3total < moneytotal Then
    oldcash3total = moneytotal - oldcash3total
End If
If oldcash3total < 0 Then
    oldcash3total = 0
End If
cash3total:
Open "cash3total.dat" For Output As #2
Print #2, oldcash3total + cash3total
Close #2
If zzzzzzab = 1 Then GoSub totalchart1
Return
GoTo main

Cls
pick:
If randome$ = "yes" Then
    raaa = 35
End If
If randome$ = "no" Then
    raaa = 0
End If
rzzz = Int((qqq + raaa) * Rnd(1) + 1)
temp(y) = rzzz
temp3(rzzz) = temp3(rzzz) + 1
GoSub checkforduplicates
Return
fixit:
today$ = GetDay$(month, day, year)
Return
cleararrays2:
Erase temp3
Return
checkforduplicates2:
If y > 1 Then
    If temp3(rzzz) > 1 Then
        GoSub pick
    End If
End If
Return
winningsandloosings:
Cls
Print
Print "You have spent the grand total of $ "; moneytotal
Print "You have won the grand total of $ "; grandtotalcash
Print "You have bought "; sets * 3; "sets of 7 numbers from 1 to 50"
Print
If moneytotal < grandtotalcash Then
    Print "You have Lost : "; moneytotal - grandtotalcash
    Print "But you have won "; cash3total; " In free tickets."
End If
If grandtotalcash > moneytotal Then
    Print "Including free tickets"
    Print "You have gained an extra $ "; grandtotalcash - moneytotal
End If
Print
Print "Press any key to continue..."
Do While InKey$ = ""
Loop
Return

main:
If crs$ = "Y" Then Color 1, 7
Cls
If crs$ = "Y" Then Color 3, 8
Locate 4, 7
Print Chr$(201)
For i = 8 To 73
    Locate 4, i
    Print Chr$(205)
Next i
Locate 4, 74
Print Chr$(187)
For i = 5 To 13
    Locate i, 7
    If i = 6 Or i = 11 Or i = 13 Then
        Print Chr$(204)
    Else
        Print Chr$(186)
    End If
    Locate i, 74
    If i = 6 Or i = 11 Or i = 13 Then
        Print Chr$(185)
    Else
        Print Chr$(186)
    End If
Next i
For i = 8 To 73
    Locate 6, i
    Print Chr$(205)
Next i
For i = 8 To 73
    Locate 11, i
    Print Chr$(205)
Next i
For i = 8 To 73
    Locate 13, i
    Print Chr$(205)
Next i
Locate 14, 7
Print Chr$(186)
Locate 14, 74
Print Chr$(186)
Locate 15, 7
Print Chr$(200)
For i = 8 To 73
    Locate 15, i
    Print Chr$(205)
Next i
Locate 15, 74
Print Chr$(188)
If crs$ = "Y" Then Color 15, 3
Locate 14, 8
Print "                                                                  "
Locate 14, 8
GoSub getdate
Print Using "  Winning Numbers Database Updated On : \     \   \  \  ##  #### "; today$; month$(month); day; year

If crs$ = "Y" Then Color 10, 5
Locate 5, 8
Print "        Lotto Max Simulator RC 2022 Version 2022  Main Menu       "
If crs$ = "Y" Then Color 4, 7
For i = 7 To 10
    Locate i, 13
    Print "["
    Locate i, 15
    Print "]"
    Locate i, 42
    Print "["
    Locate i, 44
    Print "]"
Next i
If crs$ = "Y" Then Color 0, 7
Locate 7, 14
Print "A"
Locate 7, 43
Print "B"
Locate 8, 14
Print "C"
Locate 8, 43
Print "D"
Locate 9, 14
Print "E"
Locate 9, 43
Print "F"
Locate 10, 14
Print "G"
Locate 10, 43
Print "H"
If crs$ = "Y" Then Color 1, 7
Locate 7, 18
Print "Enter Winning Numbers"
Locate 8, 18
Print "Use"; qqq; "Number System"
Locate 9, 18
Print "About this program"
Locate 10, 18
Print "Special Date Bargraphs"
Locate 7, 47
Print "Search and Print Menus"
Locate 8, 47
Print "Pick random Numbers"
Locate 9, 47
Print "Bargraph Menu"
Locate 10, 47
Print "Frequency Calculator"
If crs$ = "Y" Then Color 4, 7
Locate 12, 31
Print "["
Locate 12, 33
Print "]"
Locate 12, 42
Print "Escape Key Exits Program"
If crs$ = "Y" Then Color 1, 7
Locate 12, 13
Print "Your choice is : "
main2:
Locate 12, 32
answer$ = Input$(1)
Print answer$
If answer$ = Chr$(27) Then
    finish$ = "Y"
    GoSub lottomaxsimulator
    GoTo finish
ElseIf answer$ = "A" Or answer$ = "a" Then
    GoTo enterwinningnumbers
ElseIf answer$ = "B" Or answer$ = "b" Then
    GoTo searchmenu
ElseIf answer$ = "C" Or answer$ = "c" Then
    zzzzzzab = 1
    randome$ = "no"
    GoTo picker
ElseIf answer$ = "D" Or answer$ = "d" Then
    zzzzzzab = 1
    randome$ = "yes"
    GoTo picker
ElseIf answer$ = "E" Or answer$ = "e" Then
    GoSub aboutthisprogram
ElseIf answer$ = "F" Or answer$ = "f" Then
    spec$ = "N"
    GoTo bargraph
ElseIf answer$ = "G" Or answer$ = "g" Then
    spec$ = "Y"
    GoTo enquiremonth
ElseIf answer$ = "H" Or answer$ = "h" Then
    GoTo chart2
ElseIf answer$ = "+" Then
    GoTo writeitout
ElseIf answer$ = "%" Then
    Cls
    Input "Enter Password: ", pass2$
    owner$ = "Russ Campbell"
    registered$ = reg$
    distribute$ = "QB64.ORG"
    serial$ = reg2$
    version$ = "2022 RC 2022"
    release$ = "May 16 2021 - 12:01 AM"
    pass$ = "Password"
    If pass2$ = pass$ Then
        Cls
        Print
        Print "Program Written by : "; owner$
        Print "Registered to      : "; registered$
        Print "Distributed by     : "; distribute$
        Print "Serial #           : "; serial$
        Print "Version #          : "; version$
        Print "Release date       : "; release$
        Print
        Print "Press any key to continue ... "
        Do While InKey$ = ""
        Loop
    End If
    GoTo main
End If
count = -1
GoTo main
chart:
Cls
Print "Number Pattern"
Print "--------------"
Print
Print "This sections displays the number pattern for winning #s that have"
Print "been entered. The amount of times each number has been picked is "
Print "displayed as in the chart below."
Print
If bonus$ = "Y" Then
    title2$ = "With Bonus Numbers"
ElseIf bonus$ = "N" Then
    title2$ = "Without Bonus Numbers"
End If
For j = 1 To 50
    outpt(j) = 0
    outpt1(j) = 0
    outpt2(j) = 0
Next j
For j = 1 To 50
    outpt(j) = numb(j)
Next j

total = 0
average = 0
high = 90
low = 85
If bonus$ = "Y" Then
    title3$ = "With Bonus Numbers  - All Numbers Drawn to Date"
ElseIf bonus$ = "Y" Then
    title3$ = "Without Bonus Numbers - All numbers Drawn to Date"
End If

Print
Print "Number Chart "; title2$
Print
For j = 1 To 10
    Print Using "Num ## : ###"; j; outpt(j);
    Print Using "  Num ## : ###"; j + 10; outpt(j + 10);
    Print Using "  Num ## : ###"; j + 20; outpt(j + 20);
    Print Using "  Num ## : ###"; j + 30; outpt(j + 30);
    Print Using "  Num ## : ###"; j + 40; outpt(j + 40)
Next j
Print: Print "Press any key to continue"
Do While InKey$ = ""
Loop

chart4:

Cls
Print "Low Number Pattern"
Print "------------------"
Print ""
Print "This section displays all of the low numbers that have been"
Print "been entered. The amount of times each number has been picked is "
Print "displayed as in the chart below. Note that if the number is"
Print "not in the low area then it will display a zero for that number."
Print
If bonus$ = "Y" Then
    title3$ = "With Bonus Numbers - only numbers that are low"
ElseIf bonus$ = "N" Then
    title3$ = "Without Bonus Numbers - only numbers that are low"
End If
For j = 1 To 50
    If bonus$ = "Y" And numb(j) < low Then
        outpt1(j) = numb(j) + bonus(j)
    ElseIf bonus$ = "N" And numb(j) < low Then
        outpt1(j) = numb(j)
    End If
Next j
Print
Print "Number Chart "; title3$
Print
For j = 1 To 10
    Print Using "Num ## : ###"; j; outpt1(j);
    Print Using "  Num ## : ###"; j + 10; outpt1(j + 10);
    Print Using "  Num ## : ###"; j + 20; outpt1(j + 20);
    Print Using "  Num ## : ###"; j + 30; outpt1(j + 30);
    Print Using "  Num ## : ###"; j + 40; outpt1(j + 40)
Next j
Do While InKey$ = ""
Loop

chart5:
Cls
Print "High Number Pattern"
Print "------------------"
Print ""
Print "This section displays all of the high numbers that have been"
Print "been entered. The amount of times each number has been picked is "
Print "displayed as in the chart below. Note that if the number is not"
Print "in the high area then it will display a zero for that number."
Print
If bonus$ = "Y" Then
    title4$ = "With Bonus Numbers - only numbers that are high"
ElseIf bonus$ = "N" Then
    title4$ = "Without Bonus Numbers - only numbers that are high"
End If
For j = 1 To 50
    If bonus$ = "Y" And numb(j) > high Then
        outpt2(j) = numb(j) + bonus(j)
    ElseIf bonus$ = "N" And numb(j) > high Then
        outpt2(j) = numb(j)
    End If
Next j
Print
Print "Number Chart "; title4$
Print
For j = 1 To 10
    Print Using "Num ## : ###"; j; outpt2(j);
    Print Using "  Num ## : ###"; j + 10; outpt2(j + 10);
    Print Using "  Num ## : ###"; j + 20; outpt2(j + 20);
    Print Using "  Num ## : ###"; j + 30; outpt2(j + 30);
    Print Using "  Num ## : ###"; j + 40; outpt2(j + 40)
Next j
If hardcopy$ = "Y" Then
    LPrint
    LPrint "Number Chart "; title2$
    LPrint
    LPrint
    For j = 1 To 10
        LPrint Using "Num ## : ###"; j; outpt(j);
        LPrint Using "  Num ## : ###"; j + 10; outpt(j + 10);
        LPrint Using "  Num ## : ###"; j + 20; outpt(j + 20);
        LPrint Using "  Num ## : ###"; j + 30; outpt(j + 30);
        LPrint Using "  Num ## : ###"; j + 40; outpt(j + 40)
    Next j
    LPrint
    LPrint
    LPrint "Number Chart "; title3$
    LPrint
    LPrint
    For j = 1 To 10
        LPrint Using "Num ## : ###"; j; outpt1(j);
        LPrint Using "  Num ## : ###"; j + 10; outpt1(j + 10);
        LPrint Using "  Num ## : ###"; j + 20; outpt1(j + 20);
        LPrint Using "  Num ## : ###"; j + 30; outpt1(j + 30);
        LPrint Using "  Num ## : ###"; j + 40; outpt1(j + 40)
    Next j
    LPrint
    LPrint
    LPrint "Number Chart "; title4$
    LPrint
    LPrint
    For j = 1 To 10
        LPrint Using "Num ## : ###"; j; outpt2(j)
        LPrint Using "  Num ## : ###"; j + 10; outpt2(j + 10);
        LPrint Using "  Num ## : ###"; j + 20; outpt2(j + 20);
        LPrint Using "  Num ## : ###"; j + 30; outpt2(j + 30);
        LPrint Using "  Num ## : ###"; j + 40; outpt2(j + 40)
    Next j
    LPrint
End If
Print: Print "Press any key to continue"
Do While InKey$ = ""
Loop
GoTo graphmenu
writeitout:
Cls
Open "nextday.dat" For Output As #1
Input "Enter Value of X1: ", x1
Print #1, x1
Close #1
GoTo main
totalchart1:
Open "cash3total.dat" For Input As #1
Input #1, cash3total
Close #1
Open "previousbalance.dat" For Input As #1
Input #1, previousbalance

Close #1
Open "moneyspent.dat" For Output As #1
Print #1, moneytotal + oldcash3total
Close #1
Print "|--------------- ----|------------------------------|-------------------------|"
Print "|  Previous Balance  |   Tickets Won on Last Draw   |   Cost of Tickets Total |"
Print "|--------------------|------------------------------|-------------------------|"
pt$ = "|  $ #,###,###,###   |            ###,###           |      $ #,###,###,###    |"
Print Using pt$; previousbalance; payout3; moneytotal
Print "|--------------------|------------------------------|-------------------------|"
newbalance = previousbalance - moneytotal + cash3total
previousbalance = newbalance
moneytotal = 0
Print "|--------------------------------|----------------|"
Print "|  Free Tickets Total Value      |   New Balance  |"
Print "|--------------------------------|----------------|"
pt2$ = "|     $ #,###,###,###            | $ #,###,###,###|"
Print Using pt2$; cash3total; newbalance
Print "|--------------------------------|----------------|"

Open "previousbalance.dat" For Output As #1
Print #1, previousbalance
Close #1

Print

Print
Print "Press any key to continue...."
Do While InKey$ = ""
Loop
zzzzzzab = 0
Return
totalchart2:
Open "previousbalance.dat" For Input As #1
Input #1, previousbalance
Close #1
Open "cash3total.dat" For Input As #1
Input #1, cash3total

Close #1

Print
Print "|----------------|---------------|"
Print "|Previous Balance|    Winnings   |"
Print "|----------------|---------------|"
pt$ = "|$ #,###,###,### |$ #,###,###,###|"
Print Using pt$; previousbalance; grandtotalcash
Print "|----------------|---------------|"
Print
Print "|---------------------------------|---------------|"
Print "|  Free Tickets Towards Next Draw |   New Balance |"
Print "|---------------------------------|---------------|"
pt2$ = "|        $ #,###,###,###          |$ #,###,###,###|"
newbalance = previousbalance + grandtotalcash
Print Using pt2$; cash3total; newbalance
Print "|---------------------------------|---------------|"



Open "cash3total.dat" For Output As #1
Print #1, cash3total
Close #1
Print

Open "previousbalance.dat" For Output As #1
Print #1, newbalance

Close #1

zzzz = 0
Print
Do While InKey$ = ""
Loop
zzzzzzab = 0
Return

enquiremonth:
Cls
Print
Print "View Graphs from specified date"
Print
Input "Enter Year to start from  : ", yearin
If yearin < 2009 Then
    yearin = 2009
End If
Input "Enter Month to start from : ", monthin
Input "Enter Year to finish at   : ", yearend
If yearend < 2009 Then
    yearend = 2009
End If
Input "Enter Month to finish at  : ", monthend
bargraph:
For i = 1 To 50
    numb(i) = 0
    bonus(i) = 0
    outpt(i) = 0
Next i
GoSub convert
viewpoint$ = ""
graphmenu:
If crs$ = "Y" Then Color 1, 7
Cls
If crs$ = "Y" Then Color 3, 8
Locate 2, 6
Print Chr$(201)
For i = 7 To 73
    Locate 2, i
    Print Chr$(205)
Next i
Locate 2, 74
Print Chr$(187)
For i = 3 To 21
    Locate i, 6
    If i = 4 Or i = 7 Or i = 12 Or i = 14 Or i = 20 Then
        Print Chr$(204)
    Else
        Print Chr$(186)
    End If
    Locate i, 74
    If i = 4 Or i = 7 Or i = 12 Or i = 14 Or i = 20 Then
        Print Chr$(185)
    Else
        Print Chr$(186)
    End If
Next i
Locate 22, 6
Print Chr$(200)
Locate 22, 74
Print Chr$(188)
For i = 7 To 73
    Locate 22, i
    Print Chr$(205)
Next i
For i = 7 To 73
    Locate 7, i
    Print Chr$(205)
Next i
For i = 7 To 73
    Locate 12, i
    Print Chr$(205)
Next i
For i = 7 To 73
    Locate 20, i
    Print Chr$(205)
Next i
For i = 7 To 73
    Locate 14, i
    Print Chr$(205)
Next i
For i = 7 To 73
    Locate 4, i
    Print Chr$(205)
Next i
Locate 4, 37
Print Chr$(203)
Locate 5, 37
Print Chr$(186)
Locate 6, 37
Print Chr$(186)
Locate 7, 37
Print Chr$(206)
Locate 8, 37
Print Chr$(186)
Locate 9, 37
Print Chr$(186)
Locate 10, 37
Print Chr$(186)
Locate 11, 37
Print Chr$(186)
Locate 12, 37
Print Chr$(202)
If crs$ = "Y" Then Color 4, 7
For i = 8 To 11
    Locate i, 12
    Print "["
    If crs$ = "Y" Then Color 0, 7
    Locate i, 13
    Print Chr$(57 + i)
    If crs$ = "Y" Then Color 4, 7
    Locate i, 14
    Print "]"
Next i
For i = 8 To 11
    Locate i, 42
    Print "["
    If crs$ = "Y" Then Color 0, 7
    Locate i, 43
    Print Chr$(61 + i)
    If crs$ = "Y" Then Color 4, 7
    Locate i, 44
    Print "]"
Next i
For i = 15 To 19
    Locate i, 20
    Print "["
    If crs$ = "Y" Then Color 0, 7
    Locate i, 21
    Print Chr$(58 + i)
    If crs$ = "Y" Then Color 4, 7
    Locate i, 22
    Print "]"
Next i
If crs$ = "Y" Then Color 10, 5
Locate 3, 7
Print "     Lotto Max Simulator RC 2022 Version 2022 Barchart Menu        "
Locate 13, 7
Print "                     Other Options Available                       "
Locate 5, 7
If crs$ = "Y" Then Color 15, 3
Print "         Barcharts            "
Locate 6, 7
Print "     With Bonus Numbers       "
Locate 5, 38
Print "         Barcharts                  "
Locate 6, 38
Print "    Without Bonus Numbers           "
If crs$ = "Y" Then Color 4, 7
Locate 21, 38
Print "["
Locate 21, 40
Print "]"
If crs$ = "Y" Then Color 1, 7
Locate 8, 17
Print "Low Numbers"
Locate 8, 47
Print "Low Numbers"
Locate 9, 17
Print "Average Numbers"
Locate 9, 47
Print "Average Numbers"
Locate 10, 17
Print "High Numbers"
Locate 10, 47
Print "High Numbers"
Locate 11, 17
Print "All Numbers"
Locate 11, 47
Print "All Numbers"
Locate 15, 25
Print "View Bonus Number Barchart"
Locate 16, 25
Print "View Normal Charts (No Bonus Numbers)"
Locate 17, 25
Print "View Normal Charts (With Bonus Numbers)"
Locate 18, 25
Print "Change any features of this program ....."
Locate 19, 25
Print "Return To Main Menu"
Locate 21, 20
Print "Your Choice Is : "
Locate 21, 39
answer$ = ""
answer$ = Input$(1)
Print answer$
If answer$ = "" Or answer$ = Chr$(27) Then
    spec$ = "N"
    GoTo main
ElseIf answer$ = "a" Or answer$ = "A" Then
    viewpoint$ = "low"
    bonus$ = "Y"
    GoTo start3
ElseIf answer$ = "b" Or answer$ = "B" Then
    viewpoint$ = "average"
    bonus$ = "Y"
    GoTo start3
ElseIf answer$ = "c" Or answer$ = "C" Then
    viewpoint$ = "high"
    bonus$ = "Y"
    GoTo start3
ElseIf answer$ = "d" Or answer$ = "D" Then
    viewpoint$ = "all"
    bonus$ = "Y"
    GoTo start3
ElseIf answer$ = "e" Or answer$ = "E" Then
    viewpoint$ = "low"
    bonus$ = "N"
    GoTo start3
ElseIf answer$ = "f" Or answer$ = "F" Then
    viewpoint$ = "average"
    bonus$ = "N"
    GoTo start3
ElseIf answer$ = "g" Or answer$ = "G" Then
    viewpoint$ = "high"
    bonus$ = "N"
    GoTo start3
ElseIf answer$ = "h" Or answer$ = "H" Then
    viewpoint$ = "all"
    bonus$ = "N"
    GoTo start3
ElseIf answer$ = "i" Or answer$ = "I" Then
    viewpoint$ = "all"
    bonus$ = "Y"
    normal$ = "N"
    GoTo start3
ElseIf answer$ = "j" Or answer$ = "J" Then
    bonus$ = "N"
    GoSub start2

    GoTo chart
ElseIf answer$ = "k" Or answer$ = "K" Then
    bonus$ = "Y"
    GoSub start2:
    GoTo chart
ElseIf answer$ = "l" Or answer$ = "L" Then
    Chain "setup"
ElseIf answer$ = "m" Or answer$ = "M" Or answer$ = "" Then
    spec$ = "no"
    GoTo main
End If
GoTo graphmenu
choice:
Return
Print
Print
start2:
If bonus$ = "N" Then
    For i = 1 To 50
        outpt(i) = 0
    Next i
    For i = 1 To 50
        outpt(i) = numb(i)
    Next i
    low = 95: high = 105
    For i = 1 To 50
        If numb(i) < 15 Then
            low = numb(i)
        End If
        If numb(i) > 95 Then
            high = numb(i)
        End If
    Next i
    spread = 5

ElseIf bonus$ = "Y" And normal$ = "" Then
    For i = 1 To 50
        outpt(i) = 0
    Next i
    For i = 1 To 50
        outpt(i) = numb(i) + bonus(i)
    Next i
    low = 95: high = 105
    For i = 1 To 50
        If outpt(i) < 15 Then
            low = outpt(i)
        End If
        If outpt(i) > 95 Then
            high = outpt(i)
        End If
    Next i
    spread = 5
ElseIf bonus$ = "Y" And normal$ = "N" Then
    For i = 1 To 50
        outpt(i) = 0
    Next i
    For i = 1 To 50
        outpt(i) = bonus(i)
    Next i
End If

Return
start3:
If bonus$ = "N" Then
    For i = 1 To 50
        outpt(i) = 0
    Next i
    For i = 1 To 50
        outpt(i) = numb(i)
    Next i
    low = 95: high = 105
    For i = 1 To 50
        If numb(i) < 15 Then
            low = numb(i)

        End If
        If numb(i) > 95 Then
            high = numb(i)

        End If
    Next i
    spread = 5

ElseIf bonus$ = "Y" And normal$ = "" Then
    For i = 1 To 50
        outpt(i) = 0
    Next i
    For i = 1 To 50
        outpt(i) = numb(i) + bonus(i)
    Next i
    low = 95: high = 105
    For i = 1 To 50
        If outpt(i) < 15 Then
            low = outpt(i)

        End If
        If outpt(i) > 95 Then
            high = outpt(i)
        End If
    Next i
    spread = 5
ElseIf bonus$ = "Y" And normal$ = "N" Then
    For i = 1 To 50
        outpt(i) = 0
    Next i
    For i = 1 To 50
        outpt(i) = bonus(i)
    Next i
End If
If grtype = 0 Then
    Cls
    GoSub asciidisplay
    GoTo graphmenu
End If

Screen smode
Cls
If smode = 12 Then
    Palette 2, 12
End If
counter = 96
If grmode$ = "HDMI" Then
    counter = 96
End If

For i = 1 To 50
    cl = cl + 1: If cl > 12 Then cl = 1
    If cl = 2 Then cl = 8
    length = outpt(i) * barl
    If viewpoint$ = "low" Then
        title$ = " Numbers Least Drawn"
        If outpt(i) > low Then
            length = 4
        End If
    ElseIf viewpoint$ = "average" Then
        title$ = " Numbers Average Drawn"
        If outpt(i) < low Or outpt(i) > high Then
            length = 4
        End If
    ElseIf viewpoint$ = "high" Then
        title$ = " Numbers Most Drawn"
        If outpt(i) < high Then
            length = 4
        End If
    ElseIf viewpoint$ = "all" Then
        title$ = " All Numbers Drawn"
        length = outpt(i) * barl
    End If
    If bonus$ = "Y" And normal$ = "" Then
        title2$ = "   With Bonus Numbers"
    ElseIf bonus$ = "N" And normal$ = "" Then
        title2$ = "   Without Bonus Numbers"
    ElseIf bonus$ = "Y" And normal$ = "N" Then
        title2$ = "   Just Bonus Numbers"
    End If
    Line (counter, wl)-(counter, wl - length), cl
    Line (counter + 1, wl)-(counter + 1, wl - length), cl
    Line (counter + 2, wl)-(counter + 2, wl - length), cl
    Line (counter + 3, wl)-(counter + 3, wl - length), cl
    Line (counter + 4, wl)-(counter + 4, wl - length), cl
    Line (counter + 5, wl)-(counter + 5, wl - length), cl
    Line (counter + 5, wl)-(counter + 5, wl - length), cl
    If grmode$ = "Herc" Then
        Line (counter + 6, wl)-(counter + 6, wl - length), cl
    End If
    If grmode$ = "herc" Then
        counter = counter + 9
    Else
        counter = counter + 8
    End If
Next i
Print
Locate 3, 4
Print "Frequency Distribution Chart  " + title$ + title2$
Locate 4, 4
Print "Covering the period from  "; month$(monthin); yearin; " to  "; month$(m); y
If grmode$ = "vga" Then
    Locate 27, 13
    Print "00000000011111111112222222222333333333344444444445"
    Locate 28, 13
    Print "12345678901234567890123456789012345678901234567890"
ElseIf grmode$ = "ega" Then
    Locate 21, 13
    Print "00000000011111111112222222222333333333344444444440"
    Locate 22, 13
    Print "12345678901234567890123456789012345678901234567890"
ElseIf grmode$ = "cga" Then
    Locate 20, 13
    Print "00000000011111111112222222222333333333344444444445"
    Locate 21, 13
    Print "12345678901234567890123456789012345678901234567890"
ElseIf grmode$ = "HDMI" Then
    Locate 27, 13
    Print "00000000011111111112222222222333333333344444444445"
    Locate 28, 13
    Print "12345678901234567890123456789012345678901234567890"

End If
Locate 7 - offset, 7
Print "200"
Locate 7 - offset, 63
Print "200"
Locate 10 - offset, 7
Print "150"
Locate 10 - offset, 63
Print "150"
Locate 15 - offset, 7
Print "100"
Locate 15 - offset, 63
Print "100"
Locate 20 - offset, 7
Print "50"
Locate 20 - offset, 63
Print "50"
Locate 25 - offset, 7
Print "0"
Locate 25 - offset, 63
Print "0"
If grmode$ = "vga" Then
    Locate 29, 20
ElseIf grmode$ = "HDMI" Then
    Locate 29, 20
End If
Print "Press any key to continue ...."
Do While InKey$ = ""
Loop
viewpoint$ = "": normal$ = "": bonus$ = ""
Screen 0
GoTo graphmenu

graphit:
_FullScreen _Stretch
For i = 1 To 50
    cl = cl + 1: If cl > 12 Then cl = 1
    If cl = 2 Then cl = 8
    length = outpt(i) * barl
    If viewpoint$ = "low" Then
        title$ = " Numbers Least Drawn"
        If outpt(i) > low Then
            length = 4
        End If
    ElseIf viewpoint$ = "average" Then
        title$ = " Numbers Average Drawn"
        If outpt(i) < low Or outpt(i) > high Then
            length = 4
        End If
    ElseIf viewpoint$ = "high" Then
        title$ = " Numbers Most Drawn"
        If outpt(i) < high Then
            length = 4
        End If
    ElseIf viewpoint$ = "all" Then
        title$ = " All Numbers Drawn"
        length = outpt(i) * barl
    End If
    searchmenu:
    Cls
    If crs$ = "Y" Then Color 3, 8
    Locate 3, 10
    Print Chr$(201)
    For i = 11 To 68
        Locate 3, i
        Print Chr$(205)
    Next i
    Locate 3, 69
    Print Chr$(187)
    For i = 4 To 12
        Locate i, 10
        If i = 5 Or i = 11 Then
            Print Chr$(204)
        Else
            Print Chr$(186)
        End If
        Locate i, 69
        If i = 5 Or i = 11 Then
            Print Chr$(185)
        Else
            Print Chr$(186)
        End If
    Next i
    For i = 11 To 68
        Locate 5, i
        Print Chr$(205)
    Next i
    For i = 11 To 68
        Locate 11, i
        Print Chr$(205)
    Next i
    For i = 11 To 68
        Locate 13, i
        Print Chr$(205)
    Next i
    Locate 13, 10
    Print Chr$(200)
    Locate 13, 69
    Print Chr$(188)
    If crs$ = "Y" Then Color 10, 5
    Locate 4, 11
    Print "Lotto Max Simulator RC 2022 Ver. 2022 Search & Print Menu "
    If crs$ = "Y" Then Color 4, 7
    For i = 6 To 10
        Locate i, 17
        Print "["
        Locate i, 19
        Print "]"
    Next i
    If crs$ = "Y" Then Color 0, 7
    For i = 6 To 10
        Locate i, 18
        Print Chr$(59 + i)
    Next i
    If crs$ = "Y" Then Color 1, 7
    Locate 6, 22
    Print "Search For Winning Numbers By Date"
    Locate 7, 22
    Print "Print Out List of Winning Numbers"
    Locate 8, 22
    Print "Check List of Numbers for Winners"
    Locate 9, 22
    Print "Scan Database for a series of Numbers"
    Locate 10, 22
    Print "Print lists from Frequency Calculator"
    Locate 12, 17
    Print "Your Choice Is: "
    Locate 12, 33
    answer$ = Input$(1)
    Print answer$
    If answer$ = "a" Or answer$ = "A" Then
        GoTo search
    ElseIf answer$ = "b" Or answer$ = "B" Then
        GoTo printmenu
    ElseIf answer$ = "c" Or answer$ = "C" Then
        zzzzzzzab = 2
        GoTo checknumbers
    ElseIf answer$ = "d" Or answer$ = "D" Then
        GoTo specialcheck
    ElseIf answer$ = "e" Or answer$ = "E" Then
        GoTo freqprint
    Else
        GoTo main
    End If
Next i
GoTo main
freqprint:
Open "next.txt" For Input As #1
Do Until EOF(1)
    Input #1, a$
    Print a$
Loop
Close #1

Open "freq.txt" For Input As #1
Do Until EOF(1)
    Input #1, a$
    Print a$
Loop
Close #1
GoTo main

GoTo graphmenu
GoTo main

Open "Lottomax.dat" For Input As #1
checkforwinners:
zaaa = entry2(1): zbbb = entry2(2): zccc = entry2(3): zddd = entry(4): zeee = entry2(5): zfff = entry2(6): zggg = entry2(7)
Print "Press any key to start search ...."
Do While InKey$ = ""
Loop
Cls
Print
Print "Searching , please stand bye ............."
Print
Do Until EOF(1)
    For i = 1 To 8
        If entry(i) = entry2(j) Then
            match = match + 1
        End If
        If entry(i) = entry2(j) And match = 6 Then
            match = match + 1
        End If
    Next i

    counter = 0
    If match > 2 Then
        Print "Match for : ";
        Print Using "\    \"; month$(chart(i, 1));
        Print Using "## ## ## ## ## ## ## ##"; entry(1); entry(2); entry(3); entry(4); entry(5); enntry(6); entry(7); entry(8)
        Print "  > "; match; " Correct."
        If hardcopy$ = "Y" Then
            LPrint "Match for : ";
            LPrint Using "\    \"; month$(chart(i, 1));
            LPrint Using "## #### ## ## ## ## ## ## ## ##"; chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10); chart(i, 11);
            LPrint "  > "; match; " Correct."
        End If

    End If
Loop

If match > 2 Then

    found = found + 1
End If
match = 0
sczzz:

If found = 0 Then

    Print
    Print "No Match found for your numbers."
    Print
    Print "Your numbers were : ";
    If hardcopy$ = "Y" Then
        LPrint "Your Numbers were : ";
        For i = 1 To 7
            If entry(i) = 0 Then GoTo nopr1
            LPrint entry(i);
        Next i
        nopr1:
        LPrint
    Else
        Print "Your Numbers were : ";
        For i = 1 To 7
            If entry(i) = 0 Then GoTo nopr3
            Print entry(i);
        Next i
    End If
End If
nopr3:
Print
Print found; " Matches found for your numbers."
Print
Print "Your numbers were : ";
For i = 1 To 7
    If entry(i) = 0 Then
        GoTo nopr2
    End If
    Print entry(i);
Next i
nopr2:
Print

If hardcopy$ = "Y" Then
    LPrint
    LPrint "Program written by : Russ Campbell."
    LPrint
End If
Print "Program written by: Russ Campbell."
found = 0
Print
Print "Press any key to continue ..."

Do While InKey$ = ""
Loop
found = 0
GoTo main

specialcheck:
bypass$ = ""
Cls
Print "This section checks for patterns in winning numbers. You can choose"
Print "to search either the last 3 months of the database, or the whole "
Print "database for any sets of numbers that you input."
Print
Print "Any matches will be printed out as the program runs ...."
Print
Input "Do you wish to load numbers from a saved file [ Enter defaults to Yes ]: ", saved$
If saved$ = "" Then
    saved$ = "Y"
End If
If saved$ = "n" Or saved$ = "N" Then
    saved$ = "N"
    GoTo search2
End If
filename:
Input "Enter filename [without extension] [Enter Defaults to Demo File] : ", file$
If file$ = "numbers2" Then
    Print
    Print "Incorrect filename !"
    Print
    Print "Press any key to continue ...."
    Do While InKey$ = ""
    Loop
    GoTo filename
ElseIf file$ = "grmode" Then
    Print
    Print "Incorrect filename !"
    Print
    Print "Press any key to continue ...."
    Do While InKey$ = ""
    Loop
    GoTo filename
ElseIf file$ = "" Then
    file$ = "numbers"
    Print "Loading Demo File"
End If
Print
file$ = file$ + ".dat"
Print #1, file$
If saved$ = "N" Then GoTo savednumbers
If saved$ = "Y" Or saved$ = "y" Then
    saved$ = "Y"
    Open file$ For Input As #1
    Do Until EOF(1)
        Input #1, entry(zqa)
        zqa = zqa + 1
    Loop
End If
Close #1
search2:
Print "Search [L]ast 3 months data or [E]ntire list of data "
Print
Input "[L] or [E] <return defaults to [L] > : ", answer$
If answer$ = "e" Or answer$ = "E" Then
    bypass$ = "Y"
    GoTo bypass
End If
If month > 3 Then
    firstmonth = month - 3
    lastmonth = month
    firstyear = year
    lastyear = year
ElseIf month < 4 Then
    firstyear = year - 1
    lastyear = year
    monthadj = monthadj + 12
    firstmonth = monthadj - 3
    lastmonth = month
End If
bypass:
If saved$ = "Y" Then GoTo savednumbers
savednumbers:
If saved$ = "Y" Or saved$ = "y" Then GoTo sc
Input "Do you wish to save the following numbers to disk : ", numsave$
If numsave$ = "Y" Or numsave$ = "y" Then
    numsave$ = "Y"
End If
filename2:
Input "Enter filename [without extension] [Enter Defaults to Demo File]: ", file$

If file$ = "numbers2" Then
    Print "Incorrect filename !"
    Print
    Print "Press any key to continue ...."
    Do While InKey$ = ""
    Loop
    GoTo filename2
ElseIf file$ = "grmode" Then
    Print
    Print "Incorrect filename !"
    Print
    Print "Press any key to continue ...."
    Do While InKey$ = ""
    Loop
ElseIf file$ = "" Then
    file$ = "numbers.dat"
End If

Print file$
Open file$ For Output As #1


If numsave$ = "N" Then GoTo sc
zzzzza:
za = 0: zb = 0: zc = 0: zd = 0: ze = 0: zf = 0: zg = 0
Input "How many Numbers [Maximum 7]: ", numbrs
If numbrs > 7 Then Print "Too Many Numbers !": GoTo zzzzza
For zqa = 1 To numbrs
    rd2:
    If saved$ = "Y" Then
        GoTo szc
    End If
    Print "Entry #"; zqa; " ";: Input ":", entry(zqa)
    If entry(zqa) < 1 Or entry(zqa) > 50 Then Print "Number Out of Range ! , Try Again !!": GoTo rd2
    If zqa > 1 Then
        For i = 1 To (zqa - 1)
            If entry(zqa) = entry(i) Then Print "Number already entered, pick another": GoTo rd2
        Next i
    End If
    If numsave$ = "Y" Then
        Print #1, entry(zqa)
    End If
Next zqa
Close #1

sc:
szc:
za = entry(1): zb = entry(2): zc = entry(3): zd = entry(4): ze = entry(5): zf = entry(6): zg = entry(7)
Print "Press any key to start search ...."
Do While InKey$ = ""
Loop
Cls
Print
Print "Searching , please stand bye ............."
Print
For i = 1 To linecounter
    If bypass$ = "Y" Then
        GoTo bypass20
    End If
    If chart(i, 3) < firstyear Then GoTo sczzz
    If chart(i, 1) < firstmonth And chart(i, 3) = firstyear Then GoTo sczzz
    bypass20:
    For j = 4 To 11
        If za = chart(i, j) Or zb = chart(i, j) Or zc = chart(i, j) Or zd = chart(i, j) Or ze = chart(i, j) Or jf = chart(i, j) Or zg = chart(i, j) Then
            match = match + 1
        End If
        If zh = chart(i, j) And match = 7 Then
            match = match + 1
        End If
    Next j
Next i

If match > 2 Then
    Print "Match for : ";
    Print Using "\    \"; month$(chart(i, 1));
    Print Using "## #### ## ## ## ## ## ## ## ##"; chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10); chart(i, 11);
    Print "  > "; match; " Correct."
    If hardcopy$ = "Y" Then
        LPrint "Match for : ";
        LPrint Using "\    \"; month$(chart(i, 1));
        LPrint Using "## #### ## ## ## ## ## ## ## ##"; chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10); chart(i, 11);
        LPrint "  > "; match; " Correct."
    End If

End If
If match > 2 Then
    found = found + 1
End If
match = 0
GoTo main
checknumbers:
Cls
Print
Print "Winning Number Check"
Print
Print "This section of the program will take a file that you have written"
Print "out from option C or D and check to see if you have any winning "
Print "numbers in the file."
Print
Print

GoTo filemenu
start50:
Screen 0
getnumbers:
Input #1, drawdate$

yearinp = Val(Mid$(drawdate$, 7, 4))
monthinp = Val(Mid$(drawdate$, 1, 2))
dayinp = Val(Mid$(drawdate$, 4, 2))
Print yearinp; " ";
Print monthinp; " ";
Print dayinp; " ";

For i = 2 To linecounter
    If chart(i, 3) <> yearinp Then
        GoTo nextitem2
    ElseIf chart(i, 1) <> monthinp Then
        GoTo nextitem2
    ElseIf chart(i, 2) <> dayinp Then
        GoTo nextitem2
    ElseIf chart(i, 3) = yearinp And chart(i, 1) = monthinp And chart(i, 2) = dayinp Then
        search = 1
    End If
    If search = 1 Then
        wa = chart(i, 4)
        wb = chart(i, 5)
        wc = chart(i, 6)
        wd = chart(i, 7)
        we = chart(i, 8)
        wf = chart(i, 9)
        wg = chart(i, 10)
        wh = chart(i, 11)
    End If
    Print wa; wb; wc; wd; we; wf; wg; wh

    nextitem2:

Next i
Do While InKey$ = ""
Loop

If search = 0 Then
    Print
    Print "Draw not found"
    Print
    Print "Either use manual entry or ensure that correct data"
    Print "has been entered with main menu option A"
    Print
    Print "Press any key to Continue ...."
    Do While InKey$ = ""
    Loop
    Close #2
End If

search = 0
GoTo reedfiles
manent:
Cls
Print
Print "Winning Numbers Entry"
Print
Print "This option is only for checking winning numbers, it does NOT"
Print "update the numbers database. Use option A from the main menu"
Print "if you want to update the database."
Print
For zqa = 1 To 8
    rd1:
    If zqa = 8 Then
        Print "Bonus #"; "  "; " ";: Input entry(zqa)
    Else
        Print "Entry #"; zqa; " ";: Input entry(zqa)
    End If
    If entry(zqa) = 0 Then GoTo searchmenu
    If entry(zqa) < 1 Or entry(zqa) > 50 Then Print "Number Out of Range ! , Try Again !!": GoTo rd1
    If zqa > 1 Then
        For i = 1 To (zqa - 1)
            If entry(zqa) = entry(i) Then Print "Number already picked, pick another": GoTo rd1
        Next i
    End If
Next zqa

ac = entry(1): bc = entry(2): cc = entry(3): dc = entry(4): ec = entry(5): fc = entry(6): gc = entry(7): hc = entry(8)
reedfiles:
Open runit$ For Input As #2
Cls
linecount = 1
Input #2, drawdate$
Do Until EOF(2)

    linecount = linecount + 1
    tickets = tickets + 1
    Input #2, ac, bc, cc, dc, ec, fc, gc
    If wa = ac Or wa = bc Or wa = cc Or wa = dc Or wa = ec Or wa = fc Or wa = gc Then
        winnings = winnings + 1
    End If
    If wb = ac Or wb = bc Or wb = cc Or wb = dc Or wb = ec Or wb = fc Or wb = gc Then
        winnings = winnings + 1
    End If
    If wc = ac Or wc = bc Or wc = cc Or wc = dc Or wc = ec Or wc = fc Or wc = gc Then
        winnings = winnings + 1
    End If
    If wd = ac Or wd = bc Or wd = cc Or wd = dc Or wd = ec Or wd = fc Or wd = gc Then
        winnings = winnings + 1
    End If
    If we = ac Or we = bc Or we = cc Or we = dc Or we = ec Or we = fc Or we = gc Then
        winnings = winnings + 1
    End If
    If wf = ac Or wf = bc Or wf = cc Or wf = dc Or wf = ec Or wf = fc Or wf = gc Then
        winnings = winnings + 1
    End If
    If wg = ac Or wg = bc Or wg = cc Or wg = dc Or wg = ec Or wg = fc Or wg = gc Then
        winnings = winnings + 1
    End If
    If wh = ac Or wh = bc Or wh = cc Or wh = dc Or wh = ec Or wh = fc Or wh = gc Then
        bonus = bonus + 1
    End If


    If winnings = 7 Then
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout7 = payout7 + 1
        cash7 = 70000000
    End If
    If winnings = 6 And bonus = 1 Then
        winnings = winnings + 1
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout6b = payout6b + 1
        cash6b = 197679.90
    End If
    If winnings = 6 Then
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout6 = payout6 + 1
        cash6 = 3822
    End If
    If winnings = 5 And bonus = 1 Then
        winnings = winnings + 1
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout5b = payoutb + 1
        cash5b = 791.50
    End If
    If winnings = 5 Then
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout5 = payout5 + 1
        cash5 = cash5 + 95.5
    End If
    If winnings = 4 And bonus = 1 Then
        winnings = winnings + 1
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout4b = payout4b + 1
        cash4b = cash4b + 44.30

    End If
    If winnings = 4 Then
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout4 = payout4 + 1
        cash4 = 20
    End If

    If winnings = 3 And bonus = 1 Then
        winnings = winnings + 1
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout3b = payout3b + 1
        cash3b = 20
    End If
    If winnings = 3 Then
        Print "Line # "; linecount; ">= ";
        Print Using "## ## ## ## ## ## ##    Bonus : ##"; wa; wb; wc; wd; we; wf; wg; wh;
        Print "    > "; winnings; "  Correct."
        payout3 = payout3 + 1
        cash3 = 5
    End If
    If winnings < 3 Then
        Print "Line # "; linecount; ">= "; "Did Not Win !"
    End If



    winnings = 0

Loop

Print "Press any key to continue......"
Do While InKey$ = ""
Loop
Close #1
GoSub payouts
GoSub moneycheck
zzzz = 1
GoTo main

payouts:
cash3total = cash3 * payout3
cash3btotal = cash3b * payout3b
cash4total = cash4 * payout4
cash4btotal = cash4b * payout4b
cash5total = cash5 * payout5
cash5btotal = cash5b * payout5b
cash6total = cash6 * payout6
cash6btotal = cash6b * payout6b
cash7total = cash7 * payout7
Cls
Print
Print "Total of 3/7       Payouts of free tickets            ==> "; payout3
Print "Total of 3/7 +     Bonus Payouts of $20.00 Cash is      $ "; payout3b
Print "Total of 4/7       Payouts of $20.00 Cash is            $ "; payout4
Print "Total of 4/7 +     Bonus Payouts of $44.30 Cash is      $ "; payout4b
Print "Total of 5/7       Payouts of $96.50 Cash is            $ "; payout5
Print "Total of 5/7 +     Bonus Payouts of $791.50 Cash is     $ "; payout5b
Print "Total of 6/7       Payouts of $3822.00 Cash is          $ "; payout6
Print "Total of 6/7 +     Bonus Payouts of $197,679.00 Cash is $ "; payout6b
Print "Total of 7/7       Payouts of $70,000,000 Cash       is $ "; payout7
Print
Print "Press any key to continue..."
Do While InKey$ = ""
Loop
correctnum = payout3 + payout3b + payout4 + payout4b + payout5 + payout5b + payout6 + payout6b + payout7
grandtotalcash = cash3btotal + cash4total + cash4btotal + cash5total + cash5btotal + cash6total + cash6btotal + cash7total
Cls
Print
Print "Total Payouts from the above is : $ "; grandtotalcash
Print "Total number of free tickets is :   "; payout3
Print "Value of free tickets is        : $ "; cash3total
Print "But they don't count yet            "
Print "They will count towards your        "
Print "Next purchase of tickets            "
Print ""
Print "You had a total of "; correctnum; " possible winners in that file."
Print "Check your printout, diskfile or tickets for more info."
Open "cash3total.dat" For Input As #1
Input #1, cash3total
oldcash3total = oldcash3total + cash3total
Close #1
Open "cash3total.dat" For Output As #1
Print #1, oldcash3total
Close #1
If hardcopy$ = "Y" And correctnum > 3 Then
    LPrint
    LPrint "Program Written by : Russ Campbell"
    LPrint

End If

Print
Print "The winning numbers were : "; wa; wb; wc; wd; we; wf; wg; " Bonus # "; wh
Print
Print "Press any key to continue ....."
Print
Do While InKey$ = ""
Loop
Open "oldbalance.dat" For Input As #1
Input #1, oldbalance
Close #1
Close #2
Close #3

payout3b = 0
payout4 = 0
payout4b = 0
payout5 = 0
payout5b = 0
payout6 = 0
payout6b = 0
payout7 = 0
cash3b = 0
cash4 = 0
cash4b = 0
cash5 = 0
cash5b = 0
cash6 = 0
cash6b = 0
cash7 = 0
cash3btotal = 0
cash4total = 0
cash4btotal = 0
cash5total = 0
cash5btotal = 0
cash6total = 0
cash6b = 0
cash7total = 0
correctnum = 0


GoSub totalchart2
Return
GoTo main
enterwinningnumbers:

Open "lottomax.dat" For Append As #1
GoSub getdate
beginning:
Cls
Print
Print "Lotto Max Package Version 2022 RC 2022 Winning Numbers Entry"
Print "------------------------------------------------------------"
Print
Print "This section allows you to enter winning numbers from each draw."
Print "It then stores the numbers in a database for use with the chart"
Print "used in section B. I now have automatic next draw date entry."
Print
Print "Winning Numbers Updated on "; today$; " "; month$(month); day; year
Print "Last numbers entered : "; entrya; entryb; entryc; entryd; entrye; entryf; entryg; entryh
GoSub getdate
Print "Next Draw Date : "; d5$; " "; month$(month12); day12; year12
Print
enternumbers:
Print
first:
Print "Enter 1st number for the draw of "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry] : ", entrya
If entrya = 0 Then Close #1: count = -1: GoTo main
If entrya = -1 Then Print "You are already at entry # 1 !!! You cant go back another entry !!!": GoTo first
If entrya < 1 Or entrya > 50 Then Print "Number Out of range !": GoTo first

second:
Print "Enter 2nd number for the draw of : "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entryb
If entryb = -1 Then GoTo first
If entryb < 1 Or entryb > 50 Then Print "Number Out of Range !": GoTo second
If entryb = entrya Then Print "Number already picked!": GoTo second
third:
Print "Enter 3rd number for the draw of : "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entryc
If entryc = -1 Then GoTo second
If entryc < 1 Or entryc > 50 Then Print "Number Out of Range !": GoTo third
If entryc = entryb Or entryc = entrya Then Print "Number already picked!": GoTo third
fourth:
Print "Enter 4th number for the draw of :"; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entryd
If entryd = -1 Then GoTo third
If entryd < 1 Or entryd > 50 Then Print "Number Out of Range !": GoTo fourth
If entryd = entryc Or entryd = entryb Or entryd = entrya Then Print "Number already picked!": GoTo fourth
fifth:
Print "Enter 5th number for the draw of "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entrye
If entrye = -1 Then GoTo fourth
If entrye < 1 Or entrye > 50 Then Print "Number Out of Range !": GoTo fifth
If entrye = entryd Or entrye = entryc Or entrye = entryb Or entrye = entrya Then Print "Number already picked!": GoTo fifth
sixth:
Print "Enter 6th number for the draw of "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entryf
If entryf = -1 Then GoTo fifth
If entryf < 1 Or entryf > 50 Then Print "Number Out of Range !": GoTo sixth
If entryf = entrye Or entryf = entryd Or entryf = entryc Or entryf = entryb Or entryf = entrya Then Print "Number already picked!": GoTo sixth
seventh:
Print "Enter 7th number for the draw of "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entryg
If entryg = -1 Then GoTo sixth
If entryg < 1 Or entryf > 50 Then Print "Number Out of Range !": GoTo seventh
If entryf = entrye Or entryf = entryd Or entryf = entryc Or entryf = entryb Or entryf = entrya Then Print "Number already picked!": GoTo seventh
eighth:
Print "Enter bonus number for the draw of "; d5$; " "; month$(month12); " "; day12; year12
Input "[if you make a mistake type -1 on the next number to go back 1 entry ] : ", entryh
If entryh = -1 Then GoTo seventh
If entryh < 1 Or entryg > 50 Then Print "Number Out of Range !": GoTo eighth
If entryh = entryg Or entryh = entryf Or entryh = entrye Or entryh = entryd Or entryh = entryc Or entryh = entryb Or entryh = entrya Then Print "Number already picked !": GoTo eighth
Print
Print "You Have Entered for the draw of : "; d5$; " "; month$(month12); " "; day12; year12
Print entrya; " "; entryb; " "; entryc; " "; entryd; " "; entrye; " "; entryf; " "; entryg; " Bonus  :"; entryh
Print
verify:
Print "Is the above correct [Y]es  [N]o  [Q]uit   : "

answer$ = Input$(1)
If answer$ = Chr$(13) Then answer$ = "Y"
If answer$ = "y" Then answer$ = "Y"
If answer$ = "n" Or answer$ = "N" Or answer$ = "no" Or answer$ = "NO" Then count = -1: GoTo beginning
If answer$ = "Q" Or answer$ = "q" Then Close #1: GoTo main
If answer$ = "Y" Or answer$ = "y" Then
    count = 1: GoSub writenumbers: Close #1: GoSub buildchart: GoSub convert: GoSub getdate
End If
Print
Close #1
Print "Any more winning numbers ??? [Y] or [N]o "
answer$ = Input$(1)
If answer$ = Chr$(13) Then answer$ = "Y"
If answer$ = "N" Or answer$ = "n" Then GoTo main

If answer$ = "Y" Or answer$ = "y" Then
    count = 1: GoTo enterwinningnumbers
Else

    count = 0: GoTo main
End If
GoTo main
buildchart:
chartbuild = chartbuild + 1
chartcount = 100
linecounter = 0
Erase chart
Open "lottomax.dat" For Input As #1
Do Until EOF(1)
    Input #1, month, day, year, entrya, entryb, entryc, entryd, entrye, entryf, entryg, entryh
    chart(linecounter, 1) = month
    chart(linecounter, 2) = day
    chart(linecounter, 3) = year
    chart(linecounter, 4) = entrya
    chart(linecounter, 5) = entryb
    chart(linecounter, 6) = entryc
    chart(linecounter, 7) = entryd
    chart(linecounter, 8) = entrye
    chart(linecounter, 9) = entryf
    chart(linecounter, 10) = entryg
    chart(linecounter, 11) = entryh
    linecounter = linecounter + 1
Loop
Close #1

Return
convert:

For i = 1 To linecounter
    If spec$ = "Y" Then
        If chart(i, 3) < yearin Then GoTo zqzq
        If chart(i, 1) < monthin And chart(i, 3) = yearin Then GoTo zqzq
        If chart(i, 3) > yearend Then GoTo zqzq
        If chart(i, 1) > monthend And chart(i, 3) = yearend Then GoTo zqzq
    End If
    numb(chart(i, 4)) = numb(chart(i, 4)) + 1
    numb(chart(i, 5)) = numb(chart(i, 5)) + 1
    numb(chart(i, 6)) = numb(chart(i, 6)) + 1
    numb(chart(i, 7)) = numb(chart(i, 7)) + 1
    numb(chart(i, 8)) = numb(chart(i, 8)) + 1
    numb(chart(i, 9)) = numb(chart(i, 9)) + 1
    numb(chart(i, 10)) = numb(chart(i, 10)) + 1
    bonus(chart(i, 11)) = bonus(chart(i, 11)) + 1

    zqzq:
Next i
If spec$ = "N" Then
    yearin = chart(1, 3)
    yearend = chart(linecounter, 3)
    monthin = chart(1, 1)
    monthend = chart(linecounter, 3)
End If
Return
printmenu:
Cls
If crs$ = "Y" Then Color 10, 5

Locate 4, 18
Print " Lotto Max Version 2022 RC 2022  Print Menu"
If crs$ = "Y" Then Color 3, 8
Locate 3, 17
Print Chr$(201)
For i = 18 To 57
    Locate 3, i
    Print Chr$(205)
Next i
Locate 3, 58
Print Chr$(187)
For i = 18 To 57
    Locate 5, i
    Print Chr$(205)
Next i
For i = 18 To 57
    Locate 9, i
    Print Chr$(205)
Next i
For i = 18 To 57
    Locate 11, i
    Print Chr$(205)
Next i
Locate 11, 17
Print Chr$(200)
Locate 11, 58
Print Chr$(188)
For i = 4 To 10
    Locate i, 17
    If i = 5 Or i = 9 Then
        Print Chr$(204)
    Else
        Print Chr$(186)
    End If
    Locate i, 58
    If i = 5 Or i = 9 Then
        Print Chr$(185)
    Else
        Print Chr$(186)
    End If
Next i
If crs$ = "Y" Then Color 4, 7
For i = 6 To 8
    Locate i, 27
    Print "["
    Locate i, 28
    If crs$ = "Y" Then Color 0, 7
    Print Chr$(59 + i)
    If crs$ = "Y" Then Color 4, 7
    Locate i, 29
    Print "]"
Next i
Locate 10, 45
Print "["
Locate 10, 47
Print "]"
If crs$ = "Y" Then Color 1, 7
Locate 6, 31
Print "Print Entire List"
Locate 7, 31
Print "Print Partial List"
Locate 8, 31
Print "Goto Search Menu"
Locate 10, 27
Print "Your Choice is:"
Locate 10, 46
answer$ = Input$(1)
Print answer$
If answer$ = "a" Or answer$ = "A" Then
    monthin = 1
    monthend = 12
    yearin = 2000
    yearend = 3000
    GoTo printentirelist
ElseIf answer$ = "b" Or answer$ = "B" Then
    monthin = 1
    monthend = 12
    yearin = 2000
    yearend = 3000
    GoTo printpartial
ElseIf answer$ = "c" Or answer$ = "C" Or answer$ = "" Then
    GoTo searchmenu
Else
    GoTo searchmenu
End If
printpartial:
Cls
Print
Print "Printing Partial List of winning numbers."
partial = 1
Print
Input "Start  Month: ", monthin
If monthin = 0 Then GoTo main
If monthin < 1 Or monthin > 12 Then
    GoTo printpartial
End If
Input "Start  Year [All 4 digits] : ", yearin
If yearin = 0 Then
    GoTo main
End If
Input "Finish Month: ", monthend
If monthend = 0 Then
    GoTo main
End If
If monthend < 1 Or monthend > 12 Then
    GoTo printpartial
End If
Input "Ending Year [All 4 digits] : ", yearend
If yearend = 0 Then
    GoTo main
End If
printentirelist:
If partial <> 0 Then GoTo lister
Print
Print "Printing Entire List of winning numbers."
Print
lister:
If hardcopy$ = "Y" Then
    LPrint
    LPrint "List of Lotto Max Winning Numbers"
    LPrint "---------------------------------"
    LPrint
    LPrint "Month | Day | Year |  1st | 2nd | 3rd | 4th | 5th | 6th | 7th | Bonus"
    LPrint "----- | --- | ---- |  --- | --- | --- | --- | --- | --- | --- | -----"
    LPrint
    pat$ = "   ## |  ## | #### |   ## |  ## |  ## |  ## |  ## |  ## |  ## |  ##  "
    For i = 1 To linecounter
        If chart(i, 3) < yearin Then GoTo qzqz
        If chart(i, 1) < monthin And chart(i, 3) = yearin Then GoTo qzqz
        If chart(i, 3) > yearend Then GoTo qzqz
        If chart(i, 1) > monthend And chart(i, 3) = yearend Then GoTo qzqz
        LPrint Using pat$; chart(i, 1); chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10); chart(i, 11)
        qzqz:
    Next i
End If
Cls
Print
Print "List of Lotto Max Winning Numbers"
Print "---------------------------------"
Print
Print "Month | Day | Year |  1st | 2nd | 3rd | 4th | 5th | 6th | 7th | Bonus"
Print "----- | --- | ---- |  --- | --- | --- | --- | --- | --- | --- | -----"
Print
pat$ = "   ## |  ## | #### |   ## |  ## |  ## |  ## |  ## |  ## |  ## | ##  "
For i = 1 To linecounter
    linecounter = linecounter + 1
    If chart(i, 3) < yearin Then GoTo qzqzqz
    If chart(i, 1) < monthin And chart(i, 3) = yearin Then GoTo qzqzqz
    If chart(i, 3) > yearend Then GoTo qzqzqz
    If chart(i, 1) > monthend And chart(i, 3) = yearend Then GoTo qzqzqz
    Print Using pat$; chart(i, 1); chart(i, 2); chart(i, 3); chart(i, 4); chart(i, 5); chart(i, 6); chart(i, 7); chart(i, 8); chart(i, 9); chart(i, 10); chart(i, 11)
    For zz = 1 To 5000000: Next zz
    qzqzqz:
Next i
Do While InKey$ = ""
Loop
GoTo printmenu
writenumbers:

Print #1, Using "## ## ####  ## ## ## ## ## ## ## ##"; month12; day12; year12; entrya; entryb; entryc; entryd; entrye; entryf; entryg; entryh
Return

errorhandle:
Cls
Print
Print "There is something wrong with what you have input. Either you said"
Print "that you have a printer online, when in fact you don't or you have"
Print "tried to read a non-existant file."
Print
Print "In the above case if you do have a printer online, make sure that"
Print "it is turned on, is online and has paper in it."
Print
Print "If you are trying to read the chart, and get this error, then make "
Print "sure that the 'lottomax.dat' file exists.  "
Print
Print "If you are using the barchart menu, and are trying to display a chart"
Print "when this error occurs, then it is most likely that you have the "
Print "wrong graphics mode set. Try reseting your graphics mode."
Print
Print "If all else fails, and the error keeps coming up, then it is obviously"
Print "a program error. Please let me know about it and I will try to fix it."
Print
Print
Print "Press any key to continue ..."
Do While InKey$ = ""
Loop
GoTo main
asciidisplay:
For j = 1 To 50
    If viewpoint$ = "low" Then
        title$ = "Numbers Least Drawn"
        If outpt(j) > low + spread Then
            markz = 1
        End If
    ElseIf viewpoint$ = "average" Then
        title$ = " Numbers Average Drawn"
        If outpt(j) < low + spread Or outpt(i) > high - spread Then
            markz = 1
        End If
    ElseIf viewpoint$ = "high" Then
        title$ = " Numbers Most Drawn"
        If outpt(j) < high - spread Then
            markz = 1
        End If
    ElseIf viewpoint$ = "all" Then
        title$ = "All Numbers Drawn"
    End If
    If bonus$ = "Y" And normal$ = "" Then
        title2$ = "  With Bonus Numbers"
    ElseIf bonus$ = "N" And normal$ = "" Then
        title2$ = "  Without Bonus Numbers"
    ElseIf bonus$ = "Y" And normal$ = "N" Then
        title2$ = "  Just Bonus Numbers"
    End If
    If markz > 0 Then
        GoTo disp
    End If
    countz = (outpt(j) / 16.247255256274392)
    countz = 30 - countz
    If ca > 2 Then
        ca = 0
    End If
    For i = 20 To countz Step -1
        Locate i, j + 11
        Print Chr$(176 + ca)
    Next i
    disp:
    markz = 0
    ca = ca + 1
Next j
Locate 3, 4
Print "Frequency Distribution Chart  " + title$ + title2$
Locate 4, 4
Print "Covering the period from "; month$(monthin); yearin; " to "; month$(monthend); yearend
Locate 21, 12
Print "00000000011111111112222222222333333333344444444445"
Locate 22, 12
Print "12345678901234567890123456789012345678901234567890"
xyxty = 4 * 2
For i = 20 To 6 Step -1
    Locate i, 6
    Print xyxty
    Locate i, 63
    Print xyxty
    xyxty = xyxty + 4
Next i
Locate 24, 20
Print "Press any key to continue ..."
Do While InKey$ = ""
Loop
viewpoint$ = "": normal$ = "": bonus$ = ""
Return
GoTo main
partofprogram:

If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "This program is a realtime simulation of playing"
Print "the actual lottery, Lotto Max. You start off with "
Print "A selectable value , and the tickets are at real"
Print "market value, Every ticket you buy is added up,"
Print "the date of purchase is logged, and the next draw"
Print "date is logged. You have at your disposal just about"
Print "every possible strategy that you could use but"
Print "Its real time, you are not actually spending any money"
Print "or winning any money, but the program will keep track"
Print "of it all. You are to enter each draw as a set of winning"
Print "numbers The program will not allow you to enter the draw"
Print "until it has happened, if you try to enter false numbers"
Print "before the draw , it will tell you that the draw has not"
Print "yet happened, and it will not let you enter numbers."
Print
Print "Disclaimer: You are not actually spending any money or"
Print "winning any money , if you do it for real I am not"
Print "responsible for the consequences, in fact I advise"
Print "against doing so foolishly. "
Print
Print "This program is for entertainment purposes only!"
Print "Press any key to continue...."
Print
Do While InKey$ = ""
Loop


rules:
If crs$ = "Y" Then Color 14, 12

Cls
Print
Print "Lotto Max 2022 RC 2022 Simulation Program With Real Time Game Play Rules."
Print "---------------------------------------------------------------------"
Print
Print "This program has been written as a simulator of the"
Print "popular Lotto Max lottery and is written to be played"
Print "as a game in real time.. But not by spending real money"
Print "for real prizes by matching 7 out of 50 numbers."
Print
Print "The program starts off by giving you a variable amount to spend"
Print "and will automatically keep track of ticket"
Print "purchases, and winning tickets. Every time you buy (not for"
Print "real), sets of tickets the program first charges you the"
Print "market rate for your tickets, then saves the random or"
Print "wheeled system sets of 7 numbers from 1 to 50."
Print
Print "This program is designed to show you that if you play the"
Print "game responibly , you will have a lot of fun, but if you"
Print "gamble recklessly, you will in most cases loose a lot of money."
Print
Print "Press any key to continue..."
Do While InKey$ = ""
Loop
Return
basicrules:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "Basic Rules and object of this Lotto Max 2022 RC 2022 Lottery Simulator"
Print "-------------------------------------------------------------------"
Print
Print "You start out with a variable amount, and the object"
Print "of the game is to win $70 Million dollars by matching"
Print "all 7 numbers from 1 to 50. "
Print
Print "Prize Payout (Not in real dollars but funny money)."
Print "---------------------------------------------------"
Print
Print "Cash for 3/7  Numbers Matched                   = Free Ticket"
Print "Cash for 3/7  Numbers Matched and Bonus matched = $20.00"
Print "Cash for 4/7  Numbers Matched                   = $20.00"
Print "Cash for 4/7  Numbers Matched and Bonus matched = $44.30"
Print "Cash for 5/7  Numbers Matched                   = $96.50"
Print "Cash for 5/7  Numbers Matched and Bonus matched = $791.50"
Print "Cash for 6/7  Numbers Matched                   = $3,822.00"
Print "Cash for 6/7  Numbers Matched and Bonus matched = $197,679.00"
Print "Cash for 7/7  Numbers Matched                   = $70,000,000.00"
Print
Print "These payouts are at the maximun for the benefit of the game here."
Print
Print "Press any  key to continue...."
Do While InKey$ = ""
Loop
Return
worthit:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "Is it worth playing the lotteries in the long run ???"
Print
Print "You decide by playing this simulator as if it were real,"
Print "almost every method of tracking the database of winning"
Print "of winning numbers and winning this game has been"
Print "provided to you in the main menu."
Print "I have written this program as a retro DOS style program,"
Print "everything has been done with the program to make it seem"
Print "like an 80s style program , with some modern ideas of how"
Print "to track the lotteries. I hope the you enjoy this simulator"
Print "and treat it as a learning tool, not a way of trying to"
Print "actually beat the lottery systems that are out there."
Print "All of the winning numbers have been faithfully recorded"
Print "in a simple database and each draw date is automatically"
Print "calculated by my coding of this program."
Print "Basically if you play responsibly , you will have a lot of"
Print "fun, but if you gamble recklessly , you will loose a lot of"
Print "money, in most cases everything you have."
Print
Print "Lets just say that now I support OLG and I used to never play"
Print "the games, butI will now, responsibly."
Print
Print "Press any key to continue ...."
Do While InKey$ = ""
Loop
Return
startingandending:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "Lotto Max Simulation Program In Real Time."
Print "-------------------------------------------"
Print
Print "The reason that I call this program"
Print "Lotto Max Simulation Program is because it"
Print "is all about the game play, not gambling with"
Print "a lot of money, and in this simulator you can"
Print "play with a lot of funny money, and watch the"
Print
Print "I hope that you will enjoy playing this"
Print "Lotto Max Lottery Simulator in real time,"
Print "I will make a disclaimer here that you"
Print "are not playing for real money."
Print "If you decide to play for real, I take no "
Print "responsibility for the consequences."
Print
Print "I do not condone trying to beat the lottery"
Print "system in any way shape or form. I do provide"
Print "ways of tracking the outcome of the Lotto Max"
Print "Lottery, but this information is for educational"
Print "purposes only."
Print
Print "Press any key to continue......"
Do While InKey$ = ""
Loop
Return
lottomaxsimulator:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "This program called Lotto Max Simulator has been written by"
Print "Russ Campbell of Kitchener Ontario, Canada."
Print
Print "My email address to contact me about this program, or bugs in it,"
Print "or game ideas or positive suggestions is"
Print "rcamp48 AT rogers dot com. PLEASE !!!!!! NO SPAM !!!!!!!"
Print
Print "This program has been written for the problem gambler that plays"
Print "the lotteries, any lottery, and by allowing you to gamble huge"
Print "amounts of funny money, it might just give you a second chance"
Print "in life imnstead of loosing everything you own by doing just "
Print "that for real. Please use this program to show you what can happen"
Print "if you gamble irresponibly, and pass it on to other lottery players"
Print "that have the same problem. This program,is finished, will keep"
Print "track of every penny spent in the simulator and will take into "
Print "account winnings verses losses and chart it all for you. If I can"
Print "reach even one person with this problem it will be worth everything"
Print "that I have put into the program."
Print
Print "Press any key to continue..."
Do While InKey$ = ""
Loop
Return
information:
Cls

owner$ = "Russ Campbell"
registered$ = reg$
distribute$ = "QB64.ORG"
serial$ = reg2$
version$ = "2022 RC 2022"
release$ = "May 16 2021 - 12:01 AM"

Print
Print "Program Written by : "; owner$
Print "Registered to      : "; registered$
Print "Distributed by     : "; distribute$
Print "Serial #           : "; serial$
Print "Version #          : "; version$
Print "Release date       : "; release$
Print
Print "Press any key to continue ... "
Do While InKey$ = ""
Loop
Return
aboutthisprogram:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print
Print "About This Lotto Max RC 2022 Simulator and all of the other"
Print "information that you need to play for fun or real time."
Print
Print "(1) Lotto Max Simulator Intoduction."
Print "(2) Is it worth playing the lotteries in the long run?"
Print "(3) Lotto Max Payouts (not real money) for this simulator."
Print "(4) Basic Rules for this Lotto Max Simulator."
Print "(5) Lotto Max Simulator Explaination."
Print "(6) Welcome to the Lotto Max 2022 RC 2022 Simulator'"
Print "(7) Lotto Max Simulator plays in real time or fun mode."
Print "(8) Lotto Max Simulator Program Information"
Print "(9) Definitions of playing for realtime or for fun."
Print "(0) Go back to main Menu."
Print
Print "Enter a number from the above list to go to that screen"
answer$ = ""
answer$ = Input$(1)
If answer$ = "1" Then
    GoSub lottomaxsimulator
    GoTo aboutthisprogram
ElseIf answer$ = "2" Then
    GoSub worthit
    GoTo aboutthisprogram
ElseIf answer$ = "3" Then
    GoSub basicrules
    GoTo aboutthisprogram
ElseIf answer$ = "4" Then
    GoSub rules
    GoTo aboutthisprogram
ElseIf answer$ = "5" Then
    GoSub partofprogram
    GoTo aboutthisprogram
ElseIf answer$ = "6" Then
    GoSub finalversion
    GoTo aboutthisprogram
ElseIf answer$ = "7" Then
    GoSub startingandending
    GoTo aboutthisprogram
ElseIf answer$ = "8" Then
    GoSub information
    GoTo aboutthisprogram
ElseIf answer$ = "9" Then
    GoSub reserved
    GoTo aboutthisprogram
ElseIf answer$ = "0" Then
    GoTo main
Else
    GoTo main
End If


Return

reserved:
If crs$ = "Y" Then Color 14, 12
Cls
Print
Print "The difference between playing for fun and playing realtime is"
Print "that in real time you must purchase (not with real money) any"
Print "tickets before the next draw. All winners must match their pretend"
Print "ticket dates with the actual draw date(s). Of course any money"
Print "won is not real, and since this simulation is for entertainment"
Print "purposes only, if you win big on any particular ticket, don't"
Print "come crying to me or anyone else its only a game, not real."
Print "(I just hope you don't win the big one without an actual"
Print "ticket, but the chances of that are slim if not impossible"
Print "but who knows it might just happen."
Print
Print "Playing for fun is just that, it is not real time, I will"
Print "incorparate that one into the next release."
Print
Print "Press any key to continue......"
Do While InKey$ = ""
Loop
Return


chart2:
Cls
Print
Print "This section will check each number from 1 to 50 and see how often"
Print "it occurs. It takes a few seconds to run however."
Print
Print "It will then give you a saved report that tells when the numbers came"
Print "up last, when they may come up again by, and the average days between"
Print "occurances. Note that your winning numbers database has the be up to"
Print "date completely for this to work properly."
Print
Print "Press any key to continue ....."
Do While InKey$ = ""
Loop
Cls
x1 = Val(Mid$(Date$, 1, 2))
x2 = Val(Mid$(Date$, 4, 2))
x3 = Val(Mid$(Date$, 7, 4))
x1 = x1 * 30
x3 = x3 * 365
now2 = x1 + x2 + x3
Open "freq.txt" For Output As #1 Len = 80
Open "next.txt" For Output As #2 Len = 80

For j = 1 To 50
    For i = 1 To linecounter
        If chart(i, 4) = j Or chart(i, 5) = j Or chart(i, 6) = j Or chart(i, 7) = j Or chart(i, 8) = j Or chart(i, 9) = j Or chart(i, 10) = j Then
            count = count + 1
            k = i
            If count = 1 Then
                day2 = chart(i, 2)
                month1 = chart(i, 1)
                year1 = chart(i, 3)
            End If
            If count > 1 Then
                day4 = chart(i, 2)
                month2 = chart(i, 1)
                year2 = chart(i, 3)
                now = (year2 * 365) + (month2 * 30) + day4
                thn = (year1 * 365) + (month1 * 30) + day3
                balance = now - thn
                temp4(j) = temp4(j) + balance
                year1 = year2
                month1 = month2
                day3 = day4
            End If
        End If
    Next i
    temp4(j) = Int(temp4(j) / count)
    count = 0
    Print #1, Using "Number ## comes up every ## days."; j; temp4(j)
    Print #1, Using "Number ## last came up ## ## ####."; j; chart(k, 1); chart(k, 2); chart(k, 3)
    day5 = chart(k, 2) + temp4(j)
    If day5 > 30 Then
        day5 = day5 - 30
        month3 = chart(k, 1) + 1
    Else
        month3 = chart(k, 1)
    End If
    If month3 > 12 Then
        month3 = month3 - 12
        year3 = chart(k, 3) + 1
    Else
        year3 = chart(k, 3)
    End If
    Print #1, Using "Number ##   due by:    ## ## ####."; j; month3; day5; year3
    z1 = month3 * 30
    z2 = day3
    z3 = year3 * 365
    thn2 = z1 + z2 + z3
    If thn2 < (now2 - 20) Then
        Print #1, Using "Number  ##  is a good bet as it was due by : ## ## ####"; j; month3; day3; year3
        Print Using "Number ## is a good bet, it was due by : ## ## ####"; j; month3; day3; year3
    End If
    k = 0
    Print #1, ""
Next j
Print
Print "Press any key to continue ..."
Do While InKey$ = ""
Loop
Close #1
Close #2
GoTo main
search:
Cls
Print
Print "Search for Winning Numbers by Date"
Print "----------------------------------"
Print
month2:
Input "Enter Month: ", month2
If month2 = 0 Then
    GoTo searchmenu
End If
If month2 < 1 Or month2 > 12 Then
    Print "Invalid Month !": GoTo month2
End If
day2:
Input "Enter Day: ", day2
If day2 < 1 Or day2 > 31 Then
    Print "Invalid Month !": GoTo day2
End If
Input "Enter Year [Last 2 digits] : ", year2
year2 = year2 + 2000
For i = 1 To linecounter
    If chart(i, 3) <> year2 Then
        GoTo nextitem
    ElseIf chart(i, 1) <> month2 Then
        GoTo nextitem
    ElseIf chart(i, 2) <> day2 Then
        GoTo nextitem
    ElseIf chart(i, 3) = year2 And chart(i, 1) = month2 And chart(i, 2) = day2 Then
        search = 1
        Cls
        Print
        Print "Winning Numbers List"
        Print "--------------------"
        Print
        Print "Month : ", chart(i, 1)
        Print "Day   : ", chart(i, 2)
        Print "Year  : ", chart(i, 3)
        Print
        Print "1st   : ", chart(i, 4)
        Print "2nd   : ", chart(i, 5)
        Print "3rd   : ", chart(i, 6)
        Print "4th   : ", chart(i, 7)
        Print "5th   : ", chart(i, 8)
        Print "6th   : ", chart(i, 9)
        Print "7th   : ", chart(i, 10)
        Print "Bonus : ", chart(i, 11)
        Print
        Print "Press any key to continue ... "
        Print
        Do While InKey$ = ""
        Loop
    End If
    nextitem:
Next i
If search = 0 Then
    Print
    Print "There was no draw on : "; month2; day2; year2
    Print
    Print "Press any key to continue ...."
    Do While InKey$ = ""
    Loop
End If

search = 0

GoTo searchmenu
getdte:
Return

grcheck:
Open "grmode.dat" For Input As #1
Input #1, hardcopy$
Input #1, crs$
Input #1, grtype
Input #1, qqq
Input #1, skill$
Input #1, display$
Input #1, speed$
Input #1, realtime$
Close #1

Open "previousbalance.dat" For Input As #1
Input #1, previousbalance
Close #1
Open "oldbalance.dat" For Input As #1
Input #1, oldbalance
Close #1
If realtime$ = "F" Then realtime$ = "Fun"
If realtime$ = "R" Then realtime$ = "Real Time"
Open "dname.dat" For Input As #1
Input #1, reg$
For i = 1 To Len(reg$)
    counter4 = counter4 - 5.41735
    z2 = Asc(Mid$(reg$, i, i))
    Mid$(reg$, i, i) = Chr$(z2 + counter4)
Next i
Close #1
counter4 = 0
Open "reg.dat" For Input As #1
Input #1, reg2$
For i = 1 To Len(reg2$)
    counter4 = counter4 - 5.42513
    z2 = Asc(Mid$(reg2$, i, i))
    Mid$(reg2$, i, i) = Chr$(z2 + counter4)
Next i
realname$ = reg$
realreg$ = reg2$
Close #1
Return

grinit:
If hardcopy$ = "y" Then
    hardcopy$ = "Y"
End If
If grtype = 0 Then
    grmode$ = "none"
ElseIf grtype = 1 Then
    grmode$ = "vga"
    wl = 400
    smode = 12
    barl = 1.84762357837476237
    offset = 0
ElseIf grtype = 2 Then
    grmode$ = "HDMI"
    wl = 400
    smode = 12
    barl = 1.84235735763546337
    offset = 0
End If
Return
monthread:
Data "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
month$ = month$(month)
Return
filemenu:

ReDim Drives(0) As String
Declare CustomType Library "c:\transfolioshell\direntry"
    Function load_dir& (s As String)
    Function has_next_entry& ()
    Sub close_dir ()
    Sub get_next_entry (s As String, flags As Long, file_size As Long)
End Declare

GoTo choosedrive


begin2:

Screen _NewImage(400, 320, 32)
Drives$ = LoadDrives$(Drives()) 'windows only in current version

ReDim DirNew(0) As String
ReDim FileNew(0) As String
start10:


ReDim Dir(0) As String, File(0) As String


GetFileList _CWD$, Dir(), File()
ReDim All(UBound(dir) - 1 + UBound(file)) As String

iii = 0


For AllLoader = LBound(dir) + 2 To UBound(dir) '                     i need not "." in list
    If Len(Dir(AllLoader)) Then All(iii) = Dir(AllLoader): iii = iii + 1
Next
For AllLoader = LBound(File) To UBound(File)
    If Len(File(AllLoader)) Then All(iii) = File(AllLoader): iii = iii + 1
Next

If UBound(all) <= 0 Then ChDir (Left$(_CWD$, 3)): GoTo start10

DIRcount = UBound(dir) - 1
FILEcount = UBound(File)
If DIRcount < 0 Then DIRcount = 0
If InStr(1, _OS$, "WINDOWS") Then OS = 0


Do
    Cls
    runit$ = ""
    runit$ = Browse$(All(), 20, 15, 40, 9, DIRcount, Drives$, 1) 'array  contains files/directories names, this list X start coordinate, this list Y start coordinate, This list lenght (300 pixel lenght), 30 records in this list to view), return file/folder/"..", "." name which is selected. Last parameter is for DRIVE characters (names) STRING
    ' Print runit$: Sleep 2



    Select Case OS
        Case 0
            invalid = InStr(1, runit$, "\\")
    End Select
    If invalid Then runit$ = Left$(runit$, invalid) + Right$(runit$, Len(runit$) - invalid - 1)


    If runit$ = "---E" Then Screen 0: GoTo main
    If runit$ = "" Then ChDir Left$(_CWD$, 3): _Delay .1: GoTo start10
    If Right$(runit$, 2) = ".." And _DirExists("..") Then ChDir "..": _Delay .1: GoTo start10
    If Right$(runit$, 5) = ".DIR." Then
        runit$ = Left$(runit$, Len(runit$) - 5)
        ChDir runit$
        _Delay .1
        GoTo start10
    End If

    If Len(runit$) And _FileExists(runit$) Then Open runit$ For Input As #1: GoTo start50
Loop


choosedrive:
GoTo begin2

GoTo choosedrive
handler:

Print "error handler RUN!!!!": Sleep 2
Select Case Err
    Case 76: ChDir Left$(_CWD$, 3) + ":": GoTo start: Resume Next 'path not found ugrade / add + ":" and goto start
End Select
finish:
End



'function GETDAYNAME parameters: YEAR, month0, DAY
'listing of Tuesdays and Thursdays for 40 years

Function GETDAYNR (y1, m1, d1) 'insert year, month0 and day0 and function calculate which day0 in year it is
    For month0 = 1 To m1
        If ISLEAPYEAR(y1) = 0 Then
            Select Case month0
                Case 1: m1 = 31
                Case 2: m1 = 28
                Case 3: m1 = 31
                Case 4: m1 = 30
                Case 5: m1 = 31
                Case 6: m1 = 30
                Case 7: m1 = 31
                Case 8: m1 = 31
                Case 9: m1 = 30
                Case 10: m1 = 31
                Case 11: m1 = 30
                Case 12: m1 = 31
            End Select
        Else
            Select Case month0
                Case 1: m1 = 31
                Case 2: m1 = 29
                Case 3: m1 = 31
                Case 4: m1 = 30
                Case 5: m1 = 31
                Case 6: m1 = 30
                Case 7: m1 = 31
                Case 8: m1 = 31
                Case 9: m1 = 30
                Case 10: m1 = 31
                Case 11: m1 = 30
                Case 12: m1 = 31
            End Select
        End If
        GETDAYNR = GETDAYNR + m1
    Next
    GETDAYNR = GETDAYNR - (m1 - d1)
End Function

Function __GETDAY
    __GETDAY = Val(Mid$(Date$, 4, 2))
End Function


Function GETDATE$ (NrOfTheDayInYear, y1) 'return date 'YYYYMMDD in year y1

    'spocitat mesic
    For month0 = 1 To 12
        If ISLEAPYEAR(y1) = 0 Then
            Select Case month0
                Case 1: m1 = 31
                Case 2: m1 = 28
                Case 3: m1 = 31
                Case 4: m1 = 30
                Case 5: m1 = 31
                Case 6: m1 = 30
                Case 7: m1 = 31
                Case 8: m1 = 31
                Case 9: m1 = 30
                Case 10: m1 = 31
                Case 11: m1 = 30
                Case 12: m1 = 31
            End Select
        Else
            Select Case month0
                Case 1: m1 = 31
                Case 2: m1 = 29
                Case 3: m1 = 31
                Case 4: m1 = 30
                Case 5: m1 = 31
                Case 6: m1 = 30
                Case 7: m1 = 31
                Case 8: m1 = 31
                Case 9: m1 = 30
                Case 10: m1 = 31
                Case 11: m1 = 30
                Case 12: m1 = 31
            End Select
        End If
        oldm = om
        om = om + m1
        If om >= NrOfTheDayInYear And oldm < NrOfTheDayInYear Then Exit For
    Next
    day0 = NrOfTheDayInYear - om + m1
    day0$ = Str$(day0): If Len(day0$) < 3 Then day0$ = "0" + LTrim$(day0$)
    month0$ = Str$(month0): If Len(month0$) < 3 Then month0$ = "0" + LTrim$(month0$)

    GETDATE$ = LTrim$(Str$(y1)) + "-" + LTrim$(month0$) + "-" + LTrim$(day0$)
End Function




Function ISLEAPYEAR (year)
    If year Mod 4 = 0 And year Mod 100 Then ISLEAPYEAR = 1
    If year Mod 100 = 0 And year Mod 400 = 0 Then ISLEAPYEAR = 1
End Function

Function GETDAYNAME$ (year, month0, day0) 'otestovano brutalne, fuguje skutecne spravne!
    '  IF year < 1900 THEN GETDAYNAME$ = "Invalid Year ( <1900 ).": EXIT FUNCTION
    'spocitat pocet mesicu od ledna 1900:
    Dim om As Long, m1 As Long, days As Long
    days = day0
    For yyr = 1 To year
        If yyr = year Then month0end = month0 Else month0end = 12
        For mont = 1 To month0end
            If ISLEAPYEAR(yyr) = 0 Then
                Select Case mont
                    Case 1: m1 = 31
                    Case 2: m1 = 28
                    Case 3: m1 = 31
                    Case 4: m1 = 30
                    Case 5: m1 = 31
                    Case 6: m1 = 30
                    Case 7: m1 = 31
                    Case 8: m1 = 31
                    Case 9: m1 = 30
                    Case 10: m1 = 31
                    Case 11: m1 = 30
                    Case 12: m1 = 31
                End Select
            Else
                Select Case mont
                    Case 1: m1 = 31
                    Case 2: m1 = 29
                    Case 3: m1 = 31
                    Case 4: m1 = 30
                    Case 5: m1 = 31
                    Case 6: m1 = 30
                    Case 7: m1 = 31
                    Case 8: m1 = 31
                    Case 9: m1 = 30
                    Case 10: m1 = 31
                    Case 11: m1 = 30
                    Case 12: m1 = 31
                End Select
            End If
            om = m1
            days = days + m1
        Next
    Next
    days = days - m1 - 1
    '  PRINT "Dnu:"; Days
    a = (days Mod 7) '0 = pondeli
    Restore nms
    For r = 0 To a
        Read GETDAYNAME$
    Next
    nms:
    Data Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
End Function


Function GetDay$ (mm, dd, yyyy) 'use 4 digit year
    'From Zeller's congruence: https://en.wikipedia.org/wiki/Zeller%27s_congruence
    If mm < 3 Then mm = mm + 12: yyyy = yyyy - 1
    century = yyyy Mod 100
    zerocentury = yyyy \ 100
    result = (dd + Int(13 * (mm + 1) / 5) + century + Int(century / 4) + Int(zerocentury / 4) + 5 * zerocentury) Mod 7
    Select Case result
        Case 0: GetDay$ = "Saturday"
        Case 1: GetDay$ = "Sunday"
        Case 2: GetDay$ = "Monday"
        Case 3: GetDay$ = "Tuesday"
        Case 4: GetDay$ = "Wednesday"
        Case 5: GetDay$ = "Thursday"
        Case 6: GetDay$ = "Friday"
    End Select
End Function




'files/directories list using Steve library (u.s. chars only)

'CHDIR "x:" tested on network drive, ok work correctly



Function Browse$ (arr() As String, X, Y, lenght, height, numDirs, Drives As String, UseWheel)
    ' X and Y are coordinates for left upper corner, lenght is window lenght in CHARACTERS, height is window height in records + 2, numDirs = how nmuch
    ' records from begin in array arr() are DIRECTORIES, Drives is string contains valid disk names in Windows, in Linux it is empty string

    ListColor& = _RGB32(166, 244, 244)
    InPosColor& = _RGB32(67, 72, 238)
    DirColor& = _RGB32(238, 22, 28)
    'create string with drives names (i see this first by Eoredson)
    For Driv = 1 To Len(Drives)
        OnScreenDrives$ = OnScreenDrives$ + "[" + Mid$(Drives$, Driv, 1) + ":] "
    Next Driv
    If Len(OnScreenDrives$) > lenght Then OnScreenDrives$ = Left$(OnScreenDrives$, lenght - 3) + LTrim$("...")

    If Lb = 0 And le = 0 Then
        Lb = 1
        le = 20
    End If

    If InStr(1, _OS$, "WINDOWS") Then sel$ = Chr$(92)
    If InStr(1, _OS$, "LINUX") Then sel$ = "/"
    first = 1



    Do
        K& = _KeyHit
        iink$ = UCase$(InKey$)
        If Len(iink$) Then
            If InStr(1, Drives$, iink$) Then
                newdrive$ = iink$ + ":": ChDir newdrive$: Exit Function
            End If
            iink$ = ""
        End If
        oldposx = posx
        If first Then oldposx = -1: first = 0


        'mouse support ---

        While _MouseInput
            MoX = _MouseX: MoY = _MouseY
            If MoX > X And MoX < X + ((lenght + 4) * 8) And MoY > Y And MoY < Y + (height * 20) + 40 Then 'podle LINE

                poloha = _Ceil((MoY - Y - 20) / 20) 'pro mys


                If UseWheel Then ' in function last parameter: 0 = use wheel, 1 = not use wheel
                    Select Case Sgn(_MouseWheel)
                        Case -1: K& = 18432
                        Case 1: K& = 20480
                    End Select

                Else


                    If poloha < posx - Lb Then K& = 18432
                    If poloha > posx - Lb Then K& = 20480
                End If



                If _MouseButton(1) And poloha >= Lb And poloha <= le Then
                    If MoX < (8 * lenght) + X Then K& = 13: _Delay .1

                End If



                If _MouseButton(1) And MoX > (8 * lenght) + X And MoY < Y + 16 Then 'mouse / up arrow
                    K& = 18432
                End If


                If _MouseButton(1) And MoX > (8 * lenght) + X And MoY > Y + (height * 20) + 24 Then 'mouse / down arrow
                    K& = 20480
                End If
            End If

            'podpora prepnuti disku mysi: drive select mouse support (alfa - not full tested)

            If MoX >= X + 10 And MoX < X + 10 + (8 * Len(OnScreenDrives$)) - 8 And MoY >= (Y + 20 * height) + 50 And MoY < (Y + 20 * height) + 66 Then
                If _MouseButton(1) Then
                    DiskSel = _Ceil(((MoX - X + 10) / 8) / 6)
                    If DiskSel > Len(Drives$) Then DiskSel = Len(DiskSel)
                    iink$ = Mid$(Drives$, DiskSel, 1)
                    newdrive$ = iink$ + ":": ChDir newdrive$: Exit Function
                End If
            End If

        Wend
        '------------------


        ' --- keyboard inputs
        Select Case K&
            Case 18432: posx = posx - 1: GU = 1: GD = 0 'marks: Go down disabled, go up enbabled
            Case 20480: posx = posx + 1: GU = 0: GD = 1 'marks: Go down enabled, go up disabled
            Case 13: Browse$ = _CWD$ + sel$ + arr(posx) + dd$: Exit Function 'or if your choice is array record number then return PosX and erase $ in func name 'directory move is solved in my loop
            Case 27: Browse$ = "---E": Exit Function
            Case 32:
        End Select
        ' -------------------

        'if is link selected (not dir):
        If UBound(arr) < 0 Then Exit Function 'Browse$ = LEFT$(_CWD$, 3): EXIT FUNCTION
        'end of bug repair

        If posx <= 0 Then posx = 0: Lb = 0: le = Lb + height
        If posx > UBound(arr) - 1 Then posx = UBound(arr) - 1
        If oldposx <> posx Then
            If posx > le And GD Then Lb = Lb + 1: le = le + 1
            If GU And posx < Lb Then Lb = Lb - 1: le = le - 1
            textpos = 0
            If le > UBound(arr) Then le = UBound(arr)
            If le - Lb > height Then le = Lb + height
            If Lb > le Then Exit Function


            For V = Lb To le 'List Begin to List End
                textpos = textpos + 20 'row is 20 pixel height
                If V = posx Then
                    Color InPosColor&, ListColor&
                Else
                    If V > numDirs - 1 Then Color ListColor& Else Color DirColor&
                    If posx <= numDirs - 1 Then dd$ = ".DIR." Else dd$ = ""
                End If
                text$ = arr(V)
                If Len(text$) > lenght - 2 Then text$ = Left$(text$, lenght - 4) + LTrim$("...") Else text$ = text$ + Space$(lenght - Len(text$) - 1)
                _PrintString (X + 10, Y + textpos), text$
                Color ListColor&, _RGB32(0, 0, 0)


                possss = posx + 1


                Posuvnik_V_Procentech! = (possss / UBound(arr))

                '----------------------------------------------------------------------- dodelat
                WindowHeight = (23 + height * 20) - 40
                OldGC = GC
                GC = Y + WindowHeight * Posuvnik_V_Procentech!

                Color _RGB32(0, 0, 0)
                _PrintString (X + 5 + lenght * _FontWidth, OldGC + 22), Chr$(222)
                Color _RGB32(127, 127, 127)
                _PrintString (X + 5 + lenght * _FontWidth, GC + 22), Chr$(222)

                _PrintString (X + 5 + lenght * _FontWidth, Y + 7), Chr$(24)
                _PrintString (X + 5 + lenght * _FontWidth, 3 + Y + 20 + height * 20), Chr$(25)
                '---------------------------------------------------------------------------

            Next V

            diskar:
            Color _RGB32(255, 255, 0)
            _PrintString (X + 10, (Y + 20 * height) + 50), OnScreenDrives$
            Color _RGB32(255, 205, 249)
            CWD$ = _CWD$
            If Len(CWD$) > lenght Then CWD$ = Left$(CWD$, lenght - 3) + LTrim$("...")
            _PrintString (X + 10, (Y + 20 * height) + 70), CWD$
        End If

        Line (X + 1, Y + 1)-(X + 3 + (8 * lenght) + 16, Y + 3 + (20 * height) + 90), , B
        Line (X + 4, Y + 4)-(X + (8 * lenght) + 16, Y + (20 * height) + 90), , B
        Line (X + 4, Y + (height * 20) + 40)-(X + (8 * lenght) + 16, Y + (height * 20) + 40), , B



        _Limit 80
    Loop
End Function

Function LoadDrives$ (drives() As String)
    If InStr(_OS$, "[WINDOWS]") Then
        Shell _Hide Chr$(34) + "wmic logicaldisk get name" + Chr$(34) + ">TempDirList.txt"
        ReDim drives(0) As String

        Open "TempDirList.txt" For Input As #1
        Line Input #1, junk$ 'First line is  name
        counter = 0
        Do Until EOF(1)
            counter = counter + 1
            Input #1, junk$ 'drive name
            ReDim _Preserve drives(counter) As String
            If Len(junk$) > 1 Then junk$ = Mid$(junk$, 2, 1) + ":" Else junk$ = "": counter = counter - 1
            If junk$ <> "" Then
                drives(counter) = junk$
            End If
        Loop
        Close #1
        Kill "TempDirList.txt"

        For manual = 1 To counter
            LoadDrives$ = LoadDrives$ + Left$(drives(manual), 1)
        Next
    End If
End Function

Sub GetFileList (SearchDirectory As String, DirList() As String, FileList() As String)
    Const IS_DIR = 1
    Const IS_FILE = 2
    Dim flags As Long, file_size As Long

    ReDim _Preserve DirList(100), FileList(100)
    DirCount = 0: FileCount = 0

    If load_dir(SearchDirectory) Then
        Do
            length = has_next_entry
            If length > -1 Then
                nam$ = Space$(length)
                get_next_entry nam$, flags, file_size
                If flags And IS_DIR Then
                    DirCount = DirCount + 1
                    If DirCount > UBound(DirList) Then ReDim _Preserve DirList(UBound(DirList) + 100)
                    DirList(DirCount) = nam$
                ElseIf flags And IS_FILE Then
                    FileCount = FileCount + 1
                    If FileCount > UBound(filelist) Then ReDim _Preserve FileList(UBound(filelist) + 100)
                    FileList(FileCount) = nam$
                End If
            End If
        Loop Until length = -1
        close_dir
    Else
    End If
    ReDim _Preserve DirList(DirCount)
    ReDim _Preserve FileList(FileCount)
End Sub


