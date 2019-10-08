codeunit 60006 "Export XML Course"
{
    // version test

    TableNo = 60003;

    trigger OnRun()
    var
        CustXmlFile: File;
        XmlStream: OutStream;
        IsExported: Boolean;
        FromFile: Text;
        ToFile: Text;
        Text000Lbl: Label 'The Customer table export to XML is completed';
        Text001Lbl: Label 'The Export Failed';
    begin

        Course.RESET();
        Course.SETRANGE("Cod Course");

        IF Course.FINDSET() THEN
            REPEAT
                Rec.SETRANGE("Cod Course", Course."Cod Course");
                CustXmlFile.CREATE(TEMPORARYPATH() + 'Customer.xml');
                CustXmlFile.CREATEOUTSTREAM(XmlStream);
                IsExported := XMLPORT.EXPORT(XMLPORT::Cab, XmlStream, Rec);
                FromFile := CustXmlFile.NAME();
                ToFile := 'CustomerClient.xml';
                CustXmlFile.CLOSE();

                IF IsExported THEN begin
                    DOWNLOAD(FromFile, 'Download file', 'C:\Temp', 'Xml file(*.xml)|*.xml', ToFile);
                    ERASE(FromFile);
                END
                ELSE
                    MESSAGE(Text001Lbl);
            UNTIL Course.NEXT() = 0;
        MESSAGE(Text000Lbl);
    end;

    var
        Course: Record 60003;
}

