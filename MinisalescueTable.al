table 50104 "Mini Sales Cue"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }

        // Live count of all customers
        field(2; "Total Customers"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Customer");
            Editable = false;
        }

        // Live count of all items
        field(3; "Total Items"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Item");
            Editable = false;
        }

        // Live count of open orders
        field(4; "Open Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Sales Header" where(Status = const(Open)));
            Editable = false;
        }

        // Live count of posted orders
        field(5; "Posted Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mini Sales Header" where(Status = const(Posted)));
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