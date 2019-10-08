page 60000 "Students"
{
    // version test

    PageType = Card;
    SourceTable = 60000;

    layout
    {
        area(content)
        {
            group(General)
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
                    DrillDownPageID = "Mov.Course";
                    Editable = true;
                }
                field("No. Series"; "No. Series")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

