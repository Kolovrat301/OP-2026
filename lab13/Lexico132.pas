PROGRAM SortLexico(INPUT, OUTPUT);
VAR
  Ch, Result: CHAR;
  F1, F2: TEXT;
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF Ch1 < Ch2
      THEN
        Result := '1'
      ELSE
        IF Ch1 > Ch2
        THEN
          Result := '2'
    END;
  IF Result = '0' 
  THEN
    BEGIN
      IF EOLN(F1) AND NOT EOLN(F2) 
      THEN
        Result := '1'
      ELSE 
        IF NOT EOLN(F1) AND EOLN(F2) 
        THEN
          Result := '2'
    END
END; {Lexico}  
   
PROCEDURE CopyLex(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END
END;        
        
BEGIN {SortLexico}
  IF NOT EOF
  THEN
    REWRITE(F1);
    CopyLex(F1, Ch);    
    REWRITE(F2);    
    READLN; 
    CopyLex(F2, Ch);  
    Lexico(F1, F2, Result);
    IF Result = '0'
    THEN
      WRITE('Строки идентичны')
    ELSE 
      IF Result = '1'
      THEN
        WRITE('вторая строка больше первой')
      ELSE   
        IF Result = '2'
        THEN
          WRITE('первая строка больше второй')
END. {SortLexico}
