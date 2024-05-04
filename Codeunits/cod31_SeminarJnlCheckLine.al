codeunit 50131 "CSD Seminar Jnl.-Check Line"
{
    trigger OnRun();
    var
        SemJnlLine: Record "CSD Seminar Journal Line";
    begin
        RunCheck(SemJnlLine);
    end;

    var
        GlSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        ClosingDateTxt: Label 'cannot be a closing date';
        PostingDateTxt: Label 'is not within your range of allowed posting dates.';

    procedure RunCheck(var SemJnlLine: Record "CSD Seminar Journal Line")
    var
        myInt: Integer;
    begin
        // Enter code to test whether the Seminar Journal Line is empty by using the EmptyLine function.
        if SemJnlLine.EmptyLine then
            exit;

        with SemJnlLine do begin
            // Test that the Posting Date, Instructor Resource No., and Seminar No. fields are not empty.
            TestField("Posting Date");
            TestField("Instructor Resource No.");
            TestField("Seminar No.");

            // Depending on the value of the Charge Type field, make sure that certain fields are not empty.
            case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
            end;
            // If the line is Chargeable, make sure that the Bill-to Customer No. field is not blank.
            if Chargeable then
                TestField("Bill-to Customer No.");

            // Show an error if the Posting Date is a closing date
            if "Posting Date" = ClosingDate("Posting Date") then
                FieldError("Posting Date", ClosingDateTxt);

            // Make sure that the Posting Date field is between the Allow Posting From and Allow Posting To values
            // in the User Setup table or the G/L Setup table.
            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then begin
                    if UserSetup.GET(UserId) then begin
                        AllowPostingFrom := UserSetup."Allow Posting From";
                        AllowPostingTo := UserSetup."Allow Posting To";
                    end;
                end;

                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                    GLSetup.GET;
                    AllowPostingFrom := GLSetup."Allow Posting From";
                    AllowPostingTo := GLSetup."Allow Posting To";
                end;

                if AllowPostingTo = 0D then
                    AllowPostingTo := DMY2Date(31, 12, 9999);
            end;

            if ("Posting Date" < AllowPostingFrom) OR ("Posting Date" > AllowPostingTo) then
                FieldError("Posting Date", PostingDateTxt);

            // Show an error if the Document Date field is a closing date
            if ("Document Date" <> 0D) then begin
                if ("Document Date" = CLOSINGDATE("Document Date")) then
                    FIELDERROR("Document Date", PostingDateTxt);
            end;

        end;
    end;
}