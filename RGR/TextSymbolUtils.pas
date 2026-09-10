UNIT TextSymbolUtils;

INTERFACE

FUNCTION CheckIfLetter(Symbol: CHAR): BOOLEAN;
FUNCTION ConvertToUppercase(Symbol: CHAR): CHAR;
FUNCTION MatchWords(Str1, Str2: STRING): INTEGER;

IMPLEMENTATION
CONST 
  AlphabetOrder = 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß';

FUNCTION CheckIfLetter(Symbol: CHAR): BOOLEAN;
BEGIN
  CASE Symbol OF
    'A'..'Z', 'a'..'z', 'À'..'ß', 'à'..'ÿ', '¨', '¸':
      CheckIfLetter := TRUE;
  ELSE
    CheckIfLetter := FALSE;
  END;    
END;

FUNCTION GetAlphabetIndex(Symbol: CHAR): INTEGER;
VAR
  Idx: Integer;
  UpperSym: CHAR;
BEGIN
  GetAlphabetIndex := 0;
  UpperSym := ConvertToUppercase(Symbol);
  FOR Idx := 1 TO Length(AlphabetOrder) DO
  BEGIN
    IF AlphabetOrder[Idx] = UpperSym THEN
    BEGIN
      GetAlphabetIndex := Idx;
      Break;
    END;
  END;
END;

FUNCTION MatchWords(Str1, Str2: STRING): INTEGER;
VAR
  IsFound: BOOLEAN;
  Weight1, Weight2: INTEGER;
  MinLen: INTEGER; 
  Step: INTEGER; 
BEGIN
  MatchWords := 0;
  IsFound := FALSE; 
  MinLen := LENGTH(Str1);
  IF LENGTH(Str2) < MinLen 
  THEN
    MinLen := LENGTH(Str2);

  Step := 1;
  WHILE (Step <= MinLen) AND (NOT IsFound) 
  DO
    BEGIN
      Weight1 := GetAlphabetIndex(Str1[Step]);
      Weight2 := GetAlphabetIndex(Str2[Step]);
    
      IF Weight1 < Weight2 
      THEN
        BEGIN
          MatchWords := -1;
          IsFound := TRUE;
        END
      ELSE 
        IF Weight1 > Weight2 
        THEN
          BEGIN
            MatchWords := 1; 
            IsFound := TRUE;
          END
        ELSE
          Step := Step + 1;
    END;
  IF NOT IsFound 
  THEN
    BEGIN
      IF LENGTH(Str1) < LENGTH(Str2) 
      THEN
        MatchWords := -1
      ELSE 
        IF LENGTH(Str1) > LENGTH(Str2) 
        THEN
          MatchWords := 1;
    END;
END;  

