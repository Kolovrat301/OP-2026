PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 16;
  Min = 2;
VAR
  List: SET OF Min..Max;
  MinNum, Num: INTEGER;
  Primes: ARRAY [1..Max] OF INTEGER;  
  Count: INTEGER;                    
BEGIN
  List := [Min..Max];
  MinNum := Min;
  Count := 0;                       
  WHILE MinNum <= Max 
  DO
    BEGIN
      IF MinNum IN List 
      THEN
        BEGIN
          Count := Count + 1;
          Primes[Count] := MinNum;
          Num := MinNum;
          WHILE Num <= Max 
          DO
            BEGIN
              List:= List - [Num];
              Num:= Num + MinNum;
            END;
        END;
      MinNum := MinNum + 1;
    END;
  FOR Num := 1 TO Count 
  DO
    WRITE(Primes[Num], ' ');
  WRITELN;
END.
