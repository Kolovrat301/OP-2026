UNIT TextManagerModule;

INTERFACE

PROCEDURE ExecuteProcessing(SourceFile: STRING; ResultFile: STRING);

IMPLEMENTATION

USES WordExtractorModule; 
USES DictionaryTreeModule;
USES TextSymbolUtils;

PROCEDURE ExecuteProcessing(SourceFile: STRING; ResultFile: STRING);
VAR
  SrcFile: TEXT;
  CurrentWord: STRING;
BEGIN
  ASSIGN(SrcFile, SourceFile);
  RESET(SrcFile);
   WHILE NOT EOF(SrcFile)
  DO
    BEGIN
      CurrentWord := ExtractNextWord(SrcFile);
      IF CurrentWord <> ''
      THEN
        IF InsertToDictionary(CurrentWord) THEN { <-- хглемемн рср };
    END;
  CLOSE(SrcFile);

  ExportTreeToFile(ResultFile);
END;

BEGIN
END.

