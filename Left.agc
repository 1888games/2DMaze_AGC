 # See Down.agc for detailed explanation of how the code
 # to move and combine numbers works. The only differences between them
 # is to reverse directions and/or swap rows for columns (if horizontal)

MOVE_LEFT

        CA      PLAY_X
        EXTEND
        BZF     NO_LT

        CA      PLAY_POS
        TS      TEMPI

        CA      NEG_ONE
        ADS     PLAY_POS

        INDEX   PLAY_POS
        CA      MAZE
        EXTEND
        BZF     OK_LT

        CA      TEMPI
        TS      PLAY_POS

NO_LT
        TCF     MAINLOOP

OK_LT

        EXTEND
        DIM     PLAY_X

        TCF     UPDATEDISP


