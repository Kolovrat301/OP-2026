PROGRAM Graphic(INPUT, OUTPUT);
CONST
  MaxX = 5;
  MaxY = 5;
  MinCoord = 1;
  MaxSize = MaxX * MaxY;
TYPE
  LocOfLetter = SET OF MinCoord .. MaxSize;
  Glyph = (WrongGlyph, T, I, O, L, X);
VAR
  Letter: Glyph;
  NumOfLetter: LocOfLetter;
  XCoord, X: INTEGER;
  Ch: CHAR;
BEGIN
  IF NOT EOLN
  THEN
    BEGIN
      XCoord := MaxSize;
      X := MinCoord;
      READ(Ch);
      CASE Ch OF
        'T': Letter := T;
        'I': Letter := I;
        'O': Letter := O;
        'L': Letter := L;
        'X': Letter := X;
      ELSE
        Letter := WrongGlyph  
      END;
      CASE Letter OF
        T: NumOfLetter := [1, 2, 3, 4, 5, 8, 13, 18, 23];
        I: NumOfLetter := [2, 3, 4, 8, 13, 18, 22, 23, 24];
        O: NumOfLetter := [2, 3, 4, 7, 9, 12, 14, 17, 19, 22, 23, 24];
        L: NumOfLetter := [2, 7, 12, 17, 22, 23];
        X: NumOfLetter := [1, 5, 7, 9, 13, 17, 19, 21, 25];
        WrongGlyph: NumOfLetter := [2, 4, 17, 18, 19, 21, 25]
      END;
      FOR X := MinCoord TO XCoord
      DO
        BEGIN
          IF X IN NumOfLetter
          THEN
            WRITE('#')
          ELSE
            WRITE(' ');
          IF (X MOD MaxX) = 0
          THEN
            WRITELN  
        END             
    END
  ELSE
    WRITELN('Пустая строка')
END.
