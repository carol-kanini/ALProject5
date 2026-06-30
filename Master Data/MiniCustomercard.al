page 50120 "Mini Customer Card"
{
    PageType = Card;
    SourceTable = "Mini Customer";
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Mini Customer Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General Information';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}