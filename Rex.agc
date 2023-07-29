
MOVE_REX


       # CA      REX_ID          # Get Rex's grid ID
       # EXTEND
      #  SU      PLAY_ID         # Subtract player's grid ID
      ##  EXTEND
      #  BZF     REX_EAT      # If 0 the player has been caught

ARE_SLOW
        CA      REX_STOP        # Are we slowing rex's movement
        EXTEND
        BZMF     CAN_MOVE        # If 0, rex can move now

        EXTEND
        DIM     REX_STOP         # He can't move, reduce delay timer

        RETURN                  # Rex is done for this iteration


CAN_MOVE


        CA      REX_SPEED
        TS      REX_STOP   # Rex moved, so won't move for 4 cycles (unless player does)

        CA      ZERO        # Load 0 into A
        TS      REX_TRY     # Reset 'attempt' counter so we don't get stuck in loop

        EXTEND
        QXCH    RET_ADR     # Store return address because we TC elsewhere


CHECK_X

        TC      CALC_X      # Calc X distance to player

        EXTEND
        BZF     CHECK_Y     # If level with player on X, check Y dist

        TC      CALC_ABSX   # Calc abs X distance to compare with Y later

CHECK_Y

        TC      CALC_Y      # Calc Y distance to player

        EXTEND
        BZF     GET_AXIS    # If level with player on Y, check X too

        TC      CALC_ABSY   # Calc abs Y distance to compare with X now

GET_AXIS                    # At this point, A contains the Y abs distance


        EXTEND
        SU      ABS_X      # Subtract the X abs distance

        EXTEND
        BZMF    TRY_X      # If the X abs distance is greater or equal, try move on X first


TRY_Y

        CA      REX_TRY    # Have we attempted move before
        AD      NEG_ONE    # Reduce attempt count by 1.
        EXTEND
        BZMF    OK_TRY_Y   # Either 0 or 1 attempts so far, ok to try

        TCF     CANT_MOVE  # We've had two attempts, so quit out

OK_TRY_Y

        INCR    REX_TRY    # Increase our attempts to move count

        CA      DIST_Y     # Load the Y distance between rex and player
        EXTEND
        BZF     TRY_X      # If 0, see if we can try X instead
        EXTEND
        BZMF    TRY_UP     # If negative, player is above


TRY_DOWN

        CA      REX_ID     # Get rex position in grid
        AD      DEC16      # Move to cell below
        TS      REX_NEW        # Store possible new cell
        INDEX   REX_NEW        # Index by cell above's ID
        CA      MAZE       # Get whether wall or empty
        EXTEND
        BZF     REX_DOWN     # If zero, cell is empty

        TCF     TRY_X      # See if X movement is possible

REX_DOWN

        CA      REX_NEW        # Load new rex grid pos
        TS      REX_ID     # Save it to RAM

        INCR    REX_Y      # Move rex to row below

        TCF     REX_MOVED  # He moved, so delay his next move


TRY_UP

        CA      REX_ID     # Get rex position in grid
        AD      NEG16      # Move to cell above
        TS      REX_NEW        # Store possible new cell
        INDEX   REX_NEW        # Index by cell above's ID
        CA      MAZE       # Get whether wall or empty
        EXTEND
        BZF     REX_UP     # If zero, cell is empty

        TCF     TRY_X      # See if X movement is possible

REX_UP

        CA      REX_NEW        # Load new rex grid pos
        TS      REX_ID     # Save it to RAM

        EXTEND
        DIM     REX_Y      # Move rex to row above

        TCF     REX_MOVED  # He moved, so delay his next move




TRY_X

        CA      REX_TRY    # Have we attempted move before
        AD      NEG_ONE    # Reduce attempt count by 1.
        EXTEND
        BZMF    OK_TRY_X   # Either 0 or 1 attempts so far, ok to try

        TCF     CANT_MOVE  # We've had two attempts, so quit out

OK_TRY_X

        INCR    REX_TRY    # Increase our attempts to move count

        CA      DIST_X     # Load the X distance between rex and player
        EXTEND
        BZF     TRY_Y      # If 0, see if we can try Y instead
        EXTEND
        BZMF    TRY_LEFT   # If negative, player is to left


