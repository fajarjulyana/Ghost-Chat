program ghostchat;

uses
  Forms,
  source in 'src\source.pas' {ChatForm},
  setting in 'src\setting.pas' {PengaturanFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ghost Chat';
  Application.CreateForm(TChatForm, ChatForm);
  Application.CreateForm(TPengaturanFrm, PengaturanFrm);
  Application.Run;
end.
