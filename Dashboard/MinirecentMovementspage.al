page 50124 "Mini Recent Movements"
{
    PageType = CardPart;
    SourceTable = "Mini Stock Movement";
    ApplicationArea = All;
    RefreshOnActivate = true;
    Editable = false;
    SourceTableView = sorting("Entry No.") order(Descending);

    layout
    {
        area(Content)
        {
            group(Movement1)
            {
                ShowCaption = false;

                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Caption = '📅 Date';
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = '📦 Item No.';
                }

                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    Caption = '📝 Description';
                }

                field("Movement Type"; Rec."Movement Type")
                {
                    ApplicationArea = All;
                    Caption = '🔄 Type';
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Caption = '🔢 Quantity';
                }

                field("Sold By"; Rec."Sold By")
                {
                    ApplicationArea = All;
                    Caption = '👤 Sold By';
                }
            }
        }
    }
}