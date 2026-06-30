page 50119 "Mini Sales Alerts Page"
{
    PageType = CardPart;
    SourceTable = "Mini Sales Cue";
    ApplicationArea = All;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(Alerts)
            {
                Caption = 'Alerts - Needs Attention';
                field(LowStockItems; Rec."Low Stock Items")
                {
                    ApplicationArea = All;
                    Caption = 'Low Stock Items';
                    DrillDownPageId = "Mini Item List";
                    Style = Unfavorable;
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        MiniItem: Record "Mini Item";
                    begin
                        MiniItem.SetFilter(Quantity, '..9');
                        Page.Run(Page::"Mini Item List", MiniItem);
                    end;
                }

                field(PendingOrders; Rec."Open Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Pending Posting';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Ambiguous;
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