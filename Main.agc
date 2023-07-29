
		SETLOC	4000


RESTART
		INHINT			# Turn off interrupts
		CA	O37774		# Schedule the first TIME3 interrupt
                TS	TIME3

		TCF	INIT		# Proceed with initialization

$Vectors.agc                            # Add table of interrupt vectors

		# Initialization.
INIT

                CA      INIT_DONE
                AD      NEG10
                EXTEND
                BZF     RES_JUMP


                CA      DEC10
                TS      INIT_DONE

                CA      TIMER4
                TS      TIME4

                CA      ZERO
                TS      HI_THO
                TS      HI_TEN
                TS      HI_DIG
                TS      HI_HUN

PLAY_AGN
		CA	ZERO	       # Load 0 to A
                TS      ACTIVE         # Set game not started
                TS      GM_DONE        # Set game not completed
                TS      PLAY_ID
                TS      PLAY_X
                TS      PLAY_Y

                CA      ZERO
                TS      LEVEL


                CA      TWENTY
                TS      REX_SPEED

                CA      DEC13
                TS      PLAY_DIG

                CA      NEWJOB

                TC      RESETALL       # Set all grid items to empty (-1)
                TC      DISP15         # Clear the grid


                CA      HI_TEN
                TS      SCORE_TEN

                CA      HI_HUN
                TS      SCORE_HUN

                CA      HI_DIG
                TS      SCORE_DIG

                CA      HI_THO
                TS      SCORE_THO

                CA      NEG_ONE
                TS      VALUES
                TS      VALUES1



                CA      STA_WAIT       # Set game status to wait for any key
                TS      GM_STATE


NEW_GAME
              #  TC      ALL_WALLS


                CA      ZERO
                EXTEND
                WRITE   CH11           # Clear any DSKY lights

                CA      LIGHTS
                AD      BIT6
                EXTEND
                WRITE   CH10


                CA      NOKEY          # Clear the keypad buffer variable
                TS      KEYBUF         # to initially hold an illegal keycode.


RES_JUMP
                CA      ZERO
                TS      REX_NEAR

                RELINT                 # Enable interrupts

MAINLOOP
                CS      NEWJOB         # Each loop, nudge hardware watchdog



                CA      ZERO
                TS      CUR_ID
                TC      DISPNUM


                CA      DEC2
                TS      CUR_ID
                TC      DISPNUM

                CA      DEC4
                TS      CUR_ID
                TC      DISPNUM

                TC      IODELAY

                CA      ACTIVE
                EXTEND
                BZF     DONEDISP

                CS      NEWJOB

                TC      CHECK_REX
                TC      MOVE_REX

                CS      NEWJOB

                TC      COLLISION
                TC      GETCHUNK
                TC      DISP15

                CS      NEWJOB

                TC      CHECK_REX


DONEDISP

CHK_STATE

                INDEX	GM_STATE        # Index into game state jump table
                TCF	ST_TABLE        # Will jump to appropriate function below based on state
ST_TABLE
                TCF	CHECK_KEY	# 0
                TCF	CHECK_KEY	# 1
                TCF	CHECK_KEY       # 2
                TCF	CHECK_KEY      # 3
                TCF	CHECK_KEY       # 4
                TCF     CHECK_KEY         # 5
                TCF     WAITKEY        # 6


# Include the rest of the code modules below

$Grid.agc
$Down.agc
$Up.agc
$Left.agc
$Right.agc
$Display.agc
$Interrupts.agc
$Input.agc
$Random.agc
$Rex.agc
$Generate.agc
$Hide.agc
$Maze.agc
$Constants.agc
$Tables.agc
$Ram.agc

