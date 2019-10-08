table 60001 "Prof"
{
    // version test

    DrillDownPageID = 60004;
    LookupPageID = 60004;

    fields
    {
        field(1; "Cod Prof"; Code[20])
        {
            Caption = 'Cod Prof';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(4; Phone; Text[30])
        {
            Caption = 'Phone';
            DataClassification = ToBeClassified;
        }
        field(5; Email; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(97; "No. Series"; Code[10])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(98; "Prof Count"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            InitValue = 1;
        }
        field(99; "Prof Total"; Integer)
        {
            CalcFormula = Sum (Prof."Prof Count");
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Cod Prof")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        IF "Cod Prof" = '' THEN BEGIN
            SerieSetup.GET();
            SerieSetup.TESTFIELD("Profs Nos.");
            NoSeriesMgt.InitSeries(SerieSetup."Profs Nos.", xRec."No. Series", 0D, "Cod Prof", "No. Series");
        END;
    end;

    trigger OnModify()
    begin

        CourseOveriview.CALCFIELDS("Prof Name");
    end;

    var
        SerieSetup: Record 60005;
        CourseOveriview: Record 60003;
        NoSeriesMgt: Codeunit 396;
}

