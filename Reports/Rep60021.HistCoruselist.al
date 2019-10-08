report 60021 "Hist. Coruse list"
{
    // version test

    DefaultLayout = RDLC;
    RDLCLayout = './Hist. Coruse list.rdlc';

    dataset
    {
        dataitem(DataItem1; "Hist.Course-Cab")
        {
            column(CodCourse_HistCourseCab; "Hist.Course-Cab"."Cod Course")
            {
                IncludeCaption = true;
            }
            column(CourseName_HistCourseCab; "Hist.Course-Cab"."Course Name")
            {
                IncludeCaption = true;
            }
            column(InitialDate_HistCourseCab; "Hist.Course-Cab"."Initial Date")
            {
                IncludeCaption = true;
            }
            column(FinalDate_HistCourseCab; "Hist.Course-Cab"."Final Date")
            {
                IncludeCaption = true;
            }
            column(Duration_HistCourseCab; "Hist.Course-Cab".Duration)
            {
                IncludeCaption = true;
            }
            column(CodProf_HistCourseCab; "Hist.Course-Cab"."Cod Prof")
            {
                IncludeCaption = true;
            }
            column(ProfName_HistCourseCab; "Hist.Course-Cab"."Prof Name")
            {
                IncludeCaption = true;
            }
            column(CodClassroom_HistCourseCab; "Hist.Course-Cab"."Cod Classroom")
            {
                IncludeCaption = true;
            }
            column(ClassroomName_HistCourseCab; "Hist.Course-Cab"."Classroom Name")
            {
                IncludeCaption = true;
            }
            column(PreviousCodeCourse_HistCourseCab; "Hist.Course-Cab"."Previous Code Course")
            {
                IncludeCaption = true;
            }
            dataitem(DataItem11; "Hist.Course-Line")
            {
                DataItemLink = "Cod Course" = FIELD("Cod Course");
                column(CodStudent_HistCourseLine; "Hist.Course-Line"."Cod Student")
                {
                    IncludeCaption = true;
                }
                column(StudentName_HistCourseLine; "Hist.Course-Line"."Student Name")
                {
                    IncludeCaption = true;
                }
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
        ReportTitle = 'Hist. Course List';
    }
    var
        "Hist.Course-Cab": Record "Hist.Course-Cab";
        "Hist.Course-Line": Record "Hist.Course-Line";
}

