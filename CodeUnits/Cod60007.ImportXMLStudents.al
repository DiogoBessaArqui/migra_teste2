codeunit 60007 "Import XML Students"
{
    // version test


    trigger OnRun()
    var
        Import: File;
        varInputStream: InStream;
    begin
        Import.OPEN('C:\Temporaria\Import\formandos.csv');
        Import.CREATEINSTREAM(varInputStream);
        XMLPORT.IMPORT(XMLPORT::Students, varInputStream);
        Import.CLOSE();
    end;


}

