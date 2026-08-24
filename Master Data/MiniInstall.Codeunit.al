codeunit 50110 "Mini Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        MiniNoSeriesMgt.EnsureCustomerNoSeriesExists();
    end;

    var
        MiniNoSeriesMgt: Codeunit "Mini No Series Mgt";
}

codeunit 50111 "Mini Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        MiniNoSeriesMgt.EnsureCustomerNoSeriesExists();
    end;

    var
        MiniNoSeriesMgt: Codeunit "Mini No Series Mgt";
}

codeunit 50112 "Mini No Series Mgt"
{
    procedure EnsureCustomerNoSeriesExists()
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        if NoSeries.Get('MINICUST') then
            exit; // Already exists, skip

        NoSeries.Init();
        NoSeries.Code := 'MINICUST';
        NoSeries.Description := 'Mini Customer Numbers';
        NoSeries."Manual Nos." := false;
        NoSeries.Insert(true);

        NoSeriesLine.Init();
        NoSeriesLine."Series Code" := NoSeries.Code;
        NoSeriesLine."Line No." := 10000;
        NoSeriesLine."Starting No." := 'C00001';
        NoSeriesLine."Increment-by No." := 1;
        NoSeriesLine.Insert(true);
    end;
}