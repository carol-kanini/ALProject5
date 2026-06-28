report 50103 "Mini Customer Report"
{
    Caption = 'Mini Customer Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ExcelLayout;

    dataset
    {
        dataitem(MiniCustomer; "Mini Customer")
        {
            column(CustomerNo; "No.")
            {
                Caption = 'Customer No.';
            }

            column(CustomerName; Name)
            {
                Caption = 'Customer Name';
            }

            column(PhoneNo; "Phone No.")
            {
                Caption = 'Phone No.';
            }

            column(Email; Email)
            {
                Caption = 'Email';
            }

            column(City; City)
            {
                Caption = 'City';
            }

            column(TotalOrders; TotalOrders)
            {
                Caption = 'Total Orders';
            }

            column(TotalSpent; TotalSpent)
            {
                Caption = 'Total Spent';
            }

            column(CompanyName; CompanyName())
            {
                Caption = 'Company Name';
            }
            trigger OnAfterGetRecord()
            var
                SalesHeader: Record "Mini Sales Header";
            begin
                // Use field name directly - no Rec. needed in reports
                SalesHeader.SetRange("Customer No.", "No.");
                TotalOrders := SalesHeader.Count();

                TotalSpent := 0;
                SalesHeader.SetRange("Customer No.", "No.");
                SalesHeader.SetRange(Status, SalesHeader.Status::Posted);
                if SalesHeader.FindSet() then
                    repeat
                        TotalSpent += SalesHeader."Total Amount";
                    until SalesHeader.Next() = 0;
            end;
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
            Caption = 'Mini Customer Report Excel';
            LayoutFile = 'MiniCustomerReport.xlsx';
        }
    }

    var
        TotalOrders: Integer;
        TotalSpent: Decimal;
}