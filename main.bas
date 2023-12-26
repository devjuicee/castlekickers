SCREEN 12

DIM SHARED playerX, playerY, playerVY, onGround

playerX = 320
playerY = 100
playerVY = 0
onGround = 0

DO
    ' Clear Screen
    SCREEN 12

    ' Draw Player
    CIRCLE (playerX, playerY), 10, 14, , , , 0, 360

    ' Move Player
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

    ' Pause for a Moment
    SLEEP 15
LOOP UNTIL INKEY$ <> ""
