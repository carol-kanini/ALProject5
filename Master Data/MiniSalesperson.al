table 50106 "Mini Salesperson"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Email"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Phone No."; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Description"; Text[30])
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

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        if "Code" = '' then
            "Code" := NoSeries.GetNextNo('SP', WorkDate());
    end;
}