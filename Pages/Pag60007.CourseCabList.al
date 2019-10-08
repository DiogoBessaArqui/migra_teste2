page 60007 "Course Cab List"
{
    // version test

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = 60003;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("End Date"; "End Date")
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
                field("No. Series"; "No. Series")
                {
                }
            }
        }
    }

    actions
    {
    }
}

