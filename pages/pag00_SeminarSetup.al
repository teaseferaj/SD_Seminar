page 50100 "CSD Seminar Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Seminar Setup';

    layout
    {
        area(Content)
        {
            group(numbering)
            {
                field("Seminar Nos."; "Seminar Nos.")
                {

                }

                field("Seminar Registration Nos."; "Seminar Registration Nos.")
                {

                }

                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }


    //insert a new record if there is no record in the seminar setup page
    trigger OnOpenPage();
    begin
        if not get then begin
            init;
            insert;

        end;
    end;

}