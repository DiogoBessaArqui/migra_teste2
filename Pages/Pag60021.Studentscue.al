page 60021 "Studentscue"
{
    // version test

    PageType = CardPart;
    SourceTable = 60000;

    layout
    {
        area(content)
        {
            cuegroup("Students numbers")
            {
                Caption = 'Students numbers';
                field("Students Total"; "Students Total")
                {
                    Image = People;
                }

                actions
                {
                    action("New Students")
                    {
                        RunObject = Page 60000;
                        RunPageMode = Create;
                    }
                }
            }
        }
    }

    actions
    {
    }
}

