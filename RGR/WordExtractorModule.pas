UNIT WordExtractorModule;

INTERFACE

USES TextSymbolUtils;

FUNCTION ExtractNextWord(VAR FileSrc: TEXT): STRING;

IMPLEMENTATION

FUNCTION ExtractNextWord(VAR FileSrc: TEXT): STRING;
VAR
  CurrentChar: CHAR;
  Buffer: STRING; 
  InsideWord: BOOLEAN; 
  HyphenPending: BOOLEAN; 
  IsDone: BOOLEAN; 
BEGIN
  Buffer := '';
  InsideWord := FALSE;
  HyphenPending := FALSE;
  IsDone := FALSE;

  WHILE (NOT EOF(FileSrc)) AND (NOT IsDone)
  DO
    BEGIN
      IF EOLN(FileSrc)
      THEN
        BEGIN
          READLN(FileSrc);
          IF InsideWord
          THEN
            IsDone := TRUE;
        END
      ELSE
        BEGIN
          READ(FileSrc, CurrentChar);
          IF CheckIfLetter(CurrentChar)
          THEN
            BEGIN
              IF NOT InsideWord
              THEN
                InsideWord := TRUE;
              IF HyphenPending
              THEN
                BEGIN
                  Buffer := Buffer + '-';
                  HyphenPending := FALSE;
                END;
              Buffer := Buffer + ConvertToUppercase(CurrentChar);
            END
          ELSE 
            IF (CurrentChar = '-') AND InsideWord
            THEN
              BEGIN
                IF NOT HyphenPending
                THEN
                  HyphenPending := TRUE;
              END
            ELSE
              BEGIN
                IF InsideWord
                THEN
                  IsDone := TRUE;
              END;
        END;
    END;

  IF InsideWord
  THEN
    ExtractNextWord := Buffer
  ELSE
    ExtractNextWord := '';
END;

BEGIN
END.

