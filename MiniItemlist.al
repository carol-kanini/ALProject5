page 50101 "Mini Item List"
{
    PageType = List;
    SourceTable = "Mini Item";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Mini Items';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.") { }
                field("Item Name"; Rec."Item Name") { }
                field("Unit Price"; Rec."Unit Price") { }
                field("Quantity"; Rec."Quantity") { }
                field("Total Price"; Rec."Total Price") { }
            }
        }
    }
}