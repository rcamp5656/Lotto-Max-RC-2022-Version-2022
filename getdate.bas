
'function GETDAYNAME parameters: year0, month0, DAY0
'listing of Tuesdays and Thursdays for 40 years
'FUNCTION GETDAYNR is upgraded and must be copyed to your program for correct work!


DIM SHARED VirtualYear

DIM D1 AS INTEGER, Mnth AS INTEGER, VirtualYear AS INTEGER


INPUT "Insert DAY0, month0, year0: "; D1, Mnth, VirtualYear
INPUT "How much days find"; total
IF Mnth < 0 OR Mnth > 12 THEN PRINT "Invalid value for month0": SLEEP 2: END
IF D1 < 0 OR D1 > 31 THEN PRINT "Invalid value for DAY0": SLEEP 2: END



'this is repaired     ------------------------------------------------------------------------------------------
FOR l = 1 TO total
    D1 = D1 + 1

    today$ = ""
    DO UNTIL today$ = "Friday" OR today$ = "Tuesday"
        today$ = GETDAYNAME(VirtualYear, Mnth, D1)
        D1 = D1 + 1

    LOOP
    D1 = D1 - 1

    DAY0 = GETDAYNR(VirtualYear, Mnth, D1)

    IF ISLEAPYEAR(VirtualYear) AND DAY0 > 366 THEN VirtualYear = VirtualYear + 1: DAY0 = DAY0 - 366: D1 = D1 - 366
    IF ISLEAPYEAR(VirtualYear) = 0 AND DAY0 > 365 THEN VirtualYear = VirtualYear + 1: DAY0 = DAY0 - 365: D1 = D1 - 365

    realdate$ = GETDATE$(DAY0, VirtualYear)

    PRINT "Next date is "; realdate$; " "; GETDAYNAME(VirtualYear, Mnth, D1); ", Week:"; 1 + DAY0 \ 7
    SLEEP
NEXT
'this is repaired     ------------------------------------------------------------------------------------------



FUNCTION GETDAYNR (y0, mn, D1) 'insert year0, month0 and DAY0 and function calculate which DAY0 in year0 it is
    FOR month0 = 1 TO mn
        IF ISLEAPYEAR(y0) = 0 THEN
            SELECT CASE month0
                CASE 1: m1 = 31
                CASE 2: m1 = 28
                CASE 3: m1 = 31
                CASE 4: m1 = 30
                CASE 5: m1 = 31
                CASE 6: m1 = 30
                CASE 7: m1 = 31
                CASE 8: m1 = 31
                CASE 9: m1 = 30
                CASE 10: m1 = 31
                CASE 11: m1 = 30
                CASE 12: m1 = 31
            END SELECT
        ELSE
            SELECT CASE month0
                CASE 1: m1 = 31
                CASE 2: m1 = 29
                CASE 3: m1 = 31
                CASE 4: m1 = 30
                CASE 5: m1 = 31
                CASE 6: m1 = 30
                CASE 7: m1 = 31
                CASE 8: m1 = 31
                CASE 9: m1 = 30
                CASE 10: m1 = 31
                CASE 11: m1 = 30
                CASE 12: m1 = 31
            END SELECT
        END IF
        GETDAYNR = GETDAYNR + m1
    NEXT
    GETDAYNR = GETDAYNR - (m1 - D1)
END FUNCTION

FUNCTION __GETDAY
    __GETDAY = VAL(MID$(DATE$, 4, 2))
END FUNCTION


