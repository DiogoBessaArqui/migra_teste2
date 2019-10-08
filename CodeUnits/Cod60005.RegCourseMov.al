codeunit 60005 "Reg Course Mov."
{
    // version test

    TableNo = 60003;

    trigger OnRun()
    begin

        Course.COPY(Rec);
        CourseLine.RESET();
        CourseLine.SETRANGE("Cod Course");
        IF CourseLine.FINDSET() THEN
            REPEAT
                Validate_Line(CourseLine);
            UNTIL CourseLine.NEXT() = 0;

        Reg_Hist(Course);
        Rec := Course;

    end;

    var
        OldCourse: Record 60006;
        Mov: Record 60008;
        OldLine: Record 60007;
        Course: Record 60003;
        CourseLine: Record 60004;
        SeriesSetup: Record 60005;
        // RegLine: Codeunit 60004;
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


        OldLine.SETRANGE("Cod Course", CourseLine."Cod Course");
        WITH OldLine DO
            IF CourseLine.FINDSET() THEN
                REPEAT
                    TRANSFERFIELDS(CourseLine);
                    INSERT();
                UNTIL CourseLine.NEXT() = 0;
        CourseLine.DELETEALL();


        IF Mov.FINDLAST() THEN
            Mov."No. Movement" := Mov."No. Movement"
        ELSE
            Mov."No. Movement" := 0;

        OldCourse.RESET();
        OldCourse.SETRANGE("Previous Code Course", Course."Cod Course");
        IF OldCourse.FINDFIRST() THEN BEGIN
            Mov.INIT();
            Mov."Cod Course" := OldCourse."Cod Course";
            Mov."Course Name" := OldCourse."Course Name";
            Mov."Initial Date" := OldCourse."Initial Date";
            Mov."Final Date" := OldCourse."Final Date";
            Mov.Duration := OldCourse.Duration;
            Mov."Cod Prof" := OldCourse."Cod Prof";
        END;


        OldLine.RESET();
        OldLine.SETRANGE("Cod Course", Course."Cod Course");
        IF OldLine.FINDSET() THEN
            REPEAT
                Mov."Cod Student" := OldLine."Cod Student";
                Mov."Student Name" := OldLine."Student Name";
                Mov."No. Movement" := Mov."No. Movement" + 1;
                Mov.INSERT();
            UNTIL OldLine.NEXT() = 0;
    END;
}

