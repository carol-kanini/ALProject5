table 50102 "Mini Sales Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Mini Customer"."No.";

            trigger OnValidate()
            begin
                if Rec."Customer No." <> '' then begin
                    MiniCustomer.Get(Rec."Customer No.");
                    Rec."Customer Name" := MiniCustomer.Name;
                end;
            end;
        }

        field(3; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(4; "Order Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(5; "Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Open,Posted;
            OptionCaption = 'Open,Posted';
        }

        field(6; "Total Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(7; "Salesperson Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Mini Salesperson"."Code";

            trigger OnValidate()
            begin
                if Rec."Salesperson Code" <> '' then begin
                    MiniSalesperson.Get(Rec."Salesperson Code");
                    Rec."Salesperson Name" := MiniSalesperson.Name;
                end;
            end;
        }

        field(8; "Salesperson Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }  // ← fields closes here

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        MiniCustomer: Record "Mini Customer";      // only once!
        MiniSalesperson: Record "Mini Salesperson";

    // Fires automatically when a new order is created
    trigger OnInsert()
    begin
        // Auto fill order date
        if Rec."Order Date" = 0D then
            Rec."Order Date" := Today();

        // Auto generate order number
        if Rec."No." = '' then
            Rec."No." := GetNextOrderNo();
    end;

    local procedure GetNextOrderNo(): Code[20]
    var
        SalesHeader: Record "Mini Sales Header";
    begin
        if SalesHeader.FindLast() then
            exit(IncStr(SalesHeader."No."))
        else
            exit('SO001');
    end;
}  // ← table closes here