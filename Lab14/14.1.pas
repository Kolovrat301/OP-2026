PROGRAM ReverseCopy(INPUT, OUTPUT);

PROCEDURE Reverse(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      Reverse(F1, F2);
      WRITE(F2, Ch)
    END
END;

BEGIN
  Reverse(INPUT, OUTPUT);
  WRITELN(OUTPUT)
END.
