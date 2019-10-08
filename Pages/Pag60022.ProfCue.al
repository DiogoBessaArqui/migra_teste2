page 60022 "ProfCue"
{
    // version test

    PageType = CardPart;
    SourceTable = 60001;

    layout
    {
        area(content)
        {
            cuegroup("Prof numbers")
            {
                Caption = 'Prof numbers';
                field("Prof Total"; "Prof Total")
                {
                    Image = People;
                }

                actions
                {
                    action("New Prof")
                    {
                        RunObject = Page 60001;
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

