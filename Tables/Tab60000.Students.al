table 60000 "Students"
{
    // version test

    DrillDownPageID = 60003;
    LookupPageID = 60003;

    fields
    {
        field(1; "Cod Student"; Code[20])
        {
            Caption = 'Cod Student';
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
        field(7; "No. Courses"; Decimal)
        {
            CalcFormula = Sum ("Mov.Course".Duration);
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(97; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(98; "Students Count"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            InitValue = 1;
        }
        field(99; "Students Total"; Integer)
        {
            CalcFormula = Sum (Students."Students Count");
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Cod Student")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "Cod Student" = '' THEN BEGIN
            SerieSetup.GET();
            SerieSetup.TESTFIELD("Students Nos.");
            NoSeriesMgt.InitSeries(SerieSetup."Students Nos.", xRec."No. Series", 0D, "Cod Student", "No. Series");
        END;
    end;

    trigger OnModify()
    begin

        CourseOverview.CALCFIELDS("Student Name");
    end;

    var
        CourseOverview: Record 60004;
        SerieSetup: Record 60005;
        NoSeriesMgt: Codeunit 396;
}

