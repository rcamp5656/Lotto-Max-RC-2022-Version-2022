
'function GETDAYNAME parameters: YEAR, month0, DAY
'listing of Tuesdays and Thursdays for 40 years

FUNCTION GETDAYNR (y1, m1, d1) 'insert year, month0 and day0 and function calculate which day0 in year it is
    FOR month0 = 1 TO m1
        IF ISLEAPYEAR(y1) = 0 THEN
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
    GETDAYNR = GETDAYNR - (m1 - d1)
END FUNCTION

FUNCTION __GETDAY
    __GETDAY = VAL(MID$(DATE$, 4, 2))
END FUNCTION


FUNCTION GETDATE$ (NrOfTheDayInYear, y1) 'return date 'YYYYMMDD in year y1

    'spocitat mesic
    FOR month0 = 1 TO 12
        IF ISLEAPYEAR(y1) = 0 THEN
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
    day0 = NrOfTheDayInYear - om + m1
    day0$ = STR$(day0): IF LEN(day0$) < 3 THEN day0$ = "0" + LTRIM$(day0$)
    month0$ = STR$(month0): IF LEN(month0$) < 3 THEN month0$ = "0" + LTRIM$(month0$)

    GETDATE$ = LTRIM$(STR$(y1)) + "-" + LTRIM$(month0$) + "-" + LTRIM$(day0$)
END FUNCTION




FUNCTION ISLEAPYEAR (year)
    IF year MOD 4 = 0 AND year MOD 100 THEN ISLEAPYEAR = 1
    IF year MOD 100 = 0 AND year MOD 400 = 0 THEN ISLEAPYEAR = 1
END FUNCTION

FUNCTION GETDAYNAME$ (year, month0, day0) 'otestovano brutalne, fuguje skutecne spravne!
    '  IF year < 1900 THEN GETDAYNAME$ = "Invalid Year ( <1900 ).": EXIT FUNCTION
    'spocitat pocet mesicu od ledna 1900:
    DIM om AS LONG, m1 AS LONG, days AS LONG
    days = day0
    FOR yyr = 1 TO year
        IF yyr = year THEN month0end = month0 ELSE month0end = 12
        FOR mont = 1 TO month0end
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
    '  PRINT "Dnu:"; Days
    a = (days MOD 7) '0 = pondeli
    RESTORE nms
    FOR r = 0 TO a
        READ GETDAYNAME$
    NEXT
    nms:
    DATA Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
END FUNCTION


FUNCTION GetDay$ (mm, dd, yyyy) 'use 4 digit year
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


