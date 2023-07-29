
ALL_WALLS


                CA      TWO56         # Set loop counter to 21
                TS      CUR_ID
WALLOOP

                EXTEND
                DIM     CUR_ID          # Decrement id so we start at 255, end at 0
                CA      DEC1           # Load -1 to A (empty cell)
                INDEX   CUR_ID          # Index by current loop count
                TS      MAZE          # Save -1 to empty this grid cell

                CA      CUR_ID          # Load loop counter
                EXTEND
                BZF     WALLEND        # If zero, we've cleared all of VALUES array

                TCF     WALLOOP       # Not zero, loop back for next cell

WALLEND

                RETURN                     # Return to Init








GEN_MAZE

                EXTEND
                QXCH    RET_ADR         # Restore return address of caller

                CA      ZERO
                TS      PLAY_X
                TS      PLAY_Y
                TS      PLAY_ID
                TS      MAZE

                CA      ZERO
                TS      CORNER_ID

NUM_LOOP

                CA      FOURTY8     # Load number of attempts to dig passages
                TS      TRY_ID          # Store in loop counter

                CA      DEC5
                EXTEND
                SU      CORNER_ID
                TS      VALUES
                CA      ZERO
                TS      CUR_ID
                TC      DISPNUM


ITERATION

                CS      NEWJOB


                TC      RANDOM          # Get a random number from 0-9
                MASK    MASK3           # Reduce the number to 0-7
                AD      DEC1            # Add 1 so it is between 1-8
                TS      PATH_LEN        # Store as the length of path to ad

                TC      RANDOM          # Get random number from 0-9
                MASK    MASK3           # Reduce the number to 0-3
                TS      PATH_DIR        # Store as the direction to try in


PATH_LOOP

                CS      NEWJOB

                INDEX   PATH_DIR        # Index by dig direction
                TCF     DIR_JUMP        # Jump to appropriate dig function
DIR_JUMP

                TCF     RIGHT
                TCF     LEFT
                TCF     UP
                TCF     DOWN


RIGHT
                CA      PLAY_ID
                AD      DEC1
                TS      NEW_ID

                CA      PLAY_X
                AD      DEC1
                TS      NEW_X


                CA      PLAY_X
                AD      NEG15
                EXTEND
                BZF     QUIT

                TCF     HORIZ


LEFT
                CA      PLAY_ID
                AD      NEG1
                TS      NEW_ID

                CA      PLAY_X
                AD      NEG1
                TS      NEW_X

                CA      PLAY_X
                EXTEND
                BZF     QUIT

HORIZ

                INDEX   NEW_ID
                CA      MAZE
                EXTEND
                BZF     NO_BELOW

IS_WALL1
                CA      PLAY_Y
                EXTEND
                BZF     NO_ABOVE

                CA      NEW_ID
                AD      NEG16
                INDEX   A
                CA      MAZE
                EXTEND
                BZF     QUIT

NO_ABOVE
                CA      PLAY_Y
                AD      NEG15
                EXTEND
                BZF     NO_BELOW

                CA      NEW_ID
                AD      DEC16
                INDEX   A
                CA      MAZE
                EXTEND
                BZF     QUIT

NO_BELOW

                CA      NEW_X
                TS      PLAY_X
                TCF     SETPATH


DOWN
                CA      PLAY_ID
                AD      DEC16
                TS      NEW_ID

                CA      PLAY_Y
                AD      DEC1
                TS      NEW_Y


                CA      PLAY_Y
                AD      NEG15
                EXTEND
                BZF     QUIT

                TCF     VERTI


UP
                CA      PLAY_ID
                AD      NEG16
                TS      NEW_ID

                CA      PLAY_Y
                AD      NEG1
                TS      NEW_Y


                CA      PLAY_Y
                EXTEND
                BZF     QUIT

VERTI

                INDEX   NEW_ID
                CA      MAZE
                EXTEND
                BZF     NO_RIGHT

IS_WALL2
                CA      PLAY_X
                EXTEND
                BZF     NO_LEFT

                CA      NEW_ID
                AD      NEG1
                INDEX   A
                CA      MAZE
                EXTEND
                BZF     QUIT

NO_LEFT
                CA      PLAY_X
                AD      NEG15
                EXTEND
                BZF     NO_RIGHT

                CA      NEW_ID
                AD      DEC1
                INDEX   A
                CA      MAZE
                EXTEND
                BZF     QUIT

NO_RIGHT

                CA      NEW_Y
                TS      PLAY_Y
                TCF     SETPATH

SETPATH
                CA      NEW_ID
                TS      PLAY_ID

                CA      ZERO
                INDEX   PLAY_ID
                TS      MAZE

                CA      PATH_LEN
                EXTEND
                BZF     QUIT

                EXTEND
                DIM     PATH_LEN

                TCF     PATH_LOOP


QUIT

                CA      TRY_ID
                EXTEND
                BZF     ALL_DONEY

                EXTEND
                DIM     TRY_ID
                TCF     ITERATION

ALL_DONEY

        CA      TEN
        TS      CUR_ID
DEL_LP

        TC      IODELAY

        EXTEND
        DIM     CUR_ID

        CA      CUR_ID
        EXTEND
        BZF     GMSTART

        TCF     DEL_LP

GMSTART

                INCR    CORNER_ID
                CA      CORNER_ID
                AD      NEG5
                EXTEND
                BZF     NO_MORE

                TCF     NUM_LOOP
NO_MORE

                EXTEND
                QXCH    RET_ADR         # Restore return address of caller
                RETURN
