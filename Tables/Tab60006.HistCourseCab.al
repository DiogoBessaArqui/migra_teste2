table 60006 "Hist.Course-Cab"
{
    // version test


    fields
    {
        field(1; "Cod Course"; Code[20])
        {
            Caption = 'Cod Course';
            DataClassification = ToBeClassified;
        }
        field(2; "Course Name"; Text[50])
        {
            Caption = 'Course Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Initial Date"; Date)
        {
            Caption = 'Initial Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Final Date"; Date)
        {
            Caption = 'Final Date';
            DataClassification = ToBeClassified;
        }
        field(5; Duration; Decimal)
        {
            Caption = 'Duration';
            DataClassification = ToBeClassified;
        }
        field(6; "Cod Prof"; Code[20])
        {
            Caption = 'Cod Prof';
            DataClassification = ToBeClassified;
            TableRelation = Prof."Cod Prof";
        }
        field(7; "Prof Name"; Text[50])
        {
            CalcFormula = Lookup (Prof.Name WHERE("Cod Prof" = FIELD("Cod Prof")));
            Caption = 'Prof Name';
            FieldClass = FlowField;
        }
        field(8; "Cod Classroom"; Code[20])
        {
            Caption = 'Cod Classroom';
            DataClassification = ToBeClassified;
            TableRelation = Classroom."Cod Classroom";
        }
        field(9; "Classroom Name"; Text[50])
        {
            CalcFormula = Lookup (Classroom.Name WHERE("Cod Classroom" = FIELD("Cod Classroom")));
            Caption = 'Classroom Name';
            FieldClass = FlowField;
        }
        field(97; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(99; "Previous Code Course"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Cod Course")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        IF "Cod Course" = '' THEN BEGIN
            SeriesSetup.GET();
            SeriesSetup.TESTFIELD("Course Historic Nos.");
            NoSeriesMgt.InitSeries(SeriesSetup."Course Historic Nos.", xRec."No. Series", 0D, "Cod Course", "No. Series");
            NoSeriesMgt.GetNextNo(SeriesSetup."Course Historic Nos.", TODAY(), TRUE);
        END;
    end;

    var
        SeriesSetup: Record 60005;
        NoSeriesMgt: Codeunit 396;
}

