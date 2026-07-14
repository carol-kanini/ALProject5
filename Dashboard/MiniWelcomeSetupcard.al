page 50122 "Mini Welcome Setup Card"
{
    PageType = Card;
    SourceTable = "Mini Welcome Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Welcome Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Company Setup';

                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                }

                field("Company Motto"; Rec."Company Motto")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get('SETUP') then begin
            Rec.Init();
            Rec."Primary Key" := 'SETUP';
            Rec."Company Name" := 'Savanna Business Solutions';
            Rec."Company Motto" := 'Growing Business, Growing Dreams';
            Rec.Insert();
        end;
    end;
}