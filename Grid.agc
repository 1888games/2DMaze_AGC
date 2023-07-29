
RESETALL

             CA         TWENTY1         # Set loop counter to 21

             TS         CUR_ID
RESETLOOP

             EXTEND
             DIM        CUR_ID          # Decrement id so we start at 20, end at 0
             CA         NEG_ONE         # Load -1 to A (empty cell)
             INDEX      CUR_ID          # Index by current loop count
             TS         VALUES          # Save -1 to empty this grid cell

             CA         CUR_ID          # Load loop counter
             AD         NEG6
             EXTEND
             BZF        RESETEND        # If zero, we've cleared all of VALUES array

             TCF        RESETLOOP       # Not zero, loop back for next cell


RESETEND
             RETURN                     # Return to Init



