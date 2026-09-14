PROGRAM Split(INPUT, OUTPUT);
 { Копирует INPUT в OUTPUT, сначала нечетные, а затем четные элементы }
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
  IsExit: BOOLEAN;
{ DP1.1}
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  RESET(F1);
  WHILE NOT EOF(F1) DO
    BEGIN
      WHILE NOT EOLN(F1) DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1)
    END
END;

BEGIN
  {Разделяет INPUT в Odds и Evens}
  ASSIGN(Odds, 'ODDS.txt');
  ASSIGN(Evens, 'EVENS.txt');
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  IsExit := FALSE;
  WHILE NOT IsExit 
  DO
    BEGIN
      IF EOLN THEN
        BEGIN
          IsExit := TRUE;
          READLN 
        END
      ELSE
        BEGIN
          WHILE NOT EOLN DO
            BEGIN
              READ(Ch);
              IF Next = 'O' THEN
                BEGIN
                  WRITE(Odds, Ch);
                  Next := 'E'
                END
              ELSE
                BEGIN
                  WRITE(Evens, Ch);
                  Next := 'O'
                END
            END;
          READLN;
          WRITELN(Odds);
          WRITELN(Evens)
        END
    END;
  CLOSE(Odds);
  CLOSE(Evens);
  CopyOut(Odds, Ch);
  CopyOut(Evens, Ch);
  WRITELN
END.

