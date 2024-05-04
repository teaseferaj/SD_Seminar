page 50136 "CSD Posted Seminar Reg. List"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    Caption = 'Seminar Registration List';
    CardPageID = "CSD Posted Seminar Reg.";
    Editable = false;
    PageType = List;
    SourceTable = "CSD Posted Seminar Reg. Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field("Starting Date"; "Starting Date")
                {
                }
                field("Seminar No."; "Seminar No.")
                {
                }
                field("Seminar Name"; "Seminar Name")
                {
                }
                field(Status; Status)
                {
                }
                field(Duration; Duration)
                {
                }
                field("Maximum Participants"; "Maximum Participants")
                {
                }
                field("Room Resource No."; "Room Resource No.")
                {
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details Factbox"; "CSD Seminar Details FactBox")
            {
                SubPageLink = "No." = Field("Seminar No.");
            }
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
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "CSD Seminar Comment Sheet";
                    RunPageLink = "No." = Field("No.");
                    RunPageView = where("Table Name" = const("Posted Seminar Registration"));

                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page "CSD Posted Seminar Charges";
                    //RunPageLink = "Document No."=field("No.");
                    RunPageLink = "Document No." = field("No.");
                }
            }
        }
    }
}

