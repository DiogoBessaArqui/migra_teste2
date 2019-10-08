codeunit 60003 "Course Registe + Print"
{
    // version test

    TableNo = 60003;

    trigger OnRun()
    begin
        CourseCab.COPY(Rec);
        Code();
        Rec := CourseCab;

        RegisterCourseLine.RUN(CourseCab);
    end;

    var
        CourseCab: Record 60003;
        Hist: Report 60021;
        RegisterCourseLine: Codeunit 60004;

    local procedure "Code"()
    // var
    //     CourseSetup: Record 60005;
    begin
        Hist.RUN();
    end;
}

