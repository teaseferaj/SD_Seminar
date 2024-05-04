codeunit 50132 "CSD Seminar Jnl-Post Line"

{

    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin

    end;

    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";
        NextEntryNo: Integer;


    procedure RunWithCheck(var SeminarJnlLine2: Record "CSD Seminar Journal Line");
    var
        myInt: Integer;
    begin
        with SeminarJnlLine2 do begin
            SeminarJnlLine := SeminarJnlLine2;
            Code();
            SeminarJnlLine2 := SeminarJnlLine;
        end;
    end;

    procedure Code();
    begin
        // Check whether the SeminarJnlLine is empty
        if SeminarJnlLine.EmptyLine then
            exit;

        // Run the RunCheck function of the SeminarJnlCheckLine codeunit
        SeminarJnlCheckLine.RunCheck(SeminarJnlLine);

        // If NextEntryNo is 0
        if NextEntryNo = 0 then begin
            // Lock the SeminarLedgEntry record
            SeminarLedgerEntry.LockTable;

            // If a last record exists in SeminarLedgerEntry table, set NextEntryNo to its Entry No.
            if SeminarLedgerEntry.FindLast then
                NextEntryNo := SeminarLedgerEntry."Entry No.";

            // Increase NextEntryNo by one
            NextEntryNo += 1;
        end;

        // If Document Date is empty, set it to Posting Date
        if SeminarJnlLine."Document Date" = 0D then
            SeminarJnlLine."Document Date" := SeminarJnlLine."Posting Date";

        // Create or update SeminarRegister record
        if SeminarRegister."No." = 0 then begin
            // Lock SeminarRegister table
            SeminarRegister.LockTable;

            // If no record exists or it's the first call, initialize and populate fields
            if (not SeminarRegister.FindLast) or (SeminarRegister."To Entry No." <> 0) then begin
                SeminarRegister.INIT;
                SeminarRegister."No." += 1;
                SeminarRegister."From Entry No." := NextEntryNo;
                SeminarRegister."To Entry No." := NextEntryNo;
                SeminarRegister."Creation Date" := TODAY;
                SeminarRegister."Source Code" := 'Source Code';
                SeminarRegister."Journal Batch Name" := 'Journal Batch Name';
                SeminarRegister."User ID" := USERID;
                SeminarRegister.Insert;
            end;
        end;

        // Create a new SeminarLedgerEntry record
        SeminarLedgerEntry.INIT;
        SeminarLedgerEntry."Seminar No." := SeminarJnlLine."Seminar No.";
        SeminarLedgerEntry."Posting Date" := SeminarJnlLine."Posting Date";
        SeminarLedgerEntry."Document Date" := SeminarJnlLine."Document Date";
        SeminarLedgerEntry."Entry Type" := SeminarJnlLine."Entry Type";
        SeminarLedgerEntry."Document No." := SeminarJnlLine."Document No.";
        SeminarLedgerEntry.Description := SeminarJnlLine.Description;
        // Populate other fields similarly

        // Increment NextEntryNo and insert SeminarLedgerEntry record
        SeminarLedgerEntry."Entry No." := NextEntryNo;
        NextEntryNo += 1;
        SeminarLedgerEntry.Insert;
    end;

}