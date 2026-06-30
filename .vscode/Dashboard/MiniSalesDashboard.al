page 50115 "Mini Sales Dashboard"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Savanna Business Solution';
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            // Row 1 - Business Overview
            part(SalesCuePart; "Mini Sales Cue Page")
            {
                ApplicationArea = All;
            }

            // Row 2 - Alerts
            part(AlertsCuePart; "Mini Sales Alerts Page")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Sales)
            {
                Caption = 'Sales';

                action(NewSalesOrder)
                {
                    Caption = 'New Sales Order';
                    ApplicationArea = All;
                    RunObject = page "Mini Sales Order Card";
                    Image = NewOrder;
                }

                action(AllOrders)
                {
                    Caption = 'All Orders';
                    ApplicationArea = All;
                    RunObject = page "Mini Sales Header List";
                    Image = List;
                }

                action(StockMovements)
                {
                    Caption = 'Stock Movements';
                    ApplicationArea = All;
                    RunObject = page "Mini Stock Movement List";
                    Image = Entries;
                }
            }

            group(MasterData)
            {
                Caption = 'Master Data';

                action(Customers)
                {
                    Caption = 'Customers';
                    ApplicationArea = All;
                    RunObject = page "Mini Customer List";
                    Image = Customer;
                }

                action(Items)
                {
                    Caption = 'Items';
                    ApplicationArea = All;
                    RunObject = page "Mini Item List";
                    Image = Item;
                }

                action(Salespersons)
                {
                    Caption = 'Salespersons';
                    ApplicationArea = All;
                    RunObject = page "Mini Salesperson List";
                    Image = SalesPerson;
                }
            }

            group(Reports)
            {
                Caption = 'Reports';

                action(StockReport)
                {
                    Caption = 'Stock Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Stock Report";
                    Image = Report;
                }

                action(SalesReport)
                {
                    Caption = 'Sales Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Sales Report";
                    Image = Report;
                }

                action(MovementReport)
                {
                    Caption = 'Stock Movement Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Stock Movement Report";
                    Image = Report;
                }

                action(CustomerReport)
                {
                    Caption = 'Customer Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Customer Report";
                    Image = Report;
                }
            }
        }
    }
}