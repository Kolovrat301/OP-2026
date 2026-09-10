PROGRAM ReadDigitProg(INPUT, OUTPUT);
VAR 
  I: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  IF NOT EOLN
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9 
      ELSE
        D := -1
    END
  ELSE
    D := -1  
END; {ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Digit, Number: INTEGER;
BEGIN {ReadNumber}
  Digit := 0;
  Number := N;
  WHILE (NOT EOF) AND (N <> -1) AND (N <> -2)
  DO
    BEGIN
      ReadDigit(F, Digit);
      IF Digit = -1
      THEN
        N := -1
      ELSE
        BEGIN
          IF ((MAXINT DIV 10) < Number) OR (((MAXINT MOD 10) < Digit) AND (Number = (MAXINT DIV 10)))
          THEN
            N := -2
          ELSE
            Number := Number * 10 + Digit
        END     
    END;
  IF N = -1
  THEN
    N := Number
END; {ReadNumber}

BEGIN {ReadDigitProg}
  I := 0;
  ReadDigit(INPUT, I);
  IF (NOT EOF) AND (I <> -1)
  THEN
    ReadNumber(INPUT, I);
  WRITELN(MAXINT);  
  WRITELN(I)    
END. {ReadDigitProg}


