Screen 12

Dim Shared playerX, playerY, playerVY, onGround

Dim Shared menuChoice
Const PLAY_BUTTON = 1
Const EXIT_BUTTON = 2

playerX = 320
playerY = 100
playerVY = 0
onGround = 0

Do
    ' Clear Screen
    Screen 12

    ' Draw Menu
    Call DrawMenu(menuChoice)

    ' Check for User Input
    Call CheckInput(menuChoice)

    ' Draw Player
    Circle (playerX, playerY), 10, 14

    ' Move Player
    If menuChoice = PLAY_BUTTON Then
        If InKey$ <> "" Then
            If InKey$ = " " And onGround Then
                playerVY = -10 ' Jump
                onGround = 0
            End If
        End If

        playerY = playerY + playerVY

        ' Gravity
        If playerY < 200 Then
            playerVY = playerVY + 1
        Else
            playerY = 200
            playerVY = 0
            onGround = 1
        End If
    End If

    ' Pause for a Moment
    Sleep 15
Loop Until InKey$ <> ""

Sub DrawMenu (choice)
    ' Draw Logo Image
    Line (150, 50)-(490, 150), 14, BF
    Print "CASTLEKICKERS",
    Locate 10, 14

    ' Draw Play Button
    If choice = PLAY_BUTTON Then
        Line (280, 200)-(360, 240), 14, BF
        Print "Play",
    Else
        Line (280, 200)-(360, 240), 14, B
        Print "Play",
    End If

    ' Draw Exit Button
    If choice = EXIT_BUTTON Then
        Line (280, 260)-(360, 300), 14, BF
        Print "Exit",
    Else
        Line (280, 260)-(360, 300), 14, B
        PRINT "Exit",
    End If
End Sub

Sub CheckInput (choice)
    If InKey$ <> "" Then
        Select Case InKey$
            Case "w", "W" ' Up
                If choice > PLAY_BUTTON Then
                    choice = choice - 1
                End If
            Case "s", "S" ' Down
                If choice < EXIT_BUTTON Then
                    choice = choice + 1
                End If
            Case Chr$(13) ' Enter
                Select Case choice
                    Case PLAY_BUTTON
                        ' Handle Play Button Pressed
                    Case EXIT_BUTTON
                        End ' Exit the program
                End Select
        End Select
    End If
End Sub
