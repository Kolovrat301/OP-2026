PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
  Let = [' ', 'A' .. 'Z']; 
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z'; 
  Length = 0 .. Len;
VAR
  Msg: Str; 
  MsgLength: Length;
  Overflow: BOOLEAN;

{ Функция ищет замену для конкретного символа прямо в файле }
FUNCTION LookUpCipher(Ch: CHAR): CHAR;
VAR
  FL: TEXT;
  Ch1, Ch2: CHAR;
  Found: BOOLEAN;
BEGIN
  { Если символ изначально не входит в алфавит шифра, возвращаем его как есть }
  IF NOT (Ch IN Let) 
  THEN
    LookUpCipher := Ch
  ELSE
    BEGIN
      ASSIGN(FL, 'CIPHER.txt');
      RESET(FL);
      Found := FALSE;
      Ch2 := Ch; 
      WHILE NOT EOF(FL) AND NOT Found 
      DO
        BEGIN
          READ(FL, Ch1);  
          READ(FL, Ch2);   
          IF Ch1 = Ch THEN
            Found := TRUE; 
          READLN(FL)       
        END;
      CLOSE(FL);
      LookUpCipher := Ch2
    END
END;

PROCEDURE Encode(VAR S: Str; MsgLength: Length);
VAR
  Index: 1 .. Len; 
BEGIN
  IF MsgLength > 0 
  THEN
    FOR Index := 1 TO MsgLength DO
      BEGIN
        WRITE(LookUpCipher(S[Index]))
      END;
  WRITELN
END;

BEGIN {Encryption}
  MsgLength := 0;
  Overflow := FALSE;
  WHILE NOT EOLN(INPUT) AND NOT Overflow 
  DO
    BEGIN
      IF MsgLength < Len 
      THEN
        BEGIN
          MsgLength := MsgLength + 1;
          READ(INPUT, Msg[MsgLength]);
        END
      ELSE
        Overflow := TRUE
    END;
  WRITELN;
  IF Overflow 
  THEN
    WRITELN('Превышен лимит символов (', Len ,')');  
  Encode(Msg, MsgLength);
  WRITELN
END. {Encryption}

