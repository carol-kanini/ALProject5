page 50114 "Mini Sales Order Card"
{
    PageType = Card;
    SourceTable = "Mini Sales Header";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Order Details';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }

                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                }

                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }

                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }

                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                }
            }

            part(SalesLines; "Mini Sales Line List")
            {
                ApplicationArea = All;
                SubPageLink = "Order No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PostOrder)
            {
                Caption = 'Post Order';
                ApplicationArea = All;
                Image = Post;

                trigger OnAction()
                var
                    SalesLine: Record "Mini Sales Line";
                    MiniItem: Record "Mini Item";
                    StockMovement: Record "Mini Stock Movement"; // ← new
                begin
                    // Check 1 - order must have a customer
                    if Rec."Customer No." = '' then
                        Error('Please select a customer before posting.');

                    // Check 2 - order must have at least one line
                    SalesLine.SetRange("Order No.", Rec."No.");
                    if not SalesLine.FindFirst() then
                        Error('Please add at least one item line before posting.');

                    // Check 3 - reduce stock for each line
                    SalesLine.SetRange("Order No.", Rec."No.");
                    if SalesLine.FindSet() then
                        repeat
                            if MiniItem.Get(SalesLine."Item No.") then begin
                                // Check if enough stock available
                                if MiniItem.Quantity < SalesLine.Quantity then
                                    Error('Not enough stock for item %1. Available: %2, Required: %3',
                                        SalesLine."Item No.",
                                        MiniItem.Quantity,
                                        SalesLine.Quantity);

                                // Reduce stock
                                MiniItem.Quantity := MiniItem.Quantity - SalesLine.Quantity;

                                // Recalculate total price
                                MiniItem."Total Price" := MiniItem.Quantity * MiniItem."Unit price";

                                MiniItem.Modify();

                                // Record stock movement ← new
                                StockMovement.Init();
                                StockMovement."Item No." := SalesLine."Item No.";
                                StockMovement."Item Description" := SalesLine.Description;
                                StockMovement."Movement Type" := StockMovement."Movement Type"::Sale;
                                StockMovement.Quantity := SalesLine.Quantity;
                                StockMovement."Date" := Today();
                                StockMovement."Reference No." := Rec."No.";
                                StockMovement."Sold By" := Rec."Salesperson Name";
                                StockMovement.Insert();
                            end;
                        until SalesLine.Next() = 0;

                    // Check 4 - change status to Posted and lock
                    Rec.Status := Rec.Status::Posted;
                    Rec.Modify();

                    Message('Order %1 has been posted successfully!', Rec."No.");
                end;
            }
        }
    }
}