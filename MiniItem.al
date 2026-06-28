table 50100 "Mini Item"

{

    DataClassification = CustomerContent;
    fields

    {
        field(1; "item No."; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Item Name"; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(3; "Unit price"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            trigger OnValidate()
            begin
                CalculateTotalPrice();
            end;
        }
        field(4; "Quantity"; Integer)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CalculateTotalPrice();
            end;
        }
        field(5; "Total Price"; Decimal)
        {
            DataClassification = CustomerContent;
            editable = false;
        }
    }

    
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }


    local procedure CalculateTotalPrice()
    begin
        "Total Price" := "Quantity" * "Unit price";
    end;

    trigger OnInsert()
    begin
        if "Item No." = '' then
            "Item No." := GetNextNo();
    end;

    local procedure GetNextNo(): Code[20]
    var
        ItemRec: Record "Mini Item";
    begin
        if ItemRec.FindLast() then
            exit(IncStr(ItemRec."Item No."))
        else
            exit('1');
    end;
}

