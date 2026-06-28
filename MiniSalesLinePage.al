page 50113 "Mini Sales Line List"
{
    PageType = ListPart;           // This is a list page showing multiple records
    SourceTable = "Mini Sales Line";  // Data comes from Mini Sales Line table
    ApplicationArea = All;     // Visible in all areas of BC
    UsageCategory = Lists;     // Shows up in search under Lists category

    layout
    {
        area(Content)
        {
            repeater(General)  // Repeater = shows records as rows in a table
            {
                // Which order this line belongs to e.g SO001
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }

                // The line number within the order e.g 1, 2, 3
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }

                // Which item is being ordered
                // When selected, Description and Unit Price fill automatically
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }

                // Item description - fills automatically from Mini Item table
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }

                // How many units being ordered
                // When changed, Line Total recalculates automatically
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                // Price per unit - fills automatically from Mini Item table
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }

                // Quantity x Unit Price - calculated automatically
                field("Line Total"; Rec."Line Total")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}