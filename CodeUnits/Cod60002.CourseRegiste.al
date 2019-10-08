codeunit 60002 "Course Registe"
{
    // version test

    TableNo = 60003;

    trigger OnRun()
    begin
        CourseCab.COPY(Rec);
        Code();
        Rec := CourseCab;
    end;

    var
        CourseCab: Record 60003;
        //"Hist.Course-Line": Record 60007;
        RegisterCourseLine: Codeunit 60004;
        MovReg: Codeunit 60005;
        Option: Option;

    local procedure "Code"()
    // var
    //     CourseSetup: Record 60005;
    begin

        Option := DIALOG.STRMENU('Reg without Mov,Reg with Mov');

        IF Option = 1 THEN BEGIN
            RegisterCourseLine.RUN(CourseCab);
            MESSAGE('Reg without Mov');
        END ELSE
            IF Option = 2 THEN BEGIN
                MovReg.RUN(CourseCab);
                MESSAGE('Reg with Mov');
            END;
    end;
}

