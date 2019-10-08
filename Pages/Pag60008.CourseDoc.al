page 60008 "Course Doc"
{
    // version test

    DelayedInsert = false;
    PageType = Document;
    SourceTable = 60003;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Cod Course"; "Cod Course")
                {
                    Enabled = Edit;
                }
                field("Course Name"; "Course Name")
                {
                    Enabled = Edit;
                }
                field("Initial Date"; "Initial Date")
                {
                    Enabled = Edit;
                    trigger OnValidate()
                    begin

                        "Course Count" := 1;

                        IF "End Date" = 0D THEN
                            "Course Count" := 1;
                        IF ("End Date" <> 0D) AND ("End Date" < TODAY()) THEN
                            "Course Count" := 0;
                        IF "Initial Date" > TODAY() THEN
                            "Course Count" := 0;
                    end;

                }
                field("End Date"; "End Date")
                {
                }
                field(Duration; Duration)
                {
                    Enabled = Edit;
                }
                field("Cod Prof"; "Cod Prof")
                {

                    Enabled = Edit;
                }
                field("Prof Name"; "Prof Name")
                {
                    Enabled = Edit;
                }
            }
            group(".")
            {
                part("Course Line"; "Course Line")
                {
                }
            }
            group("...")
            {
                field("Cod Classroom"; "Cod Classroom")
                {
                    Enabled = Edit;
                }
                field("Classroom Name"; "Classroom Name")
                {
                    Enabled = Edit;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Course)
            {
                Image = AllLines;
                Promoted = true;
                RunObject = Page 60007;
                ShortCutKey = 'F7';
            }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                RunObject = Report 60020;
                ShortCutKey = 'Shift+F9';
            }
            group("..")
            {
                Image = RegisteredDocs;
                group(Register)
                {
                    Image = History;
                    action(Registe)
                    {
                        RunObject = Codeunit 60002;
                        ShortCutKey = 'F9';
                    }
                    action("Registe and Print")
                    {
                        RunObject = Codeunit 60003;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Edit := TRUE;
        IF TODAY() >= "Initial Date" THEN
            Edit := FALSE;
    end;

    trigger OnDeleteRecord(): Boolean
    begin


        CourseLine.RESET();
        CourseLine.SETRANGE("Cod Course", "Cod Course");
        IF CourseLine.FINDFIRST() THEN
            CourseLine.DELETEALL();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Edit := TRUE;
    end;

    var
        CourseLine: Record 60004;
        Edit: Boolean;
}

