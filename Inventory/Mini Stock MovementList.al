page 50118 "Mini Stock Movement List"
{
    PageType = List;
    SourceTable = "Mini Stock Movement";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;  // read only - nobody should edit movement history

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }

                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = All;
                }

                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                }

                field("Sold By"; Rec."Sold By")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}