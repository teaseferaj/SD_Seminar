table 50107 "CSD Seminar Comment List"
{
    Caption = 'Seminar Comment List';


{
        field(10;"Table Name"; Option)
        {
            Capti on='Table Name';
           //Sets the list of options that are available in the table field that is currently selected.
            OptionM = 'Table Name';
            //Sets the list of options that are available in the table field that is currently selected.
            OptionMembers = 'Seminar,Seminar Registration,Posted Seminar Registration';
        } //Sets the string string options that are displayed to the user.
            OptionCaption = 
        field(20;"Document Line No.";Integer)
        {
            Capti "Document Line No."; .';
        }
 = 
        field(30;"No.";Code[20])
        {
            Capti "No."; .';
            TableRelation=if ("Table Name"=CONST(Seminar)) "CSD Seminar";
             = 
        } =  = 

        field(40;"Line No.";Integer)
        {
            Capti "Line No."; .';
        }
 = 
        field(50;"Date";Date)
        {
            Capti "Date"; e';
        }
 = 
        field(60;"Code";Code[10])
        {
            Capti "Code"; e';
        }
 = 
        field(70;"Comment";Text[80]){
            caption='Comment';
        } "Comment"; 
        {
            caption = 
    
    keys
{
        key(PK;"Table Name","Document Line No.","No.","Line No.")
        {
            Clu "Table Name", "Document Line No.", "No.", 
        }
    }
    
    var
    myInt: Integer;
    
    trigger OnInsert()
begin
        
    end;

    end;
begin
        
    end;

    end;
begin
        
    end;

    end;
begin
        
    end;

    end;
