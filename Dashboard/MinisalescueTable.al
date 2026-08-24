table 50104 "Mini Sales Cue"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Total Customers"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Customer");
            Editable = false;
        }

        field(3; "Total Items"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Item");
            Editable = false;
        }

        field(4; "Open Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Sales Header" where(Status = const(Open)));
            Editable = false;
        }

        field(5; "Posted Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Sales Header" where(Status = const(Posted)));
            Editable = false;
        }

        field(6; "Total Salespersons"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Salesperson");
            Editable = false;
        }

        // CHANGED - no longer a FlowField; calculated via UpdateLowStockCount()
        field(7; "Low Stock Items"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(8; "Total Movements"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Stock Movement");
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure UpdateLowStockCount()
    var
        MiniItem: Record "Mini Item";
        LowStockCount: Integer;
    begin
        LowStockCount := 0;
        if MiniItem.FindSet() then
            repeat
                if MiniItem.Quantity <= MiniItem."Reorder Point" then
                    LowStockCount += 1;
            until MiniItem.Next() = 0;

        "Low Stock Items" := LowStockCount;
        Modify();
    end;
}