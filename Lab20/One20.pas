PROGRAM Graphic(INPUT, OUTPUT);
CONST
  MaxX = 5;
  MaxY = 5;
  MinCoord = 1;
  MaxSize = MaxX * MaxY;
TYPE
  LocOfLetter = SET OF MinCoord .. MaxSize;
  Glyph = (WrongGlyph, T, I, O, L, E);
VAR
  Letter: Glyph;
  NumOfLetter: LocOfLetter;

FUNCTION ReadGlyph: Glyph;
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN
  THEN
    BEGIN                               
      READ(Ch);
      CASE Ch OF
        'T': ReadGlyph := T;
        'I': ReadGlyph := I;
        'O': ReadGlyph := O;
        'L': ReadGlyph := L;
        'E': ReadGlyph := E
      ELSE
        ReadGlyph := WrongGlyph  
      END
    END
  ELSE
    ReadGlyph := WrongGlyph
END;

FUNCTION GetLetterSet(G: Glyph): LocOfLetter;
BEGIN
  CASE G OF
    T: GetLetterSet := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    I: GetLetterSet := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    O: GetLetterSet := [2, 3, 4, 7, 9, 12, 14, 17, 19, 22, 23, 24];
    L: GetLetterSet := [2, 7, 12, 17, 22, 23];
    E: GetLetterSet := [1, 2, 3, 6, 11, 12, 13, 16, 21, 22, 23]
  ELSE
    GetLetterSet := [2, 4, 17, 18, 19, 21, 25]
  END;
END;

PROCEDURE PrintMatrix(Coords: LocOfLetter);
VAR
  X: INTEGER;
BEGIN
  FOR X := MinCoord TO MaxSize DO
    BEGIN
      IF X IN Coords THEN
        WRITE('#')
      ELSE
        WRITE(' ');
      IF (X MOD MaxX) = 0 THEN
        WRITELN  
    END
END;

BEGIN
  IF EOLN THEN
    WRITELN('Пустая строка')
  ELSE
    BEGIN
      Letter := ReadGlyph;
      NumOfLetter := GetLetterSet(Letter);
      PrintMatrix(NumOfLetter)
    END
END.
