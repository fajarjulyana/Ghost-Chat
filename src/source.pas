unit source;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TChatForm = class(TForm)
    Kirim: TButton;
    MainChat: TGroupBox;
    ChatShow: TMemo;
    ChatSend: TMemo;
    MainMenu1: TMainMenu;
    Pengeturan1: TMenuItem;
    procedure Pengeturan1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChatForm: TChatForm;

implementation

uses setting;

{$R *.dfm}

procedure TChatForm.Pengeturan1Click(Sender: TObject);
begin
PengaturanFrm.show;
end;

end.
