table 60007 "Hist.Course-Line"
{
    // version test


    fields
    {
        field(1;"Cod Course";Code[20])
        {
            Caption = 'Cod Course';
            DataClassification = ToBeClassified;
        }
        field(2;Line;Integer)
        {
            AutoIncrement = true;
            Caption = 'Line';
            DataClassification = ToBeClassified;
        }
        field(3;"Cod Student";Code[20])
        {
            Caption = 'Cod Student';
            DataClassification = ToBeClassified;
            TableRelation = Students."Cod Student";
        }
        field(4;"Student Name";Text[50])
        {
            CalcFormula = Lookup(Students.Name WHERE ("Cod Student"=FIELD("Cod Student")));
            Caption = 'Student Name';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Cod Course",Line)
        {
        }
    }

    fieldgroups
    {
    }
}

