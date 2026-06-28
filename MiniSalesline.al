table 50103 "Mini Sales Line"
{
    DataClassification = CustomerContent; // Stores customer related data (GDPR)

    fields
    {
        // Links this line to a Sales Order - must exist in Mini Sales Header
        field(1; "Order No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Mini Sales Header"."No."; // FK to Sales Header
        }

        // Line number within the order - 1, 2, 3...
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }

        // Which item is being ordered - must exist in Mini Item table
        field(3; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Mini Item"."Item No."; // FK to Mini Item table

            // Fires automatically when Item No. is selected
            trigger OnValidate()
            begin
                if Rec."Item No." <> '' then begin  // if item no is not empty
                    MiniItem.Get(Rec."Item No.");    // find that item record
                    Rec.Description := MiniItem."item name";  // copy description
                    Rec."Unit Price" := MiniItem."Unit Price"; // copy price
                end;

            end;
        }

        // Item description - auto filled from Mini Item table
        field(4; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        // How many units being ordered
        // Recalculates Line Total when changed
        field(5; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;

            // Fires when Quantity changes
            trigger OnValidate()
            begin
                // Line Total = Quantity x Unit Price
                Rec."Line Total" := Rec.Quantity * Rec."Unit Price";
                UpdateHeaderTotal();
            end;
        }

        // Price per unit - auto filled from Mini Item table
        // Recalculates Line Total when changed
        field(6; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;

            // Fires when Unit Price changes
            trigger OnValidate()
            begin
                // Line Total = Quantity x Unit Price
                Rec."Line Total" := Rec.Quantity * Rec."Unit Price";
                UpdateHeaderTotal();
            end;
        }

        // Quantity x Unit Price - calculated automatically
        // Editable = false - user cannot type here
        field(7; "Line Total"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false; // read only - only updated by triggers above
        }
    }

    keys
    {
        // Primary Key uses TWO fields - Order No + Line No
        // Together they make a unique record e.g SO001 + Line 1
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if Rec."Line No." = 0 then
            Rec."Line No." := GetNextLineNo();
    end;

    local procedure GetNextLineNo(): Integer
    var
        SalesLine: Record "Mini Sales Line";
    begin
        SalesLine.SetRange("Order No.", Rec."Order No.");
        if SalesLine.FindLast() then
            exit(SalesLine."Line No." + 1)
        else
            exit(1); // first line starts at 1
    end;

    // Variable to hold a Mini Item record when fetching item details
    var
        MiniItem: Record "Mini Item";

    local procedure UpdateHeaderTotal()
    var
        SalesHeader: Record "Mini Sales Header";
        SalesLine: Record "Mini Sales Line";
        Total: Decimal;
    begin
        // Reset total to zero first
        Total := 0;

        // Add up all saved lines for this order
        SalesLine.SetRange("Order No.", Rec."Order No.");
        SalesLine.SetFilter("Line No.", '<>%1', Rec."Line No."); // exclude current line
        if SalesLine.FindSet() then
            repeat
                Total += SalesLine."Line Total";
            until SalesLine.Next() = 0;

        // Add current line being edited
        Total += Rec."Line Total";

        // Update the Sales Header Total Amount
        if SalesHeader.Get(Rec."Order No.") then begin
            SalesHeader."Total Amount" := Total;
            SalesHeader.Modify();
        end;
    end;
}