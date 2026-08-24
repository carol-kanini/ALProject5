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

                field(GreetingTile; WelcomeText)
                {
                    ApplicationArea = All;
                    Caption = '👋 Greeting';
                    Editable = false;
                    Style = Ambiguous;
                }

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
                        TempMiniItem: Record "Mini Item" temporary;
                    begin
                        if MiniItem.FindSet() then
                            repeat
                                if MiniItem.Quantity <= MiniItem."Reorder Point" then begin
                                    TempMiniItem := MiniItem;
                                    TempMiniItem.Insert();
                                  end;
                            until MiniItem.Next() = 0;

                        Page.Run(Page::"Mini Item List", TempMiniItem);
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
        User: Record User;
        Hour: Integer;
        UserDisplayName: Text;
    begin
        // Initialize cue record
        if not SalesCue.Get() then begin
            SalesCue.Init();
            SalesCue.Insert();
        end;
        Rec := SalesCue;

        // Recalculate Low Stock Items (no longer a FlowField)
        Rec.UpdateLowStockCount();

        // Get the current user's display name
        if User.Get(UserSecurityId()) then begin
            if User."Full Name" <> '' then
                UserDisplayName := User."Full Name"
            else
                UserDisplayName := User."User Name";
        end else
            UserDisplayName := UserId();

        // Get greeting based on time
        Hour := Time2Hours(Time());
        if Hour < 12 then
            WelcomeText := StrSubstNo('Good Morning, %1! Ready to make sales today? 🌅', UserDisplayName)
        else
            if Hour < 17 then
                WelcomeText := StrSubstNo('Good Afternoon, %1! Keep pushing those sales! ☀️', UserDisplayName)
            else
                WelcomeText := StrSubstNo('Good Evening, %1! Wrapping up for the day? 🌙', UserDisplayName);

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