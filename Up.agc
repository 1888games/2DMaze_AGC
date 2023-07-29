 # See Down.agc for detailed explanation of how the code
 # to move and combine numbers works. The only differences between them
 # is to reverse directions and/or swap rows for columns (if horizontal)

MOVE_UP

        CA      PLAY_Y
        EXTEND
        BZF     NO_UP

        CA      PLAY_POS
        TS      TEMPI

        CA      NEG16
        AD      PLAY_POS
        TS      PLAY_POS

        INDEX   PLAY_POS
        CA      MAZE
        EXTEND
        BZF     OK_UP

        CA      TEMPI
        TS      PLAY_POS

NO_UP
        TCF     MAINLOOP

OK_UP

        EXTEND
        DIM     PLAY_Y

        TCF     UPDATEDISP


