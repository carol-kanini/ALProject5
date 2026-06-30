page 50111 "Mini Customer List"
{
    PageType = List;
    SourceTable = "Mini Customer";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Mini Customer Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }

                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }

                field("City"; Rec."City")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}