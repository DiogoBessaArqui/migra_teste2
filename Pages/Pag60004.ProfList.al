page 60004 "Prof List"
{
    // version test

    CardPageID = Prof;
    Editable = false;
    PageType = List;
    SourceTable = 60001;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cod Prof"; "Cod Prof")
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

