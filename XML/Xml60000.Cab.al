xmlport 60000 "Cab"
{
    // version test


    schema
    {
        textelement(Root)
        {
            tableelement("Course-Cab"; "Course-Cab")
            {
                AutoReplace = false;
                LinkTableForceInsert = false;
                MaxOccurs = Once;
                XmlName = 'Cab';
                fieldelement(Cod_Course; "Course-Cab"."Cod Course")
                {
                }
                fieldelement(Course_Name; "Course-Cab"."Course Name")
                {
                }
                fieldelement(Duration; "Course-Cab".Duration)
                {
                }
                fieldelement(Prof_Name; "Course-Cab"."Prof Name")
                {
                }
                fieldelement(Classroom_Name; "Course-Cab"."Classroom Name")
                {
                }
                tableelement("Course-Line"; "Course-Line")
                {
                    LinkTable = "Course-Cab";
                    XmlName = 'Line';
                    fieldelement(Cod_Student; "Course-Line"."Cod Student")
                    {
                    }
                    fieldelement(Student_Name; "Course-Line"."Student Name")
                    {
                    }
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

