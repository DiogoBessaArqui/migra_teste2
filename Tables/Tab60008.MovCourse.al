table 60008 "Mov.Course"
{
    // version test

    DrillDownPageID = 60013;
    LookupPageID = 60013;

    fields
    {
        field(1; "Cod Course"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "No. Movement"; Integer)
        {
            AutoIncrement = false;
            Caption = 'No. Movement';
            DataClassification = ToBeClassified;
        }
        field(3; "Cod Student"; Code[20])
        {
            Caption = 'Cod Student';
            DataClassification = ToBeClassified;
        }
        field(4; "Course Name"; Text[50])
        {
            Caption = 'Course Name';
            DataClassification = ToBeClassified;
        }
        field(5; "Student Name"; Text[50])
        {
            CalcFormula = Lookup (Students.Name WHERE("Cod Student" = FIELD("Cod Student")));
            Caption = 'Student Name';
            FieldClass = FlowField;
        }
        field(6; Duration; Decimal)
        {
            Caption = 'Duration';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 0;
        }
        field(7; "Initial Date"; Date)
        {
            Caption = 'Initial Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Final Date"; Date)
        {
            Caption = 'Final Date';
            DataClassification = ToBeClassified;
        }
        field(9; "Cod Prof"; Code[20])
        {
            Caption = 'Cod Prof';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. Movement")
        {
        }
    }

    fieldgroups
    {
    }
}

