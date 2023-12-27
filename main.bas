SCREEN 12

DIM SHARED playerX, playerY, playerVY, onGround

DIM SHARED menuChoice
CONST PLAY_BUTTON = 1
CONST EXIT_BUTTON = 2

playerX = 320
playerY = 100
playerVY = 0
onGround = 0

DO
    ' Clear Screen
    SCREEN 12

    ' Draw Menu
    CALL DrawMenu(menuChoice)

    ' Check for User Input
    CALL CheckInput(menuChoice)

    ' Draw Player
    CIRCLE (playerX, playerY), 10, 14, , , , 0, 360

    ' Move Player
    IF menuChoice = PLAY_BUTTON THEN
        IF INKEY$ <> "" THEN
            IF INKEY$ = " " AND onGround THEN
                playerVY = -10 ' Jump
                onGround = 0
            END IF
        END IF

        playerY = playerY + playerVY

        ' Gravity
        IF playerY < 200 THEN
            playerVY = playerVY + 1
        ELSE
            playerY = 200
            playerVY = 0
            onGround = 1
        END IF
    END IF

    ' Pause for a Moment
    SLEEP 15
LOOP UNTIL INKEY$ <> ""

SUB DrawMenu(choice)
    ' Draw Logo Image
    LINE (150, 50)-(490, 150), 14, BF
    PRINT "CASTLEKICKERS", (320, 100), 0

    ' Draw Play Button
    IF choice = PLAY_BUTTON THEN
        LINE (280, 200)-(360, 240), 14, BF
        PRINT "Play", (320, 220), 0
    ELSE
        LINE (280, 200)-(360, 240), 14, B
        PRINT "Play", (320, 220), 0
    END IF

    ' Draw Exit Button
    IF choice = EXIT_BUTTON THEN
        LINE (280, 260)-(360, 300), 14, BF
        PRINT "Exit", (320, 280), 0
    ELSE
        LINE (280, 260)-(360, 300), 14, B
        PRINT "Exit", (320, 280), 0
    END IF
END SUB

SUB CheckInput(choice)
    IF INKEY$ <> "" THEN
        SELECT CASE INKEY$
            CASE "w", "W"  ' Up
                IF choice > PLAY_BUTTON THEN
                    choice = choice - 1
                END IF
            CASE "s", "S"  ' Down
                IF choice < EXIT_BUTTON THEN
                    choice = choice + 1
                END IF
            CASE CHR$(13)  ' Enter
                SELECT CASE choice
                    CASE PLAY_BUTTON
                        ' Handle Play Button Pressed
                    CASE EXIT_BUTTON
                        END ' Exit the program
                END SELECT
        END SELECT
    END IF
END SUB
