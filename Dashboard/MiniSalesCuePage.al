page 50116 "Mini Sales Cue Page"
{
    PageType = CardPart;
    SourceTable = "Mini Sales Cue";
    ApplicationArea = All;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            // ═══════════════════════════════
            // SECTION 1 - WELCOME
            // ═══════════════════════════════
            group(WelcomeGroup)
            {
                Caption = '🌿 SAVANNA BUSINESS SOLUTIONS ERP';

                field(CompanyTile; CompanyText)
                {
                    ApplicationArea = All;
                    Caption = '🏢 Company';
                    Editable = false;
                    Style = Strong;

                }

                field(MottoTile; MottoText)
                {
                    ApplicationArea = All;
                    Caption = '💬 Motto';
                    Editable = false;
                    Style = Favorable;

                }

                field(GreetingTile; WelcomeText)
                {
                    ApplicationArea = All;
                    Caption = '👋 Greeting';
                    Editable = false;
                    Style = Ambiguous;
                }

                field(DateTile; DateText)
                {
                    ApplicationArea = All;
                    Caption = '📅 Date';
                    Editable = false;
                    Style = Subordinate;
                }
            }

            // ═══════════════════════════════
            // SECTION 2 - BUSINESS PERFORMANCE
            // ═══════════════════════════════
            cuegroup(Overview)
            {
                Caption = '🌿 SAVANNA BUSINESS SOLUTIONS — 📊 Business Performance';
                field(TotalCustomers; Rec."Total Customers")
                {
                    ApplicationArea = All;
                    Caption = '👥 Customers';
                    DrillDownPageId = "Mini Customer List";
                    Style = Favorable;
                }

                field(TotalItems; Rec."Total Items")
                {
                    ApplicationArea = All;
                    Caption = '📦 Items in Stock';
                    DrillDownPageId = "Mini Item List";
                    Style = Favorable;
                }

                field(OpenOrders; Rec."Open Orders")
                {
                    ApplicationArea = All;
                    Caption = '🧾 Open Orders';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Ambiguous;
                }

                field(PostedOrders; Rec."Posted Orders")
                {
                    ApplicationArea = All;
                    Caption = '✅ Posted Orders';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Favorable;
                }

                field(TotalSalespersons; Rec."Total Salespersons")
                {
                    ApplicationArea = All;
                    Caption = '👤 Salespersons';
                    DrillDownPageId = "Mini Salesperson List";
                    Style = Favorable;
                }

                field(TotalMovements; Rec."Total Movements")
                {
                    ApplicationArea = All;
                    Caption = '🔄 Stock Movements';
                    DrillDownPageId = "Mini Stock Movement List";
                    Style = Favorable;
                }
            }

            // ═══════════════════════════════
            // SECTION 3 - ALERTS
            // ═══════════════════════════════
            cuegroup(Alerts)
            {
                Caption = '⚠️ Business Alerts';

                field(LowStockItems; Rec."Low Stock Items")
                {
                    ApplicationArea = All;
                    Caption = '🔴 Low Stock Items';
                    Style = Unfavorable;
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        MiniItem: Record "Mini Item";
                    begin
                        MiniItem.SetFilter(Quantity, '..9');
                        Page.Run(Page::"Mini Item List", MiniItem);
                    end;
                }

                field(PendingOrders; Rec."Open Orders")
                {
                    ApplicationArea = All;
                    Caption = '🟡 Pending Posting';
                    DrillDownPageId = "Mini Sales Header List";
                    Style = Ambiguous;
                }
            }
        }
    }

    var
        WelcomeText: Text;
        CompanyText: Text;
        MottoText: Text;
        DateText: Text;

    trigger OnOpenPage()
    var
        SalesCue: Record "Mini Sales Cue";
        WelcomeSetup: Record "Mini Welcome Setup";
        Hour: Integer;
    begin
        // Initialize cue record
        if not SalesCue.Get() then begin
            SalesCue.Init();
            SalesCue.Insert();
        end;
        Rec := SalesCue;

        // Get greeting based on time
        Hour := Time2Hours(Time());
        if Hour < 12 then
            WelcomeText := 'Good Morning! Ready to make sales today? 🌅'
        else
            if Hour < 17 then
                WelcomeText := 'Good Afternoon! Keep pushing those sales! ☀️'
            else
                WelcomeText := 'Good Evening! Wrapping up for the day? 🌙';

        // Get company name and motto
        // Get company name and motto
        if WelcomeSetup.Get() then begin
            CompanyText := UpperCase(WelcomeSetup."Company Name");
            MottoText := WelcomeSetup."Company Motto";
        end else begin
            CompanyText := UpperCase(CompanyName());
            MottoText := 'Managing Business, Empowering Growth';
        end;

        // Format date
        DateText := Format(Today(), 0,
            '<Weekday Text>, <Day> <Month Text> <Year4>');
    end;

    local procedure Time2Hours(T: Time): Integer
    var
        TotalSeconds: Integer;
    begin
        TotalSeconds := T - 000000T;
        exit(TotalSeconds div 3600000);
    end;
}