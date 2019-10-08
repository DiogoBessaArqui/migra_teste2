codeunit 60004 "Course Reg Line"
{
    // version test

    TableNo = 60003;

    trigger OnRun()
    begin

        Course.COPY(Rec);
        Courseline.RESET();
        Courseline.SETRANGE("Cod Course");
        IF Courseline.FINDSET() THEN
            REPEAT
                Validate_Line(Courseline);
            UNTIL Courseline.NEXT() = 0;

        Reg_Hist(Course);
        Rec := Course;
    end;

    var
        Courseline: Record 60004;
        Course: Record 60003;
        OldCourse: Record 60006;
        OldLine: Record 60007;
        SeriesSetup: Record 60005;
        NoSeriesMgt: Codeunit 396;

    procedure Validate_Line(Courseline: Record 60004)
    begin

        Courseline.CALCFIELDS("Student Name");
        IF Courseline."Student Name" = '' THEN
            ERROR('The code %1 does not have a name', Courseline."Cod Student");
    end;

    procedure Reg_Hist(Course: Record 60003)
    begin

        OldCourse.SETRANGE("Previous Code Course", Course."Cod Course");
        IF OldCourse.ISEMPTY() THEN
            OldCourse.TRANSFERFIELDS(Course);
        OldCourse."Previous Code Course" := Course."Cod Course";

        IF OldCourse."Cod Course" = Course."Cod Course" THEN BEGIN
            SeriesSetup.GET();
            SeriesSetup.TESTFIELD("Course Historic Nos.");
            OldCourse."Cod Course" := NoSeriesMgt.GetNextNo(SeriesSetup."Course Historic Nos.", TODAY(), TRUE);
            OldCourse."No. Series" := SeriesSetup."Course Historic Nos.";
            OldCourse.INSERT();
        END;


        WITH OldLine DO
            IF Courseline.FINDSET() THEN
                REPEAT
                    TRANSFERFIELDS(Courseline);
                    INSERT();
                UNTIL Courseline.NEXT() = 0;
        Courseline.DELETEALL();


    end;
}

