Page 50117 "Mini Salesperson List"
{
    PageType = List;
    SourceTable = "Mini Salesperson";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                // Unique code for salesperson e.g SP001
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }

                // Full name
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }

                // Email address
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                }

                // Phone number
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}