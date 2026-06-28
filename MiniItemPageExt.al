pageextension 50102 "Mini Item List Ext" extends "Mini Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(ShowMessage)
            {
                ApplicationArea = All;
                Caption = 'Say Hello';

                trigger OnAction()
                begin
                    Message('Welcome to Mini Items! 👋');
                end;
            }
        }
    }
}