FUNCTION ConvertToUppercase(Symbol: CHAR): CHAR;
BEGIN
  { Ëàòèíèöà }
  IF Symbol = 'a' THEN ConvertToUppercase := 'A' ELSE
  IF Symbol = 'b' THEN ConvertToUppercase := 'B' ELSE
  IF Symbol = 'c' THEN ConvertToUppercase := 'C' ELSE
  IF Symbol = 'd' THEN ConvertToUppercase := 'D' ELSE
  IF Symbol = 'e' THEN ConvertToUppercase := 'E' ELSE
  IF Symbol = 'f' THEN ConvertToUppercase := 'F' ELSE
  IF Symbol = 'g' THEN ConvertToUppercase := 'G' ELSE
  IF Symbol = 'h' THEN ConvertToUppercase := 'H' ELSE
  IF Symbol = 'i' THEN ConvertToUppercase := 'I' ELSE
  IF Symbol = 'j' THEN ConvertToUppercase := 'J' ELSE
  IF Symbol = 'k' THEN ConvertToUppercase := 'K' ELSE
  IF Symbol = 'l' THEN ConvertToUppercase := 'L' ELSE
  IF Symbol = 'm' THEN ConvertToUppercase := 'M' ELSE
  IF Symbol = 'n' THEN ConvertToUppercase := 'N' ELSE
  IF Symbol = 'o' THEN ConvertToUppercase := 'O' ELSE
  IF Symbol = 'p' THEN ConvertToUppercase := 'P' ELSE
  IF Symbol = 'q' THEN ConvertToUppercase := 'Q' ELSE
  IF Symbol = 'r' THEN ConvertToUppercase := 'R' ELSE
  IF Symbol = 's' THEN ConvertToUppercase := 'S' ELSE
  IF Symbol = 't' THEN ConvertToUppercase := 'T' ELSE
  IF Symbol = 'u' THEN ConvertToUppercase := 'U' ELSE
  IF Symbol = 'v' THEN ConvertToUppercase := 'V' ELSE
  IF Symbol = 'w' THEN ConvertToUppercase := 'W' ELSE
  IF Symbol = 'x' THEN ConvertToUppercase := 'X' ELSE
  IF Symbol = 'y' THEN ConvertToUppercase := 'Y' ELSE
  IF Symbol = 'z' THEN ConvertToUppercase := 'Z' ELSE

  { Êèðèëëèöà }
  IF Symbol = 'à' THEN ConvertToUppercase := 'À' ELSE
  IF Symbol = 'á' THEN ConvertToUppercase := 'Á' ELSE
  IF Symbol = 'â' THEN ConvertToUppercase := 'Â' ELSE
  IF Symbol = 'ã' THEN ConvertToUppercase := 'Ã' ELSE
  IF Symbol = 'ä' THEN ConvertToUppercase := 'Ä' ELSE
  IF Symbol = 'å' THEN ConvertToUppercase := 'Å' ELSE
  IF Symbol = '¸' THEN ConvertToUppercase := '¨' ELSE
  IF Symbol = 'æ' THEN ConvertToUppercase := 'Æ' ELSE
  IF Symbol = 'ç' THEN ConvertToUppercase := 'Ç' ELSE
  IF Symbol = 'è' THEN ConvertToUppercase := 'È' ELSE
  IF Symbol = 'é' THEN ConvertToUppercase := 'É' ELSE
  IF Symbol = 'ê' THEN ConvertToUppercase := 'Ê' ELSE
  IF Symbol = 'ë' THEN ConvertToUppercase := 'Ë' ELSE
  IF Symbol = 'ì' THEN ConvertToUppercase := 'Ì' ELSE
  IF Symbol = 'í' THEN ConvertToUppercase := 'Í' ELSE
  IF Symbol = 'î' THEN ConvertToUppercase := 'Î' ELSE
  IF Symbol = 'ï' THEN ConvertToUppercase := 'Ï' ELSE
  IF Symbol = 'ð' THEN ConvertToUppercase := 'Ð' ELSE
  IF Symbol = 'ñ' THEN ConvertToUppercase := 'Ñ' ELSE
  IF Symbol = 'ò' THEN ConvertToUppercase := 'Ò' ELSE
  IF Symbol = 'ó' THEN ConvertToUppercase := 'Ó' ELSE
  IF Symbol = 'ô' THEN ConvertToUppercase := 'Ô' ELSE
  IF Symbol = 'õ' THEN ConvertToUppercase := 'Õ' ELSE
  IF Symbol = 'ö' THEN ConvertToUppercase := 'Ö' ELSE
  IF Symbol = '÷' THEN ConvertToUppercase := '×' ELSE
  IF Symbol = 'ø' THEN ConvertToUppercase := 'Ø' ELSE
  IF Symbol = 'ù' THEN ConvertToUppercase := 'Ù' ELSE
  IF Symbol = 'ú' THEN ConvertToUppercase := 'Ú' ELSE
  IF Symbol = 'û' THEN ConvertToUppercase := 'Û' ELSE
  IF Symbol = 'ü' THEN ConvertToUppercase := 'Ü' ELSE
  IF Symbol = 'ý' THEN ConvertToUppercase := 'Ý' ELSE
  IF Symbol = 'þ' THEN ConvertToUppercase := 'Þ' ELSE
  IF Symbol = 'ÿ' THEN ConvertToUppercase := 'ß' ELSE

    ConvertToUppercase := Symbol;
END;

BEGIN
END.

