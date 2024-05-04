pageextension 50102 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Cost Accounting")
        {
            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';
                field(Seminar; "CSD Seminar")
                {
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}