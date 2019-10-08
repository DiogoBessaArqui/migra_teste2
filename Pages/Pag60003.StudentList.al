page 60003 "Student List"
{
    // version test

    CardPageID = Students;
    Editable = false;
    PageType = List;
    SourceTable = 60000;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod Student"; "Cod Student")
                {
                }
                field(Name; Name)
                {
                }
                field(Address; Address)
                {
                }
                field(Phone; Phone)
                {
                }
                field(Email; Email)
                {
                }
                field("No. Courses"; "No. Courses")
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

