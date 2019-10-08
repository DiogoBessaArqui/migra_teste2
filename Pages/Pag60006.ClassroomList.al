page 60006 "Classroom List"
{
    // version test

    CardPageID = Classroom;
    Editable = false;
    PageType = List;
    SourceTable = 60002;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod Classroom"; "Cod Classroom")
                {
                }
                field(Name; Name)
                {
                }
                field(Location; Location)
                {
                }
                field(Capacity; Capacity)
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

