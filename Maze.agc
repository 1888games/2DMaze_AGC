
        SETLOC  6000

GETCHUNK

        CA      DEC6
        TS      CUR_ID

        CA      PLAY_X
        AD      NEG2
        TS      MAP_X
        TS      DRAW_X
        AD      DEC5
        TS      END_X

        CA      PLAY_Y
        AD      NEG1
        TS      MAP_Y
        TS      DRAW_Y
        AD      DEC3
        TS      END_Y

        CA      PLAY_POS
        AD      NEG18
        TS      MAP_POS
        TS      MAP_ID


COPY_ROW

        CA      DRAW_X
        AD      DEC1
        EXTEND
        BZMF    OUTMAP

        CA      DRAW_Y
        AD      DEC1
        EXTEND
        BZMF    OUTMAP

        CA      DRAW_X
        AD      NEG15
        EXTEND
        BZMF    X_OK

        TCF     OUTMAP

X_OK

        CA      DRAW_Y
        AD      NEG15
        EXTEND
        BZMF    INBOUNDS

OUTMAP
        CA      DEC8
        TCF     NOCHK

INBOUNDS

        INDEX   MAP_ID
        CA      MAZE
        AD      NEG_ONE

NOWDRAW

        TS      TEMPI

        CA      MAP_ID
        EXTEND
        SU      KEY_ID
        EXTEND
        BZF     DOKEY

        CA      MAP_ID
        EXTEND
        SU      EXIT_ID
        EXTEND
        BZF     DOEXIT

        CA      MAP_ID
        EXTEND
        SU      REX_ID
        EXTEND
        BZF     DOREX

        CA      TEMPI

NOCHK
        TCF     NOOBJS

DOEXIT

        CA      DEC7
        TCF     NOOBJS

DOKEY

        CA      DEC9
        TCF     NOOBJS

DOREX

        CA      DEC4

NOOBJS

        INDEX   CUR_ID
        TS      VALUES

        INCR    CUR_ID
        INCR    MAP_ID

        INCR    DRAW_X
        CA      DRAW_X
        EXTEND
        SU      END_X
        EXTEND
        BZF     END_ROW

        TCF     COPY_ROW

END_ROW

        CA      MAP_X
        TS      DRAW_X

        CA      MAP_ID
        AD      DEC11
        TS      MAP_ID

        INCR    DRAW_Y
        CA      DRAW_Y
        EXTEND
        SU      END_Y
        EXTEND
        BZF     COPY_DONE

        TCF     COPY_ROW


COPY_DONE

        CA      DEC1
        INDEX   PLAY_DIG
        TS      VALUES

        RETURN


COLLISION

        CA      PLAY_POS
        EXTEND
        SU      KEY_ID
        EXTEND
        BZF     OVER_KEY

        CA      TWO56
        EXTEND
        SU      KEY_ID
        EXTEND
        BZF     HAVE_KEY

        TCF     NO_KEY


HAVE_KEY

        CA      PLAY_POS
        EXTEND
        SU      EXIT_ID
        EXTEND
        BZF     OPEN_DOOR

        TCF     NO_KEY

OPEN_DOOR


        TS      NEWJOB

        CA      ZERO
        TS      ACTIVE

        CA      SEC_DIGS
        AD      SCORE_DIG
        TS      SCORE_DIG

        AD      NEG10
        EXTEND
        BZF     TEN_W
        EXTEND
        BZMF    NO_TW

TEN_W
        TS      SCORE_DIG

        INCR    SCORE_TEN

NO_TW



        CA      SEC_TENS
        AD      SCORE_TEN
        TS      SCORE_TEN

        AD      NEG10
        EXTEND
        BZF     HUN_W
        EXTEND
        BZMF    NO_HW

HUN_W
        TS      SCORE_TEN

        INCR    SCORE_HUN

NO_HW

        CA      SCORE_HUN
        AD      NEG10
        EXTEND
        BZF     THOU_W

        TCF     SHOW_SCO

THOU_W

        INCR    SCORE_THO

SHOW_SCO

        EXTEND
        QXCH    RET_ADR2         # Restore return address of caller


        CA      REX_SPEED
        AD      NEG10
        EXTEND
        BZMF    FAST_NOW

        EXTEND
        DIM     REX_SPEED

FAST_NOW

        CA      NEG_ONE
        TS      VALUES1

        CA      DEC2
        TS      CUR_ID
        TC      DISPNUM

        CA      DEC4
        TS      CUR_ID
        TC      DISPNUM

        TC      RESETALL       # Set all grid items to empty (-1)
        TC      DISP15         # Clear the grid


        CA      ZERO
        EXTEND
        WRITE   CH11           # Clear any DSKY lights

        CA      LIGHTS
        AD      BIT6
        EXTEND
        WRITE   CH10


        TCF     NEW_MAZE

        EXTEND
        QXCH    RET_ADR2         # Restore return address of caller

        RETURN

OVER_KEY

        #CA      BIT5
        #EXTEND
        #WOR     CH11


        CA      LIGHTS
        EXTEND
        WRITE   CH10


        CA      TWO56
        TS      KEY_ID

NO_KEY

        RETURN






