table 50101 "Mini Customer"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Phone No."; Text[30])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Email"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(5; "City"; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}