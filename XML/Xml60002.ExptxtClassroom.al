xmlport 60002 "Exp txt Classroom"
{
    // version test

    Direction = Export;
    FileName = 'Export_Classroom.txt';
    Format = FixedText;

    schema
    {
        textelement(Root)
        {
            tableelement("Classroom"; "Classroom")
            {
                XmlName = 'Classroom';
                fieldelement(CodClassroom; Classroom."Cod Classroom")
                {
                    Width = 50;
                }
                fieldelement(Name; Classroom.Name)
                {
                    Width = 50;
                }
                fieldelement(Location; Classroom.Location)
                {
                    Width = 50;
                }
                fieldelement(Capacity; Classroom.Capacity)
                {
                    Width = 50;
                }
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

