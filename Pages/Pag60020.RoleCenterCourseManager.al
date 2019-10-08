page 60020 "Role Center Course Manager"
{
    // version test

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            // group(".")
            // {
            // }
            part("Studentscue"; 60021)
            {
            }
            part("ProfCue"; 60022)
            {
            }
            part("CourseCue"; 60023)
            {
            }
            part("Classroom List"; 60006)
            {
            }
            part("Mov.Course"; 60013)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("New Student")
            {
                Image = NewCustomer;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page 60000;
                RunPageMode = Create;
            }
            action("New Course")
            {
                Image = NewItem;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page 60008;
                RunPageMode = Create;
            }
            action("New Prof")
            {
                Image = NewCustomer;
                Promoted = true;
                RunObject = Page 60001;
                RunPageMode = Create;
            }
            action("New Classroom")
            {
                Image = NewItem;
                Promoted = true;
                RunObject = Page 60002;
                RunPageMode = Create;
            }
            action("Pag Hist Course Cab")
            {
                Caption = 'Pag Hist Course Cab';
                Image = Navigate;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page 60010;
            }
            action("XMLport Students")
            {
                Caption = 'Import XMLport Students';
                Image = Import;
                RunObject = Codeunit 60007;
            }
            action("XMLport Classroom Txt")
            {
                Caption = 'Export Txt XMLport Classroom';
                Image = Export;
                RunObject = XMLport 60002;
            }
            action("XMLport Course")
            {
                Caption = 'Export XMLport Course';
                Image = Export;
                RunObject = Codeunit 60006;
            }
            group("Report")
            {
                Image = Document;
                action("Report Course Doc")
                {
                    Caption = 'Report Course Doc';
                    RunObject = Report 60020;
                }
                action("Report Historic")
                {
                    Caption = 'Report Historic';
                    RunObject = Report 60021;
                }
                action("Report Students")
                {
                    Caption = 'Report Students';
                    RunObject = Report 60010;
                }
                action("Report Course List")
                {
                    Caption = 'Report Course List';
                    RunObject = Report 60010;
                }
                action("Report Professors")
                {
                    Caption = 'Report Professors';
                    RunObject = Report 60010;
                }
            }
        }
    }
}

