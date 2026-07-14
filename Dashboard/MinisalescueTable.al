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

        // NEW - Total Salespersons
        field(6; "Total Salespersons"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Salesperson");
            Editable = false;
        }

        // NEW - Low Stock Items (quantity less than 10)
        field(7; "Low Stock Items"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Item" where(Quantity = filter(.. 9)));
            Editable = false;
        }

        // NEW - Total Stock Movements
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
}