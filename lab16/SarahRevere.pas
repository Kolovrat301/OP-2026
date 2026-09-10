PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN;
BEGIN {SarahRevere} 
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE;
  W1 := ' '; W2 := ' '; W3 := ' '; W4 := ' ';
  WHILE NOT EOLN AND NOT (Land OR Sea) DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
    END;
  READLN;
  WRITELN;
  IF Land 
  THEN
    WRITELN('The British are coming by land!')
  ELSE 
  IF Sea 
  THEN
    WRITELN('The British are coming by sea!')
  ELSE
    WRITELN('No signal detected.');
  READLN
END.