FUNCTION GETDATE$ (NrOfTheDayInYear, y0) 'return date 'YYYYMMDD in year0 y0
    FOR month0 = 1 TO 12
        IF ISLEAPYEAR(y0) = 0 THEN
            SELECT CASE month0
                CASE 1: m1 = 31
                CASE 2: m1 = 28
                CASE 3: m1 = 31
                CASE 4: m1 = 30
                CASE 5: m1 = 31
                CASE 6: m1 = 30
                CASE 7: m1 = 31
                CASE 8: m1 = 31
                CASE 9: m1 = 30
                CASE 10: m1 = 31
                CASE 11: m1 = 30
                CASE 12: m1 = 31
            END SELECT
        ELSE
            SELECT CASE month0
                CASE 1: m1 = 31
                CASE 2: m1 = 29
                CASE 3: m1 = 31
                CASE 4: m1 = 30
                CASE 5: m1 = 31
                CASE 6: m1 = 30
                CASE 7: m1 = 31
                CASE 8: m1 = 31
                CASE 9: m1 = 30
                CASE 10: m1 = 31
                CASE 11: m1 = 30
                CASE 12: m1 = 31
            END SELECT
        END IF
        oldm = om
        om = om + m1
        IF om >= NrOfTheDayInYear AND oldm < NrOfTheDayInYear THEN EXIT FOR
    NEXT
    DAY0 = NrOfTheDayInYear - om + m1
    DAY0$ = STR$(DAY0): IF LEN(DAY0$) < 3 THEN DAY0$ = "0" + LTRIM$(DAY0$)
    month0$ = STR$(month0): IF LEN(month0$) < 3 THEN month0$ = "0" + LTRIM$(month0$)

    GETDATE$ = LTRIM$(STR$(y0)) + "-" + LTRIM$(month0$) + "-" + LTRIM$(DAY0$)
END FUNCTION




FUNCTION ISLEAPYEAR (year0)
    IF year0 MOD 4 = 0 AND year0 MOD 100 THEN ISLEAPYEAR = 1
    IF year0 MOD 100 = 0 AND year0 MOD 400 = 0 THEN ISLEAPYEAR = 1
END FUNCTION

FUNCTION GETDAYNAME$ (year0, mmonth, DAY0) 'otestovano brutalne, fuguje skutecne spravne!
    DIM om AS LONG, m1 AS LONG, days AS LONG
    days = DAY0
    FOR yyr = 1 TO year0
        IF yyr = year0 THEN monthend0 = mmonth ELSE monthend0 = 12
        FOR mont = 1 TO monthend0
            IF ISLEAPYEAR(yyr) = 0 THEN
                SELECT CASE mont
                    CASE 1: m1 = 31
                    CASE 2: m1 = 28
                    CASE 3: m1 = 31
                    CASE 4: m1 = 30
                    CASE 5: m1 = 31
                    CASE 6: m1 = 30
                    CASE 7: m1 = 31
                    CASE 8: m1 = 31
                    CASE 9: m1 = 30
                    CASE 10: m1 = 31
                    CASE 11: m1 = 30
                    CASE 12: m1 = 31
                END SELECT
            ELSE
                SELECT CASE mont
                    CASE 1: m1 = 31
                    CASE 2: m1 = 29
                    CASE 3: m1 = 31
                    CASE 4: m1 = 30
                    CASE 5: m1 = 31
                    CASE 6: m1 = 30
                    CASE 7: m1 = 31
                    CASE 8: m1 = 31
                    CASE 9: m1 = 30
                    CASE 10: m1 = 31
                    CASE 11: m1 = 30
                    CASE 12: m1 = 31
                END SELECT
            END IF
            om = m1
            days = days + m1
        NEXT
    NEXT
    days = days - m1 - 1
    a = (days MOD 7)
    RESTORE nms
    FOR r = 0 TO a
        READ GETDAYNAME$
    NEXT
    nms:
    DATA Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
END FUNCTION


FUNCTION GetDay$ (mm, dd, yyyy) 'use 4 digit year0
    'From Zeller's congruence: https://en.wikipedia.org/wiki/Zeller%27s_congruence
    IF mm < 3 THEN mm = mm + 12: yyyy = yyyy - 1
    century = yyyy MOD 100
    zerocentury = yyyy \ 100
    result = (dd + INT(13 * (mm + 1) / 5) + century + INT(century / 4) + INT(zerocentury / 4) + 5 * zerocentury) MOD 7
    SELECT CASE result
        CASE 0: GetDay$ = "Saturday"
        CASE 1: GetDay$ = "Sunday"
        CASE 2: GetDay$ = "Monday"
        CASE 3: GetDay$ = "Tuesday"
        CASE 4: GetDay$ = "Wednesday"
        CASE 5: GetDay$ = "Thursday"
        CASE 6: GetDay$ = "Friday"
    END SELECT
END FUNCTION


