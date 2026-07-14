table 50121 "Mini Welcome Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Company Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Company Motto"; Text[100])
        {
            DataClassification = CustomerContent;
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