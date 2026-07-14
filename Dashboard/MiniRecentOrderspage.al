page 50123 "Mini Recent Orders"
{
    PageType = ListPart;
    SourceTable = "Mini Sales Header";
    ApplicationArea = All;
    RefreshOnActivate = true;
    Editable = false;
    SourceTableView = sorting("No.") order(Descending);

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Order No.';
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer';
                }

                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    Caption = 'Date';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    StyleExpr = StatusStyle;
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                }
            }
        }
    }

    var
        StatusStyle: Text;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Posted then
            StatusStyle := 'Favorable'
        else
            StatusStyle := 'Ambiguous';
    end;
}