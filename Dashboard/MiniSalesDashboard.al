page 50115 "Mini Sales Dashboard"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    Caption = 'Mini Sales Dashboard';
    UsageCategory = Administration;

    layout
    {
        area(RoleCenter)
        {
            // Combined welcome + KPIs + alerts
            part(SalesCuePart; "Mini Sales Cue Page")
            {
                ApplicationArea = All;
            }


            // Recent Orders
            part(RecentOrdersPart; "Mini Recent Orders")
            {
                ApplicationArea = All;
                Caption = 'Recent Sales Orders';
            }

            // Latest Stock Movements
            part(RecentMovementsPart; "Mini Recent Movements")
            {
                ApplicationArea = All;
                Caption = 'Latest Stock Movements';
            }
            //QuickActionsPart
            part(QuickActioPart; "Mini Quick Actions")
            {
                ApplicationArea = All;
                Caption = '⚡ Quick Actions';
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
                }

                action(AllOrders)
                {
                    Caption = 'All Orders';
                    ApplicationArea = All;
                    RunObject = page "Mini Sales Header List";
                }

                action(StockMovements)
                {
                    Caption = 'Stock Movements';
                    ApplicationArea = All;
                    RunObject = page "Mini Stock Movement List";
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
                }

                action(Items)
                {
                    Caption = 'Items';
                    ApplicationArea = All;
                    RunObject = page "Mini Item List";
                }

                action(Salespersons)
                {
                    Caption = 'Salespersons';
                    ApplicationArea = All;
                    RunObject = page "Mini Salesperson List";
                }

                action(WelcomeSetup)
                {
                    Caption = 'Welcome Setup';
                    ApplicationArea = All;
                    RunObject = page "Mini Welcome Setup Card";
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
                }

                action(SalesReport)
                {
                    Caption = 'Sales Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Sales Report";
                }

                action(MovementReport)
                {
                    Caption = 'Stock Movement Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Stock Movement Report";
                }

                action(CustomerReport)
                {
                    Caption = 'Customer Report';
                    ApplicationArea = All;
                    RunObject = report "Mini Customer Report";
                }
            }
        }
    }
}