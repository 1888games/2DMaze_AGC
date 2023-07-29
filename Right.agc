
 # See Down.agc for detailed explanation of how the code
 # to move and combine numbers works. The only differences between them
 # is to reverse directions and/or swap rows for columns (if horizontal)

MOVE_RT

        CA      NEG15
        AD      PLAY_X
        EXTEND
        BZF     NO_RT

        CA      PLAY_POS
        TS      TEMPI

        INCR    PLAY_POS
        INDEX   PLAY_POS
        CA      MAZE
        EXTEND
        BZF     OK_RT

        CA      TEMPI
        TS      PLAY_POS
NO_RT
        TCF     MAINLOOP



OK_RT

        INCR    PLAY_X

        TCF     UPDATEDISP

