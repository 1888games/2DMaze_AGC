
# The AGC has 2,000 words (4KB) of erasable memory. We only need a fraction for this game!


#-------------------------------------------------------------------------
# Some variables.

		SETLOC	24
TIME2		ERASE
TIME1		ERASE
TIME3		ERASE
TIME4		ERASE
TIME5		ERASE
TIME6		ERASE

		SETLOC	61

# Temp variables.
TEMPI		ERASE
TEMPJ		ERASE
TEMPK		ERASE


		SETLOC	67
NEWJOB		ERASE


KEYBUF          ERASE
RET_ADR         ERASE
RET_ADR2        ERASE

ACTIVE          ERASE
COUNTER         ERASE
CUR_ID          ERASE
SEG_OUT         ERASE
CHK_ID          ERASE
CELL_VALUE      ERASE
GM_STATE        ERASE
CHK_VALUE       ERASE
MATCHMD         ERASE
MATCH1          ERASE
MATCH2          ERASE
MATCH3          ERASE
MATCH4          ERASE
CELLROW         ERASE
CELLCOL         ERASE
GM_DONE         ERASE


ROW_ID          ERASE
COL_ID          ERASE
END_ID          ERASE
DSKY_OUT        ERASE
DIGIT_L         ERASE
DIGIT_R         ERASE
INPUTBUF        ERASE
BTNMASK         ERASE
PLAY_ID         ERASE
MAP_POS         ERASE
MAP_ID          ERASE
MAP_X           ERASE
MAP_Y           ERASE
PLAY_POS        ERASE
PLAY_DIG        ERASE
PLAY_X          ERASE
PLAY_Y          ERASE

REX_TRY         ERASE
KEY_ID          ERASE
EXIT_ID         ERASE
REX_ID          ERASE
REX_X           ERASE
REX_Y           ERASE
REX_STOP        ERASE
REX_NEW         ERASE
PATH_LEN        ERASE
PATH_DIR        ERASE
OK_DIG          ERASE
POSS_XY         ERASE
CORNER_ID       ERASE
REX_SPEED       ERASE

HI_THO          ERASE
HI_HUN          ERASE
HI_DIG          ERASE
HI_TEN          ERASE
INIT_DONE       ERASE
LEVEL           ERASE

NEW_ID          ERASE
NEW_X           ERASE
NEW_Y           ERASE
REX_NEAR        ERASE

DIST_X          ERASE
DIST_Y          ERASE
ABS_X           ERASE
ABS_Y           ERASE
DRAW_X          ERASE
DRAW_Y          ERASE
END_X           ERASE
END_Y           ERASE
VALUES          ERASE
VALUES1         ERASE
VALUES2         ERASE
VALUES3         ERASE
VALUES4         ERASE
VALUES5         ERASE +22

MAZE            ERASE
MAZE1           ERASE
MAZE2           ERASE  +258

SEC_TENS        EQUALS VALUES
SEC_DIGS        EQUALS  VALUES1
TRY_ID          EQUALS REX_TRY

SCORE_THO       EQUALS VALUES2
SCORE_HUN       EQUALS  VALUES3

SCORE_DIG       EQUALS   VALUES5
SCORE_TEN       EQUALS VALUES4
