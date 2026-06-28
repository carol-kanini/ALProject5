page 50101 "Mini Item Card"
{
    PageType = Card;
    SourceTable = "Mini Item";
    ApplicationArea = All;
    Caption = 'Mini Item Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Item No."; Rec."Item No.") { }
                field("Item Name"; Rec."Item Name") { }
            }

            group(Prices)
            {
                field("Unit Price"; Rec."Unit Price") { }
                field(Quantity; Rec.Quantity) { }
                field("Total Price"; Rec."Total Price") { Editable = false; }
            }
        }
    }
}