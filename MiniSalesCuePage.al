page 50116 "Mini Sales Cue Page"
{
    PageType = CardPart;
    SourceTable = "Mini Sales Cue";
    ApplicationArea = All;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(Overview)
            {
                Caption = '🌿 Savanna Sales Ltd. — Welcome Back!';

                field(TotalCustomers; Rec."Total Customers")
                {
                    ApplicationArea = All;
                    Caption = 'Customers 👥';
                    DrillDownPageId = "Mini Customer List";
                    Style = Favorable;  // green
                }

                field(TotalItems; Rec."Total Items")
                {
                    ApplicationArea = All;
                    Caption = 'Items in Stock 📦';
                    DrillDownPageId = "Mini Item List";
                    Style = Favorable;  // green
                }

                field(OpenOrders; Rec."Open Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Open Orders 🕐';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Ambiguous;  // yellow - needs attention
                }

                field(PostedOrders; Rec."Posted Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Orders ✅';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Favorable;  // green - completed
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        SalesCue: Record "Mini Sales Cue";
    begin
        if not SalesCue.Get() then begin
            SalesCue.Init();
            SalesCue.Insert();
        end;
        Rec := SalesCue;
    end;
}