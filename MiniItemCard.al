page 50101 "Mini Item Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Mini Item";
    caption = 'Mini Item Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = All;
                }
                field("Unit price"; Rec."Unit price")
                {
                    ApplicationArea = All;
                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}