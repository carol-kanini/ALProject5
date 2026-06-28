table 50106 "Mini Salesperson"
{
    DataClassification = Customercontent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Name"; text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Email"; text[100])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Phone No."; Text[30])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Pk; "Code")
        {
            Clustered = true;
        }
    }
}