TRY_RIGHT

        CA      REX_ID     # Get rex position in grid
        AD      DEC1       # Move to cell to right
        TS      REX_NEW        # Store possible new cell
        INDEX   REX_NEW       # Index by cell above's ID
        CA      MAZE       # Get whether wall or empty
        EXTEND
        BZF     REX_RIGHT  # If zero, cell is empty

        TCF     TRY_Y      # Is wall, see if Y movement is possible

REX_RIGHT

        CA      REX_NEW       # Load new rex grid pos
        TS      REX_ID     # Save it to RAM

        INCR    REX_X     # Move rex to next cell

        TCF     REX_MOVED  # He moved, so delay his next move


TRY_LEFT

        CA      REX_ID     # Get rex position in grid
        AD      NEG1       # Move to cell to left
        TS      REX_NEW        # Store possible new cell
        INDEX   REX_NEW        # Index by cell above's ID
        CA      MAZE       # Get whether wall or empty
        EXTEND
        BZF     REX_LEFT     # If zero, cell is empty

        TCF     TRY_Y      # is wall, see if Y movement is possible

REX_LEFT

        CA      REX_NEW       # Load new rex grid pos
        TS      REX_ID     # Save it to RAM

        EXTEND
        DIM     REX_X      # Move rex to previous cell

        TCF     REX_MOVED  # He moved, so delay his next move


REX_MOVED


CANT_MOVE

        EXTEND
        QXCH    RET_ADR    # Restore return address of caller
        RETURN





GOT_PLAYER




        RETURN


CALC_X

        CA      PLAY_X
        EXTEND
        SU      REX_X
        TS      DIST_X
        TS      ABS_X

        RETURN


CALC_ABSX

        EXTEND
        BZMF    PLAY_LEFT  # If distance is neg, player is to left

        TCF     GOT_X      # Distance is positive, so absX = distX

PLAY_LEFT

        COM                # Reverse A, so ABS_X is correct
GOT_X
        TS      ABS_X

        RETURN



CALC_Y

        CA      PLAY_Y
        EXTEND
        SU      REX_Y
        TS      DIST_Y
        TS      ABS_Y

        RETURN

CALC_ABSY

        EXTEND
        BZMF    PLAY_ABV

PLAY_ABV
        COM

GT_Y_DIST
        TS      ABS_Y

        RETURN




CHECK_REX

        CA      REX_ID
        EXTEND
        SU      PLAY_POS
        EXTEND
        BZF     REX_EAT

        CA      ABS_X
        AD      ABS_Y
        AD      NEG6
        EXTEND
        BZMF    REX_CLOSE

REX_FAR


        CA      NO_VN
        EXTEND
        WAND    CH11
        RETURN

REX_CLOSE

        CS      NO_VN
        EXTEND
        WOR     CH11

EXIT_REX
        RETURN


REX_EAT

        CA      SCORE_THO
        EXTEND
        SU      HI_THO
        EXTEND
        BZF     CHK_HUN
        EXTEND
        BZMF    NO_HI

        TCF     IS_HI

CHK_HUN

        CA      SCORE_HUN
        EXTEND
        SU      HI_HUN
        EXTEND
        BZF     CHK_TEN
        EXTEND
        BZMF    NO_HI

        TCF     IS_HI

CHK_TEN

        CA      SCORE_TEN
        EXTEND
        SU      HI_TEN
        EXTEND
        BZF     CHK_DIG
        EXTEND
        BZMF    NO_HI

        TCF     IS_HI

CHK_DIG

        CA      SCORE_DIG
        EXTEND
        SU      HI_DIG
        EXTEND
        BZMF    NO_HI

IS_HI

        CA      SCORE_THO
        TS      HI_THO

        CA      SCORE_TEN
        TS      HI_TEN

        CA      SCORE_HUN
        TS      HI_HUN

        CA      SCORE_DIG
        TS      HI_DIG

NO_HI
        CA      ALL_LIGHT
        EXTEND
        WRITE   CH11

        CA      DEC4
        INDEX   PLAY_DIG
        TS      VALUES

        CA      PLAY_DIG
        TS      CUR_ID
        TC      DISPNUM

        CA      NINETY6
        TS      CUR_ID

END_LP


        TC      IODELAY

        EXTEND
        DIM     CUR_ID

        CA      CUR_ID
        EXTEND
        BZF     BKSTART

        TCF     END_LP

BKSTART

        TCF     PLAY_AGN

        RETURN

