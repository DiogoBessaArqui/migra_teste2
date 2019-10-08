report 60010 "StudentList"
{
    // version test

    DefaultLayout = RDLC;
    RDLCLayout = './StudentList.rdlc';

    dataset
    {
        dataitem(DataItem1; "Students")
        {
            column(CodStudent_Students; Students."Cod Student")
            {
            }
            column(Name_Students; Students.Name)
            {
            }
            column(Address_Students; Students.Address)
            {
            }
            column(Phone_Students; Students.Phone)
            {
            }
            column(Email_Students; Students.Email)
            {
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        ReportTitle = 'Student List';
    }
    var
        Students: Record Students;
}

