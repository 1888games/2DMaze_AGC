# The AGC does not support 'immediate mode', where you can embed a fixed value into the operand.
# So where you might do lda #48 in 6502 to load 48 into A, here 48 must be present somewhere in RAM
# or ROM so that it has an address we can reference in 'CA MYCONSTANT'.
# So these constants are stored in the ROM itself as data to be lookup up when needed.

#-----------------------------------------------------------------------
# Constants and read-only memory.

# Names of CPU registers.


A		EQUALS	0
L		EQUALS	1		# L AND Q ARE BOTH CHANNELS AND REGISTERS.
Q		EQUALS	2
EBANK		EQUALS	3
FBANK		EQUALS	4
Z		EQUALS	5		# ADJACENT TO FBANK AND BBANK FOR DXCH Z
BBANK		EQUALS	6		# (DTCB) AND DXCH FBANK (DTCF).
ZEROES          EQUALS  7               # REGISTER 7 IS A ZERO-SOURCE, USED BY ZL.
ARUPT		EQUALS	10		# INTERRUPT STORAGE.
LRUPT		EQUALS	11
QRUPT		EQUALS	12
SAMPTIME	EQUALS	13		# SAMPLED TIME 1 & 2.
ZRUPT		EQUALS	15		# (13 AND 14 ARE SPARES.)
BANKRUPT	EQUALS	16		# USUALLY HOLDS FBANK OR BBANK.
BRUPT		EQUALS	17		# RESUME ADDRESS AS WELL.
CYR		EQUALS	20
SR		EQUALS	21
CYL		EQUALS	22
EDOP		EQUALS	23


CH10		EQUALS	10
CH11		EQUALS	11
CH12		EQUALS	12
CH15            EQUALS  15
CH32		EQUALS	32
CH13            EQUALS  13
NOKEY           OCT     40
BIT9            DEC     256
BIT10           DEC     512
BIT15           DEC     16384
ZERO            EQUALS  ZEROES
TIMER4          OCT     37633
EIGHT00         DEC     800
SIX00           DEC     600
TWOTHOU         DEC     2000

LOW5		OCT	37

O37774		OCT	37774
O37777          OCT	37777

TEN		EQUALS  DEC10
CLEARBTN        DEC     28
RESETBTN        DEC     18
NEG_ONE         DEC     -1


TWENTY          DEC     20
TWENTY1         DEC     21
MASK128         DEC     127
MASK256         DEC     255
MASK15          EQUALS  DEC15
MASK7           EQUALS  DEC7
MASK3           EQUALS  DEC3
TWO56           DEC     256
FIVE12          DEC     512
FOURTEEN        EQUALS  DEC14
TWOHUND         DEC     200
FOURTY8         DEC     48
NINETY6         DEC     96
TWO55          DEC     255
THIRTY          DEC     30
SIXTY4          DEC     64
ONE28           DEC     128
THIRTY2         DEC     32
ALL_LIGHT       DEC     63

NO_VN           OCT     77677  #77737
FLASH_VN        OCT     100 #40

NEG1           DEC     -1
NEG2           DEC     -2
NEG4           DEC      -4
NEG5           DEC     -5
NEG6            DEC     -6
NEG7             DEC     -7
NEG10           DEC     -10
BIT5           DEC     16
BIT6           DEC      32

NEG32          DEC      -32
NEG18           DEC     -18
NEG16          DEC      -16
NEG15           DEC     -15
BIT2          EQUALS    DEC2


