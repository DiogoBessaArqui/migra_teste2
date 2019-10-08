page 60023 "CourseCue"
{
    // version test

    PageType = CardPart;
    SourceTable = 60003;

    layout
    {
        area(content)
        {
            cuegroup(".")
            {
                field("Active Courses"; "Course Total")
                {
                    Image = Library;

                }

                actions
                {
                    action("New Course")
                    {
                        RunObject = Page 60008;
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

