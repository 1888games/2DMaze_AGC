
            BLOCK   02
T3RUPT
            CAF     O37774      # Schedule another TIME3 interrupt
            TS      TIME3       # ... and don't do anything else, yet...

            INCR    COUNTER     # Increment counter for random number generation


RESUME      DXCH    ARUPT       # Restore A, L, and Q, and exit the interrupt
            EXTEND
            QXCH    QRUPT
            RESUME


T4RUPT
            CAF     TIMER4       # Schedule another TIME3 interrupt
            TS      TIME4 # ... and don't do anything else, yet...

            CA          ACTIVE
            EXTEND
            BZF         QUIT4

            CA      SEC_DIGS
            EXTEND
            BZF     WRAP_SEC

            EXTEND
            DIM     SEC_DIGS
            TCF     QUIT4



WRAP_SEC

            CA      SEC_TENS
            EXTEND
            BZF     TIME_UP

            EXTEND
            DIM     SEC_TENS

            CA      DEC9
            TS      SEC_DIGS
TIME_UP


QUIT4       DXCH    ARUPT       # Restore A, L, and Q, and exit the interrupt
            EXTEND
            QXCH    QRUPT
            RESUME
