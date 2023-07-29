
HIDE_OBJS
        EXTEND
        QXCH    RET_ADR         # Restore return address of caller



HIDE_KEY

        TC      RAND256
        TS      TEMPI
        INDEX   A
        CA      MAZE
        EXTEND
        BZF     DO_KEY

        TCF     HIDE_KEY

DO_KEY

        CA      TEMPI
        TS      KEY_ID


HIDE_EXIT

        TC      RAND256
        TS      TEMPI
        INDEX   A
        CA      MAZE
        EXTEND
        BZF     DO_EXIT


        TCF     HIDE_EXIT

DO_EXIT

        CA      TEMPI
        EXTEND
        SU      KEY_ID
        EXTEND
        BZF     HIDE_EXIT

        CA      TEMPI
        TS      EXIT_ID


        CA      ZERO
        TS      REX_X

        CA      DEC15
        TS      REX_Y

        CA      CORNERBL
        TS      REX_ID

        TCF     SKIP_RE

        CA      DEC2
        TS      REX_X
        TS      REX_ID

        CA      ZERO
        TS      MAZE1
        TS      MAZE2
        TS      REX_Y

SKIP_RE
        # CA      DEC1
        # TS      KEY_ID
        # CA      DEC2
        # TS      EXIT_ID



        EXTEND
        QXCH    RET_ADR         # Restore return address of caller

        RETURN



