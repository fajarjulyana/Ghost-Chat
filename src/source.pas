unit source;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TChatForm = class(TForm)
    Kirim: TButton;
    MainChat: TGroupBox;
    ChatSend: TMemo;
    ChatShow: TMemo;
    MainMenu1: TMainMenu;
    Pengeturan1: TMenuItem;
    procedure Pengaturan1Click(Sender: TObject);
    procedure KirimClick(Sender: TObject);
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


procedure TChatForm.KirimClick(Sender: TObject);
var
  I: Integer;
begin
   pengaturanFrm.tcpserver.LocalPort :=  pengaturanFrm.localportset.Text;
pengaturanFrm.tcpserver.Active := true;
   pengaturanFrm.TcpServer.RemoteHost :=  pengaturanFrm.RemoteHost.Text;
   pengaturanFrm.TcpClient.RemotePort :=  pengaturanFrm.LocalPortSet.Text;
  try
    if pengaturanFrm.TcpClient.Connect then
      for I := 0 to chatsend.Lines.Count - 1 do
      pengaturanFrm.TcpClient.Sendln(chatsend.Lines[I]);
  finally
    pengaturanFrm.TcpClient.Disconnect;
  end;
end;
procedure TChatForm.Pengaturan1Click(Sender: TObject);
begin
PengaturanFrm.show;
end;

procedure TChatForm.Pengeturan1Click(Sender: TObject);
begin
pengaturanFrm.Show;
end;

end.
