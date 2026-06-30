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
                Caption = 'Business Overview';

                field(TotalCustomers; Rec."Total Customers")
                {
                    ApplicationArea = All;
                    Caption = 'Customers';
                    DrillDownPageId = "Mini Customer List";
                    Style = Standard;
                }

                field(TotalItems; Rec."Total Items")
                {
                    ApplicationArea = All;
                    Caption = 'Inventory';
                    DrillDownPageId = "Mini Item List";
                    Style = Favorable;
                }

                field(OpenOrders; Rec."Open Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Open Orders';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Attention;
                }

                field(PostedOrders; Rec."Posted Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Orders';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Favorable;
                }

                field(TotalSalespersons; Rec."Total Salespersons")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Team';
                    DrillDownPageId = "Mini Salesperson List";
                    Style = Standard;
                }

                field(TotalMovements; Rec."Total Movements")
                {
                    ApplicationArea = All;
                    Caption = 'Inventory Activity';
                    DrillDownPageId = "Mini Stock Movement List";
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