page 50102 "CSD Seminar List"
{
    PageType = List;
    UsageCategory = Lists; //The page is listed as Lists under the Pages and Tasks category.
    SourceTable = "CSD Seminar";
    Caption='Seminar List';
    Editable=false;
    CardPageId=50101; //Sets the card page that is associated with items in the current list page.
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    
                }

                field("Name";"Name")
                {

                }

                field("Seminar Duration"; "Seminar Duration")
                 {

                 }
                field("Seminar Price"; "Seminar Price")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {

                }
                
                field("Maximum Participants";"Maximum Participants")
                {

                }

            }
        }

        area(FactBoxes)
        {
           systempart("Links";Links)
           {

           }

           systempart("Notes";Notes)
           {

           }
        }
    }
    
    actions
    {
        area(Navigation)
        {

            group("&Seminar")
            {

            action("Co&mments")
            {
                RunObject=page "CSD Seminar Comment Sheet";
                RunPageLink="Table Name"=const(Seminar),"No."=field("No.");
                Image=Comment;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    }
    var
        myInt: Integer;
}