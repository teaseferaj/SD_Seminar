codeunit 50102 "CSD SeminarRegPrinted"
{
    TableNo = "CSD Seminar Reg. Header";
    trigger OnRun();
    begin
        Find;
        "No. Printed" += 1;
        Modify;
        Commit;
    end;
}

// Chapter 9 - Lab 1-2
// - Added Codeunit
