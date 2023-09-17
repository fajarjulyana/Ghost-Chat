program ghostchat;

uses
  Forms,
  source in 'src\source.pas' {ChatForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ghost Chat';
  Application.CreateForm(TChatForm, ChatForm);
  Application.Run;
end.
