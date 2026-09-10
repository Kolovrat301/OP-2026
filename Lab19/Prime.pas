PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 16;
VAR
  List: SET OF Min..Max;
  MinNum, Num, I: INTEGER;
BEGIN
  List := [Min..Max];
  MinNum := Min;
  WHILE MinNum <= Max
  DO
    BEGIN
      IF MinNum IN List
      THEN
        BEGIN
          Num := MinNum + MinNum;
          WHILE Num <= Max
          DO
            BEGIN
              List := List - [Num];
              Num := Num + MinNum;
            END;
        END;
      MinNum := MinNum + 1
    END;
  FOR I:= Min TO Max 
  DO
    IF I IN List THEN
      WRITE(I, ' ');
  WRITELN 
END.

