table 50105 "Mini Stock Movement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }

        field(2; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Mini Item"."Item No.";
        }

        field(3; "Item Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Movement Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Sale,Restock;
            OptionCaption = 'Sale,Restock';
        }

        field(5; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(6; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(7; "Reference No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(8; "Sold By"; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}