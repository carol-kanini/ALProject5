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
            part(SalesCuePart; "Mini Sales Cue Page")
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

                // ← removed extra { } that was here
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
        }
    }
}