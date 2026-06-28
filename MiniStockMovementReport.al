report 50102 "Mini Stock Movement Report"
{
    Caption = 'Mini Stock Movement Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(MiniStockMovement; "Mini Stock Movement")
        {
            column(EntryNo; "Entry No.")
            {
                Caption = 'Entry No.';
            }

            column(Date; "Date")
            {
                Caption = 'Date';
            }

            column(ItemNo; "Item No.")
            {
                Caption = 'Item No.';
            }

            column(ItemDescription; "Item Description")
            {
                Caption = 'Item Description';
            }

            column(MovementType; "Movement Type")
            {
                Caption = 'Movement Type';
            }

            column(Quantity; Quantity)
            {
                Caption = 'Quantity';
            }

            column(ReferenceNo; "Reference No.")
            {
                Caption = 'Reference No.';
            }

            column(SoldBy; "Sold By")
            {
                Caption = 'Sold By';
            }

            column(CompanyName; CompanyName())
            {
                Caption = 'Company Name';
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    Caption = 'Filters';
                }
            }
        }
    }

    rendering
    {
        layout(ExcelLayout)
        {
            Type = Excel;
            Caption = 'Mini Stock Movement Report Excel';
            LayoutFile = 'MiniStockMovementReport.xlsx';
        }
    }
}