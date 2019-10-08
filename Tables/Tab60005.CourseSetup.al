table 60005 "Course-Setup"
{
    // version test


    fields
    {
        field(1;"Key";Code[10])
        {
            Caption = 'Key';
            DataClassification = ToBeClassified;
        }
        field(2;"Course Nos.";Code[10])
        {
            Caption = 'Course';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3;"Students Nos.";Code[10])
        {
            Caption = 'Students';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4;"Profs Nos.";Code[10])
        {
            Caption = 'Profs';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5;"Classrooms Nos.";Code[10])
        {
            Caption = 'Classrooms';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6;"Course Historic Nos.";Code[10])
        {
            Caption = 'Course Historic';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Key")
        {
        }
    }

    fieldgroups
    {
    }
}

