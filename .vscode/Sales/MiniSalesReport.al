report 50101 "Mini Sales Report"
{
    Caption = 'Mini Sales Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(MiniSalesHeader; "Mini Sales Header")
        {
            column(OrderNo; "No.")
            {
                Caption = 'Order No.';
            }
            column(CustomerNo; "Customer No.")
            {
                Caption = 'Customer No.';
            }
            column(CustomerName; "Customer Name")
            {
                Caption = 'Customer Name';
            }
            column(OrderDate; "Order Date")
            {
                Caption = 'Order Date';
            }
            column(Status; Status)
            {
                Caption = 'Status';
            }
            column(TotalAmount; "Total Amount")
            {
                Caption = 'Total Amount';
            }
            column(SalespersonName; "Salesperson Name")
            {
                Caption = 'Salesperson Name';
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
            Caption = 'Mini Sales Report Excel';
            LayoutFile = 'MiniSalesReport.xlsx';
        }

    }

}