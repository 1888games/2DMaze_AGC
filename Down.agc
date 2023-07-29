SETUPMOV

        CA      ZERO            # Load 0 into A
        TS      MATCHMD         # Clear array of 5 that indicates whether two numbers
        TS      MATCH1          # have already been combined for the given row/col
        TS      MATCH2
        TS      MATCH3          # Otherwise moving left on a row of 0-0-1 would end as 2-x-x.
        TS      MATCH4          # When it should be 1-1-x.

        RETURN

MOVE_DOWN                       # The down key (8) has been pressed

        CA      NEG15
        AD      PLAY_Y
        EXTEND
        BZF     NO_DN

        CA      PLAY_POS
        TS      TEMPI

        CA      PLAY_POS
        AD      DEC16
        TS      PLAY_POS

        INDEX   PLAY_POS
        CA      MAZE
        EXTEND
        BZF     OK_DN

        CA      TEMPI
        TS      PLAY_POS

NO_DN
        TCF     MAINLOOP

OK_DN


        INCR    PLAY_Y



UPDATEDISP

        CA      REX_STOP
        AD      NEG5
        TS      REX_STOP

        #TC      COLLISION
        #TC      GETCHUNK
        #TC      DISP15         # Clear the grid

        TCF     MAINLOOP
