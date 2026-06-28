report 50100 "Mini Stock Report"
{
    Caption = 'Mini Stock Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(MiniItem; "Mini Item")
        {
            column(ItemNo; "Item No.")
            {
                Caption = 'Item No.';
            }

            column(ItemName; "Item Name")
            {
                Caption = 'Item Name';
            }

            column(Quantity; Quantity)
            {
                Caption = 'Quantity in Stock';
            }

            column(UnitPrice; "Unit price")
            {
                Caption = 'Unit Price';
            }

            column(TotalPrice; "Total Price")
            {
                Caption = 'Total Stock Value';
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
            Caption = 'Mini Stock Report Excel';
            LayoutFile = 'MiniStockReport.xlsx';
        }
    }
}