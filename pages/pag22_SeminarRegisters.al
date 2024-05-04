page 50122 "CSD Seminar Registers"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar Register";
    Editable = false;
    Caption = 'Seminar Register';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    Caption = 'No.';
                }
                field("Creation Date"; "Creation Date")
                {
                    Caption = 'Creation Date';
                }
                field("User ID"; "User ID")
                {
                    Caption = 'User ID';
                }
                field("Source Code"; "Source Code")
                {
                    Caption = 'Source Code';
                }
                field("Journal Batch Name"; "Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
            }
            systempart("Notes"; Notes)
            {
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show Ledger";
            }
        }
    }
}