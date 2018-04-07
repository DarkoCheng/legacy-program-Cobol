identification division.
program-id. romannumerals.
environment division.
input-output section.
file-control.
    select standard-input assign to keyboard.
    select standard-output assign to display.
    select fileInput assign to input-string
      organization is line sequential.

data division.
file section.
fd standard-input.
    01 stdin-record picture x(80).
fd standard-output.
    01 stdout-record picture x(80).
working-storage section.
01 Input-Int pic 9(1).
01 Input-String pic x(30).
01 WS-EOF picture a(1).

procedure division.
    move 1 to input-int
    open input standard-input, output standard-output.
    perform until Input-Int is equal to 0
    display "Please enter 1 for file input or 2 for normal input and 0 for quit"
    accept Input-Int
    if Input-Int is equal to 2 then
        display "Enter roman numbre in one line:"
        accept Input-String
        call "conv" using Input-String
    else if Input-Int is equal to 1 then
        display "Enter file name eg. (input.txt):"
        accept input-String
        open input fileInput
        perform until WS-EOF = 'Y'
            read fileInput into Input-String
                at end move 'Y' to WS-EOF
                not at end call "conv" using Input-String
            end-read
        end-perform
        close fileInput
    else if input-int is equal to 0 then
        display "Thank you for using."
    else
        display "Invalid choice."
    end-perform
    close standard-input, standard-output.
    stop run.
