page 50125 "Mini Quick Actions"
{
    PageType = CardPart;
    ApplicationArea = All;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(QuickActions)
            {
                Caption = '⚡ Quick Actions';

                group(Row1)
                {
                    ShowCaption = false;

                    field(NewCustomerBtn; NewCustomerTxt)
                    {
                        ApplicationArea = All;
                        Caption = '➕ New Customer';
                        Editable = false;
                        Style = Favorable;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Mini Customer List");
                        end;
                    }

                    field(NewItemBtn; NewItemTxt)
                    {
                        ApplicationArea = All;
                        Caption = '📦 New Item';
                        Editable = false;
                        Style = Favorable;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Mini Item List");
                        end;
                    }
                }

                group(Row2)
                {
                    ShowCaption = false;

                    field(NewOrderBtn; NewOrderTxt)
                    {
                        ApplicationArea = All;
                        Caption = '🧾 New Sales Order';
                        Editable = false;
                        Style = Favorable;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Mini Sales Order Card");
                        end;
                    }

                    field(ReportsBtn; ReportsTxt)
                    {
                        ApplicationArea = All;
                        Caption = '📈 Reports';
                        Editable = false;
                        Style = Favorable;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Mini Sales Header List");
                        end;
                    }
                }
            }
        }
    }

    var
        NewCustomerTxt: Text;
        NewItemTxt: Text;
        NewOrderTxt: Text;
        ReportsTxt: Text;

    trigger OnOpenPage()
    begin
        NewCustomerTxt := 'Click to add a new customer';
        NewItemTxt := 'Click to add a new item';
        NewOrderTxt := 'Click to create a new sales order';
        ReportsTxt := 'Click to view all orders';
    end;
}