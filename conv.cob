
identification division.
program-id. conv.
environment division.
input-output section.
file-control.
    select standard-output assign to display.

data division.
file section.
fd standard-output.
    01 stdout-record picture x(80).

working-storage section.
01 final-output pic z(04)9.
77 ptr-x pic 99.
77 userInput pic X(30).
77 i picture s99 usage is computational.
77 j picture s99 usage is computational.
77 a picture s99 usage is computational.
01  alphabet-freg.
    05 new-string pic 9999 occurs 30 times.
77 result pic 99(10).

linkage section.
01  Input-String PIC X(30).

procedure division using Input-String.
    move 1 to ptr-x
    string Input-String delimited by space into userInput with pointer ptr-x

    *>check the input is valid or not.
    perform varying i from 1 by 1 until i is greater than ptr-x - 1
        if Input-String(i:1) is not = 'I' and 'i' and 'V' and 'v' and 'X' and 'x' and 'L' and 'l' and 'C' and 'c' and 'D' and 'd' and 'M' and 'm'
            display "Invalid Roman number."
            perform varying a from 1 by 1 until a is greater than ptr-x - 1
                move 0 to new-string(a)
                move 0 to result
            end-perform
            goback
    end-perform

    *> change roman number to decimal number in order to compare and make it case insensitive
    perform varying j from 1 by 1 until j is greater than ptr-x - 1
        if Input-String(j:1) is equal to 'I' or 'i'
            add 1 to new-string(j)
        else if Input-String(j:1) is equal to 'V' or 'v'
            add 5 to new-string(j)
        else if Input-String(j:1) is equal to 'X' or 'x'
            add 10 to new-string(j)
        else if Input-String(j:1) is equal to 'l' or 'L'
            add 50 to new-string(j)
        else if Input-String(j:1) is equal to 'c' or 'C'
            add 100 to new-string(j)
        else if Input-String(j:1) is equal to 'D' or 'd'
            add 500 to new-string(j)
        else if Input-String(j:1) is equal to 'm' or 'M'
            add 1000 to new-string(j)
    end-perform

    *>main part of calculation
    perform varying a from 1 by 1 until a is greater than ptr-x - 1
        if new-string(a) is equal to new-string(a + 1) or greater than new-string(a + 1)
            compute result = result + new-string(a)
        else if new-string(a) is less than new-string(a + 1)
            compute result = result - new-string(a)
    end-perform
    compute result = result + new-string(a)
    move result to final-output
    display "Roman number:" Input-String.
    display "DEC. EQUIV is:" final-output.
    display " "

    *> reset vars for next use
    perform varying a from 1 by 1 until a is greater than ptr-x - 1
        move 0 to new-string(a)
        move 0 to result
    end-perform

 goback.
