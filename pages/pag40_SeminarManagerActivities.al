page 50140 "CSD Seminar Manager Activities"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Cue";
    Caption = 'Seminar Manager Activities';
    Editable = false;

    layout
    {
        area(Content)
        {
            cuegroup(Registrations)
            {
                Caption = 'Registrations';
                field(Planned; Planned)
                {
                    ApplicationArea = All;

                }
                field(Registered; Registered)
                {
                }

                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registration";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("For Posting")
            {
                field(Closed; Closed)
                {
                }


            }
        }
    }



    var
        myInt: Integer;

    trigger OnOpenPage()

    begin
        if not get then begin
            init;
            insert;
        end;
    end;
}