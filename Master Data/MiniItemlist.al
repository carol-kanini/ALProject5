page 50110 "Mini Item List"
{
    PageType = List;
    SourceTable = "Mini Item";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Mini Items';
    CardPageId = "Mini item Card"; //links to card page

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Name"; Rec."Item Name")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
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
    trigger OnOpenPage()
    begin
        Message('Mini Item List PAGE OPENED');
    end;
}