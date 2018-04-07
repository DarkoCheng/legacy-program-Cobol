perform varying j from 1 by 1 until j is greater than ptr-x - 1
    if Input-String(j:1) is equal to 'I' or 'i'
        new-string(i:1) = 1
    *>if Input-String(i:1) is equal to 'V' or 'v'
    *>    new-string(i:1) = 2
    *>if Input-String(i:1) is equal to 'X' or 'x'
    *>    new-string(i:1) = 3
    *>if Input-String(i:1) is equal to 'L' or 'l'
    *>    new-string(i:1) = 4
    *>if Input-String(i:1) is equal to 'C' or 'c'
    *>    new-string(i:1) = 5
    *>if Input-String(i:1) is equal to 'D' or 'd'
    *>    new-string(i:1) = 6
    *>if Input-String(i:1) is equal to 'm' or 'M'
    *>    new-string(i:1) = 7
end-perform

perform varying a from 1 by 1 until i is greater than ptr-x - 1
    if new-string(a:1) is = new-string(a+1:1) or greater than new-string(a+1:1)
        if new-string(a:1) is = 1
            result = result + 1
        else if new-string(a:1) is = 2
            result = result + 5
        else if new-string(a:1) is = 3
            result = result + 10
        else if new-string(a:1) is = 4
            result = result + 50
        eles if new-string(a:1) is = 5
            result = result + 100
        else if new-string(a:1) is = 6
            result = result + 500
        else if new-string(i:1) is = 7
            resilt = result + 1000
    end if
end-perform
display result.
