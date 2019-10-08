xmlport 60001 Students
{
    // version test

    Direction = Import;
    FieldDelimiter = ';';
    FieldSeparator = ';';
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Students"; "Students")
            {
                MaxOccurs = Unbounded;
                XmlName = 'Students';
                fieldelement(Nome; Students.Name)
                {
                }
                fieldelement(Address; Students.Address)
                {
                }
                fieldelement(Email; Students.Email)
                {
                }
                fieldelement(Phone; Students.Phone)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    IF Students.Phone = '' THEN
                        Students.Phone := '210000000';
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

