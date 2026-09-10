UNIT DictionaryTreeModule;

INTERFACE

FUNCTION InsertToDictionary(TargetWord: STRING): BOOLEAN;
PROCEDURE ExportTreeToFile(TargetFileName: STRING);

IMPLEMENTATION

USES TextSymbolUtils;

TYPE
  NodePointer = ^WordNode;
  WordNode = RECORD
               Value: STRING;
               Frequency: INTEGER;
               LeftChild: NodePointer;
               RightChild: NodePointer;
             END;

VAR
  TreeRoot: NodePointer;

PROCEDURE InsertNode(VAR Node: NodePointer; NewData: STRING);
BEGIN
  IF Node = NIL
  THEN
    BEGIN
      NEW(Node);
      Node^.Value := NewData;
      Node^.Frequency := 1;
      Node^.LeftChild := NIL;
      Node^.RightChild := NIL;
    END
  ELSE
    IF MatchWords(NewData, Node^.Value) = -1 
    THEN
      InsertNode(Node^.LeftChild, NewData)
    ELSE 
      IF MatchWords(NewData, Node^.Value) = 1
      THEN
        InsertNode(Node^.RightChild, NewData)
      ELSE
        Node^.Frequency := Node^.Frequency + 1;
END;

FUNCTION InsertToDictionary(TargetWord: STRING): BOOLEAN;
BEGIN
  IF TargetWord = ''
  THEN
    InsertToDictionary := FALSE
  ELSE
    BEGIN
      InsertNode(TreeRoot, TargetWord);
      InsertToDictionary := TRUE;
    END;
END;

PROCEDURE TraversalAndWrite(VAR Output: TEXT; Node: NodePointer);
BEGIN
  IF Node <> NIL
  THEN
    BEGIN
      TraversalAndWrite(Output, Node^.LeftChild);
      WRITELN(Output, Node^.Value, ' ', Node^.Frequency);
      TraversalAndWrite(Output, Node^.RightChild);
    END;
END;

PROCEDURE ExportTreeToFile(TargetFileName: STRING);
VAR
  OutFile: TEXT;
BEGIN
  ASSIGN(OutFile, TargetFileName);
  REWRITE(OutFile);
  TraversalAndWrite(OutFile, TreeRoot);
  CLOSE(OutFile);
END;

BEGIN
  TreeRoot := NIL;
END.

