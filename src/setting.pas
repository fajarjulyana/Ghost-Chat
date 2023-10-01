unit setting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Sockets;

type
  TPengaturanFrm = class(TForm)
    HostPort: TEdit;
    LocalPortSet: TEdit;
    GroupBox1: TGroupBox;
    PortHost: TLabel;
    PortClient: TLabel;
    Setting: TBitBtn;
    TcpServer: TTcpServer;
    TcpClient: TTcpClient;
    RemoteHostLAbel: TLabel;
    RemoteHost: TEdit;
    procedure SettingClick(Sender: TObject);
    procedure TcpServerAccept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
// you must create your own thread to synch
  // writing to a gui component
  TClientDataThread = class(TThread)
  private
  public
    ListBuffer :TStringList;
    TargetList :TStrings;
    procedure synchAddDataToControl;
    constructor Create(CreateSuspended: Boolean);
    procedure Execute; override;
    procedure Terminate;
  end;

var
  PengaturanFrm: TPengaturanFrm;
  //DataThread: TClientDataThread;
implementation

uses source;

{$R *.dfm}
//------------- TClientDataThread impl -----------------------------------------
constructor TClientDataThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := true;
  ListBuffer := TStringList.Create;
end;

procedure TClientDataThread.Terminate;
begin
  ListBuffer.Free;
  inherited;
end;

procedure TClientDataThread.Execute;
begin
  Synchronize(synchAddDataToControl);
end;

procedure TClientDataThread.synchAddDataToControl;
begin
 TargetList.AddStrings(ListBuffer);
end;

procedure TPengaturanFrm.SettingClick(Sender: TObject);
begin
tcpserver.LocalPort :=  localportset.Text;
tcpserver.Active := true;
end;

procedure TPengaturanFrm.TcpServerAccept(Sender: TObject;
  ClientSocket: TCustomIpClient);
   var
   s: string;
  DataThread: TClientDataThread;
  begin
  // create thread
  DataThread:= TClientDataThread.Create(true);
  // set the TagetList to the gui list that you
  // with to synch with.
  DataThread.TargetList := ChatForm.ChatShow.lines;

  // Load the Threads ListBuffer
  DataThread.ListBuffer.Add('*** Koneksi Diterima ***');
  DataThread.ListBuffer.Add('Remote Host: ' + ClientSocket.LookupHostName(ClientSocket.RemoteHost) +
   ' (' + ClientSocket.RemoteHost + ')');
  DataThread.ListBuffer.Add('===== Awal Pesan =====');
  s := ClientSocket.Receiveln;
  while s <> '' do
  begin
    DataThread.ListBuffer.Add(s);
    s := ClientSocket.Receiveln;
  end;
  DataThread.ListBuffer.Add('===== Akhir Pesan =====');

  // Call Resume which will execute and synch the
  // ListBuffer with the TargetList
  DataThread.Resume;

end;

procedure TPengaturanFrm.FormActivate(Sender: TObject);
begin
pengaturanFrm.TcpServer.LocalPort := PengaturanFrm.LocalPortSet.Text;
pengaturanFrm.TcpServer.Active := True;
end;

end.
