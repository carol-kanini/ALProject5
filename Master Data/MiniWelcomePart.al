page 50121 "Mini Welcome Part"
{
    PageType = CardPart;
    ApplicationArea = All;
    Caption = 'Welcome';

	layout
	{
area(Content)
{
	group(Welcome)
{
    Caption = '🌿 Savanna Business Solutions ERP';

    field(WelcomeMessage; WelcomeMessage)
    {
        ApplicationArea = All;
        Caption = 'Message';
        Editable = false;
    }

    field(Motto; Motto)
    {
        ApplicationArea = All;
        Caption = 'Company Motto';
        Editable = false;
    }
	trigger OnOpenPage()
begin
    WelcomeMessage := 'Welcome to Savanna Business Solutions ERP!';
    Motto := 'Managing Business, Empowering Growth';
end;
}

	}
}
	}