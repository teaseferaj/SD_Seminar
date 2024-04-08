table 50104 "CSD Seminar Comment Line"
{
    Caption= 'Seminar Comment Line';
   //LookupPageId="CSD Seminar Comment List";
   //DrillDownPageId="CSD Seminar Comment List";
    
    fields
    {
        field(10; "Table Name"; Option)
        {
            OptionMembers = "Seminar","Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration,Posted Seminar Registration';
        }

        field(20; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }

        field(30; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if ("Table Name" = CONST(Seminar)) "CSD Seminar";

        }

        field(40; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(50; "Date"; Date)
        {
            Caption = 'Date';
        }

        field(60; "Code"; Code[10])
        {
            Caption = 'Code';
        }

        field(70; "Comment"; Text[80])
        {
            caption = 'Comment';
        }
    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}