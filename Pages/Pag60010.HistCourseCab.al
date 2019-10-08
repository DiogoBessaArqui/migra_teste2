page 60010 "Hist.Course-Cab"
{
    // version test

    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = 60006;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Cod Course"; "Cod Course")
                {
                }
                field("Course Name"; "Course Name")
                {
                }
                field("Initial Date"; "Initial Date")
                {
                }
                field("Final Date"; "Final Date")
                {
                }
                field(Duration; Duration)
                {
                }
                field("Cod Prof"; "Cod Prof")
                {
                }
                field("Prof Name"; "Prof Name")
                {
                }
                field("Cod Classroom"; "Cod Classroom")
                {
                }
                field("Classroom Name"; "Classroom Name")
                {
                }
            }
            group(".")
            {
                part("Hist.Course-Line"; "Hist.Course-Line")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Movement)
            {
                Image = MovementWorksheet;
                Promoted = true;
                RunObject = Page 60013;
            }
        }
    }
}

