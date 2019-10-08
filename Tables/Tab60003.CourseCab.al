table 60003 "Course-Cab"
{
    // version test


    fields
    {
        field(1; "Cod Course"; Code[20])
        {
            Caption = 'Cod Course';
            DataClassification = ToBeClassified;
        }
        field(2; "Course Name"; Text[30])
        {
            Caption = 'Course Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Initial Date"; Date)
        {
            Caption = 'Initial Date';
            DataClassification = ToBeClassified;
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = ToBeClassified;
        }
        field(5; Duration; Decimal)
        {
            Caption = 'Durantion';
            DataClassification = ToBeClassified;
        }
        field(6; "Cod Prof"; Code[20])
        {
            Caption = 'Cod Prof';
            DataClassification = ToBeClassified;
            TableRelation = Prof;
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
            FieldClass = Normal;
            TableRelation = Classroom WHERE(Capacity = FILTER(>= 30));
        }
        field(9; "Classroom Name"; Text[50])
        {
            CalcFormula = Lookup (Classroom.Name WHERE("Cod Classroom" = FIELD("Cod Classroom")));
            Caption = 'Classroom Name';
            FieldClass = FlowField;
        }
        field(97; "No. Series"; Code[10])
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(98; "Course Count"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(99; "Course Total"; Integer)
        {
            CalcFormula = Sum ("Course-Cab"."Course Count");
            Editable = false;
            FieldClass = FlowField;
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
            SerieSetup.GET();
            SerieSetup.TESTFIELD("Course Nos.");
            NoSeriesMgt.InitSeries(SerieSetup."Course Nos.", xRec."No. Series", 0D, "Cod Course", "No. Series");
        END;


        "Course Count" := 1;

        IF "End Date" = 0D THEN
            "Course Count" := 1;
        IF ("End Date" <> 0D) AND ("End Date" < TODAY()) THEN
            "Course Count" := 0;
        IF "Initial Date" > TODAY() THEN
            "Course Count" := 0;
    end;

    var
        SerieSetup: Record 60005;
        NoSeriesMgt: Codeunit 396;
}

