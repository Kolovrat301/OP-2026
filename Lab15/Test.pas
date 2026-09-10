PROGRAM CountTest(INPUT, OUTPUT);
USES Count3;
VAR
  X100, X10, X1: CHAR;
BEGIN
  Start;
  WHILE NOT EOLN
  DO
    BEGIN
      READ;
      Bump
    END;
  Value(X100, X10, X1);  
  WRITELN('Количество символов: ', X100, X10, X1)    
END.{CountSimbols}                                             

