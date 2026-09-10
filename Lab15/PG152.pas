PROGRAM CountReverses(INPUT, OUTPUT);
VAR
  Thousand, X100, X10, X1: CHAR;
  PrevOne, Prev, Current: CHAR;
USES Count3;
BEGIN
  Thousand := '0';
  Start;
  IF NOT EOLN
  THEN
    BEGIN
      READ(PrevOne);
      IF NOT EOLN
      THEN
        BEGIN
          READ(Prev);
          WHILE NOT EOLN
          DO
            BEGIN
              READ(Current);
              IF (Prev > PrevOne) AND (Prev > Current)
              THEN
                Bump(Thousand)
              ELSE
                IF (Prev < PrevOne) AND (Prev < Current)
                THEN
                  Bump(Thousand);
              PrevOne := Prev;
              Prev := Current
            END
        END
    END;
  Value(X100, X10, X1);
  IF Thousand = '0'
  THEN
    WRITELN('Количество реверсов: ', X100, X10, X1)
  ELSE
    WRITELN('Счётчик переполнен')
END.

