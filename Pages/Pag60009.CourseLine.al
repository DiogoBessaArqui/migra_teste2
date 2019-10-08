page 60009 "Course Line"
{
    // version test

    PageType = List;
    SourceTable = 60004;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod Course"; "Cod Course")
                {
                }
                field(Line; Line)
                {
                }
                field("Cod Student"; "Cod Student")
                {
                }
                field("Student Name"; "Student Name")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

