unit source;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TChatForm = class(TForm)
    Kirim: TButton;
    MainChat: TGroupBox;
    BoxChat: TEdit;
    ListChat: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChatForm: TChatForm;

implementation

{$R *.dfm}

end.
