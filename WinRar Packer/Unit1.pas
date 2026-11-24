unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, WinApi.ShellAPI, System.IniFiles,
  Vcl.StdCtrls, Vcl.FileCtrl, System.StrUtils, System.IOUtils, System.Types,
  Vcl.Menus, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Clear1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    ListBox1: TListBox;
    GroupBox4: TGroupBox;
    Button8: TButton;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Button1: TButton;
    Button6: TButton;
    Button7: TButton;
    Properties1: TMenuItem;
    SaveDialog1: TSaveDialog;
    CheckBox8: TCheckBox;
    Image1: TImage;
    Folder1: TMenuItem;
    N1: TMenuItem;
    Pack1: TMenuItem;
    Unpack1: TMenuItem;
    N2: TMenuItem;
    Panel3: TMenuItem;
    N3: TMenuItem;
    Selectall1: TMenuItem;
    N4: TMenuItem;
    Remove1: TMenuItem;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    CheckBox9: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    GroupBox3: TGroupBox;
    ComboBox3: TComboBox;
    Label10: TLabel;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    GroupBox7: TGroupBox;
    ComboBox4: TComboBox;
    Label13: TLabel;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    GroupBox8: TGroupBox;
    Memo1: TMemo;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    ComboBox5: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    ProgressBar1: TProgressBar;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox8: TComboBox;
    OpenDialog2: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Properties1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Folder1Click(Sender: TObject);
    procedure Pack1Click(Sender: TObject);
    procedure Unpack1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label6Click(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label7Click(Sender: TObject);
    procedure Label11MouseLeave(Sender: TObject);
    procedure Label11MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label11Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    flbHorzScrollWidth: Integer;  // ListBox horizontal scroller variable
    //procedure FolderContent(const FolderPath: string);

    procedure WMDROPFILES(var Msg: TMessage);
    procedure LBWindowProc(var Message: TMessage);
    procedure AddFile(sFileName: string);
  public
    { Public declarations }
    procedure WriteOptions; // options
    procedure ReadOptions;
  end;

var
  Form1: TForm1;
  app, path : string;  // compressors & folder files
  TIF : TIniFile;
  sum : integer;       // variable for counting the selected files
  OldLBWindowProc: TWndMethod;

implementation

{$R *.dfm}
// get application MainPath
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var
  OPT :string;
begin
   OPT := 'Options';

   // Create the 'optins' folder if it does not exist.
   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
    WriteInteger(OPT,'Output',ComboBox5.ItemIndex);
    WriteInteger(OPT,'Overwrite',ComboBox6.ItemIndex);
    WriteBool(OPT,'DeleteArchiveAttribute',CheckBox1.Checked);
    WriteBool(OPT,'IgnoreFileAttributes',CheckBox2.Checked);
    WriteBool(OPT,'SynchronizeArchiveContent',CheckBox3.Checked);
    WriteBool(OPT,'AllowPotentiallyIncompatibleNames',CheckBox4.Checked);
    WriteBool(OPT,'StoreNTFSDataStreams',CheckBox5.Checked);
    WriteBool(OPT,'SetTheCompressedNTFSAttribute',CheckBox19.Checked);
    WriteBool(OPT,'DisableNameBasedSorting',CheckBox7.Checked);
    WriteBool(OPT,'DoNotAddEmptyDirectories',CheckBox10.Checked);
    WriteBool(OPT,'UpdateExistingFiles',CheckBox11.Checked);
    WriteBool(OPT,'UpdateFiles',CheckBox24.Checked);
    WriteBool(OPT,'KeepDamagedUnpackedFiles',CheckBox14.Checked);
    WriteBool(OPT,'AutomaticallyRenameFiles',CheckBox15.Checked);
    WriteBool(OPT,'OpenFilesLockedByOtherApplications',CheckBox17.Checked);
    WriteBool(OPT,'SaveFileOwnerAndGroup',CheckBox6.Checked);
    WriteBool(OPT,'DeleteFilesAfterArchiving',CheckBox16.Checked);
    WriteBool(OPT,'MoveFilesToTheRecycleBin',CheckBox18.Checked);
    WriteBool(OPT,'SecurelyDeleteFilesAfterArchiving',CheckBox20.Checked);
    WriteBool(OPT,'StoreHardLinksAsLinks',CheckBox22.Checked);
    WriteBool(OPT,'RecursivelySearchSubdirectories',CheckBox23.Checked);
    WriteBool(OPT,'DisableAllNotifications',CheckBox13.Checked);
    WriteBool(OPT,'AnswerAllQuestionsWithYes',CheckBox25.Checked);
    WriteBool(OPT,'SetFileTimestampToArchiveTimestamp',CheckBox26.Checked);
    WriteBool(OPT,'TestFilesForErrorsAfterArchiving',CheckBox27.Checked);
    WriteBool(OPT,'ActivatePassword',CheckBox9.Checked);
    WriteInteger(OPT,'PasswordMode',ComboBox7.ItemIndex);
    WriteString(OPT,'Password',Edit1.Text);
    WriteInteger(OPT,'Priority',ComboBox2.ItemIndex);
    WriteInteger(OPT,'Case',ComboBox1.ItemIndex);
    WriteInteger(OPT,'Hash',ComboBox3.ItemIndex);
    WriteInteger(OPT,'Compression',ComboBox4.ItemIndex);
    WriteBool(OPT,'Comments',CheckBox21.Checked);
    WriteInteger(OPT,'Unicode',ComboBox8.ItemIndex);
    Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var
  OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
    TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
    with TIF do
    begin
      Combobox5.ItemIndex:=ReadInteger(OPT,'Output',ComboBox5.ItemIndex);
      Combobox6.ItemIndex:=ReadInteger(OPT,'Overwrite',ComboBox6.ItemIndex);
      CheckBox1.Checked:=ReadBool(OPT,'DeleteArchiveAttribute',CheckBox1.Checked);
      CheckBox2.Checked:=ReadBool(OPT,'IgnoreFileAttributes',CheckBox2.Checked);
      CheckBox3.Checked:=ReadBool(OPT,'SynchronizeArchiveContent',CheckBox3.Checked);
      CheckBox4.Checked:=ReadBool(OPT,'AllowPotentiallyIncompatibleNames',CheckBox4.Checked);
      CheckBox5.Checked:=ReadBool(OPT,'StoreNTFSDataStreams',CheckBox5.Checked);
      CheckBox19.Checked:=ReadBool(OPT,'SetTheCompressedNTFSAttribute',CheckBox19.Checked);
      CheckBox7.Checked:=ReadBool(OPT,'DisableNameBasedSorting',CheckBox7.Checked);
      CheckBox10.Checked:=ReadBool(OPT,'DoNotAddEmptyDirectories',CheckBox10.Checked);
      CheckBox11.Checked:=ReadBool(OPT,'UpdateExistingFiles',CheckBox11.Checked);
      CheckBox24.Checked:=ReadBool(OPT,'UpdateFiles',CheckBox24.Checked);
      CheckBox14.Checked:=ReadBool(OPT,'KeepDamagedUnpackedFiles',CheckBox14.Checked);
      CheckBox15.Checked:=ReadBool(OPT,'AutomaticallyRenameFiles',CheckBox15.Checked);
      CheckBox17.Checked:=ReadBool(OPT,'OpenFilesLockedByOtherApplications',CheckBox17.Checked);
      CheckBox6.Checked:=ReadBool(OPT,'SaveFileOwnerAndGroup',CheckBox6.Checked);
      CheckBox16.Checked:=ReadBool(OPT,'DeleteFilesAfterArchiving',CheckBox16.Checked);
      CheckBox18.Checked:=ReadBool(OPT,'MoveFilesToTheRecycleBin',CheckBox18.Checked);
      CheckBox20.Checked:=ReadBool(OPT,'SecurelyDeleteFilesAfterArchiving',CheckBox20.Checked);
      CheckBox22.Checked:=ReadBool(OPT,'StoreHardLinksAsLinks',CheckBox22.Checked);
      CheckBox23.Checked:=ReadBool(OPT,'RecursivelySearchSubdirectories',CheckBox23.Checked);
      CheckBox13.Checked:=ReadBool(OPT,'DisableAllNotifications',CheckBox13.Checked);
      CheckBox25.Checked:=ReadBool(OPT,'AnswerAllQuestionsWithYes',CheckBox25.Checked);
      CheckBox26.Checked:=ReadBool(OPT,'SetFileTimestampToArchiveTimestamp',CheckBox26.Checked);
      CheckBox27.Checked:=ReadBool(OPT,'TestFilesForErrorsAfterArchiving',CheckBox27.Checked);
      CheckBox9.Checked:=ReadBool(OPT,'ActivatePassword',CheckBox9.Checked);
      Combobox7.ItemIndex:=ReadInteger(OPT,'PasswordMode',ComboBox7.ItemIndex);
      Edit1.Text:=ReadString(OPT,'Password',Edit1.Text);
      Combobox2.ItemIndex:=ReadInteger(OPT,'Priority',ComboBox2.ItemIndex);
      Combobox1.ItemIndex:=ReadInteger(OPT,'Case',ComboBox1.ItemIndex);
      Combobox3.ItemIndex:=ReadInteger(OPT,'Hash',ComboBox3.ItemIndex);
      Combobox4.ItemIndex:=ReadInteger(OPT,'Compression',ComboBox4.ItemIndex);
      CheckBox21.Checked:=ReadBool(OPT,'Comments',CheckBox21.Checked);
      Combobox8.ItemIndex:=ReadInteger(OPT,'Unicode',ComboBox8.ItemIndex);
      Free;
    end;
  end;
end;

procedure FastSelectAll(AListBox: TListBox);
begin
  if not AListBox.MultiSelect then
    Exit;
  AListBox.Items.BeginUpdate;
  try
    // WParam: 1 = True (select), 0 = False (deselect)
    // LParam: -1 = All Elements
    SendMessage(AListBox.Handle, LB_SETSEL, 1, -1);
  finally
    AListBox.Items.EndUpdate;
  end;
end;

// adding files via drag-and-drop
procedure TForm1.AddFile(sFileName: string);
begin
  ListBox1.Items.Add(sFilename);

  // enable PopUpMenu functions
  Button6.Enabled := true;
  Button7.Enabled := true;
  Pack1.Enabled := true;
  Unpack1.Enabled := true;
  Properties1.Enabled := true;
  Remove1.Enabled := true;
  Selectall1.Enabled := true;
  Clear1.Enabled := true;

  // Pass the folder path with a slash at the end.
  path := ExtractFileDir(sFilename) + '\';

  // calculate the sum of the entries..
  sum := ListBox1.Items.Count;
  // ..set it to zero and pass them to the ProgressBar.Max
  ProgressBar1.Position := 0;
  ProgressBar1.Max :=  sum;

  // count loaded files
  GroupBox6.Caption := ' Multiple Files : ' + IntToStr(ListBox1.Items.Count) + ' ';

  // update ListBox
  ListBox1.Repaint;
  ListBox1.SetFocus;
  // update form
  Application.ProcessMessages;
end;

{ temporarily replaces the WindowProc of a ListBox in order to personally
  handle certain messages (e.g., WM_DROPFILES during drag-and-drop
  operations from Explorer). }
procedure TForm1.LBWindowProc(var Message: TMessage);
begin
  if Message.Msg = WM_DROPFILES then
    // handle WM_DROPFILES message
    WMDROPFILES(Message);

  // call default ListBox1 WindowProc method to handle all other messages
  OldLBWindowProc(Message);
end;

{ receiving files via drag-and-drop from Windows Explorer onto a form or
  a specific control. }
procedure TForm1.WMDROPFILES(var Msg: TMessage);
var
  pcFileName: PChar;
  i, iSize, iFileCount: integer;
begin
  // to avoid compiler warning message
  pcFileName := '';
  iFileCount := DragQueryFile(Msg.wParam, $FFFFFFFF, pcFileName, 255);
  for i := 0 to iFileCount - 1 do
  begin
    iSize := DragQueryFile(Msg.wParam, i, nil, 0) + 1;
    pcFileName := StrAlloc(iSize);
    DragQueryFile(Msg.wParam, i, pcFileName, iSize);
    if FileExists(pcFileName) then
      // method to add each file
      AddFile(pcFileName);

    { frees the memory of a null-terminated string (PChar, PAnsiChar, or PWideChar)
      that was previously dynamically allocated. }
    StrDispose(pcFileName);
  end;
  // finish the drag&drop function
  DragFinish(Msg.wParam);
end;

// removes selected files
procedure TForm1.Remove1Click(Sender: TObject);
var
  i: integer;
begin
  for i := ListBox1.Items.Count - 1 downto 0 do
    if ListBox1.Selected[i] then
      ListBox1.Items.Delete(i);

  // count loaded files
  GroupBox6.Caption := ' Multiple Files : ' + IntToStr(ListBox1.Items.Count) + ' ';

  // calculate the sum of the entries..
  sum := ListBox1.Items.Count;
  // ..set it to zero and pass them to the ProgressBar.Max
  ProgressBar1.Position := 0;
  ProgressBar1.Max :=  sum;
end;

// display windows file properties dialog
procedure PropertiesDialog(const aFilename: string);
var
  sei: ShellExecuteInfo;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.lpFile := PChar(aFilename);
  sei.lpVerb := 'properties';
  sei.fMask  := SEE_MASK_INVOKEIDLIST;
  ShellExecuteEx(@sei);
end;

// Determining the size of the entire folder.
function GetDirectorySize(const Path: string): Int64;
var
  SearchRec: TSearchRec;
  FindResult: Integer;
  SearchPath: string;
begin
  Result := 0;
  { ensures that a path string ends with the platform-dependent path
    separator (PathDelim; "\" on Windows, "/" otherwise). }
  SearchPath := IncludeTrailingPathDelimiter(Path);

  // Search for all files and folders
  FindResult := FindFirst(SearchPath + '*.*', faAnyFile, SearchRec);
  try
    while FindResult = 0 do
    begin
      // Ignore specific directories
      if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
      begin
        if (SearchRec.Attr and faDirectory) <> 0 then
        begin
          // If it is a subfolder, call the function recursively.
          Inc(Result, GetDirectorySize(SearchPath + SearchRec.Name));
        end
        else
        begin
          // Add file size to the total sum
          Inc(Result, SearchRec.Size);
        end;
      end;
      FindResult := FindNext(SearchRec);
    end;
  finally
    System.SysUtils.FindClose(SearchRec);
  end;
end;

// Directly loading all selected files into the listbox
procedure TForm1.Folder1Click(Sender: TObject);
begin
  Button1.Click;
end;

{ // This function loads all files in a folder when needed.
procedure TForm1.FolderContent(const FolderPath: string);
var
  FileName: string;
begin
  ListBox1.Items.Clear;
  for FileName in TDirectory.GetFiles(FolderPath) do
  begin
    ListBox1.Items.Add(FileName); // Adds the full path

    // Or just the filename:
    // ListBox1.Items.Add(ExtractFileName(FileName));
  end;
end;
}

// Determining whether or not the folder name contains spaces.
function HasSpaceInFolder(const Path: string): Boolean;
var
  FolderName: string;
begin
  // removes the last slash or backslash from a folder path string if it is there
  FolderName := ExtractFileName(ExcludeTrailingPathDelimiter(Path));
  // Here, the specified string is checked—in this case, a space.
  Result := Pos(' ', FolderName) > 0;
end;

// Determine the list of files to be displayed as icons in the list box.
procedure GetAllFilesExtra(List: TStrings);
var
  Search: TSearchRec;
begin
  //Path := ExtractFilePath(ParamStr(0)); // exe main path

  // find all files in folder
  if FindFirst(Path + '*.*', faAnyFile, Search) = 0 then
  try
    repeat
      if (Search.Attr <> faDirectory) and (Search.Name[1] <> '.') then
        // add the files in the listbox
        List.Add(Path + Search.Name);
    until FindNext(Search) <> 0;
  finally
    FindClose(Search);
  end;
end;

// Convert the icon to a bitmap.
procedure IcoToBmpA(Ico: TIcon; Bmp: TBitmap; SmallIcon: Boolean);
var
  WH: Byte; // Width and Height
begin
  with Bmp do
  begin
    // Here, any color can be specified as transparent.
    //Canvas.Brush.Color := clFuchsia;  // Determine the background; the default is white.
    TransparentColor := clFuchsia;

    // Determine the width and height and draw as a bitmap.
    Width := 16;
    Height := 16;
    Canvas.Draw(0, 0, Ico);

    if SmallIcon then
      WH := 16
    else
      WH := 32;

    // reduce or enlarge to a specific size
    Canvas.StretchDraw(Rect(0, 0, WH, WH), Bmp);
    Width := WH; Height := WH;
    Transparent :=  True;
  end;
end;

// Here, the file's icon is retrieved from shell32.dll.
procedure GetIconFromFileB(const FileName: String; Icon: TIcon;
  SmallIcon: Boolean);
var
  sfi: TSHFILEINFO;
const
  uFlags : array[Boolean] of DWord = (SHGFI_LARGEICON, SHGFI_SMALLICON);
begin
  if SHGetFileInfo(PChar(FileName), 0, sfi, SizeOf(sfi), SHGFI_ICON or
     uFlags[SmallIcon]) <> 0 then
    Icon.Handle := sfi.hIcon;
end;

{ Draw the icons from "shell32.dll" into the list box next to the
  corresponding files. }
procedure DrawListBoxExtra(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
const
  { These constants declare a constant or typed array that uses the Boolean
    data type as the index (key) and returns color values of type TColor. }
  Col1: array [Boolean] of TColor = ($00F8F8F8, clWindow);
  Col2: array [Boolean] of TColor = (clInactiveCaptionText, clWindowText);
var
  Icon: TIcon;
  Bmp: TBitmap;
begin
  with (Control as TListbox) do
  begin
    // Create memory access for the icon and bitmap.
    Icon := TIcon.Create;
    Bmp := TBitmap.Create;
    try
      if odSelected in State then
        Canvas.Font.Color := clCaptionText
      else
      begin
        // determine properties
        Bmp.Canvas.Brush.Color := Canvas.Brush.Color;
        Canvas.Brush.Color := Col1[Odd(Index)];
        Canvas.Font.Color := Col2[(Control as TListBox).Enabled];
      end;
      GetIconFromFileB(Items[Index], Icon, True);
      IcoToBmpA(Icon, Bmp, True);
      // Vertical and horizontal spacing between the item strings and the bitmaps
      Canvas.TextRect(Rect, Rect.Left + Bmp.Width + 4, Rect.Top + 2, Items[Index]);
      // Draw the graphics into the list box.
      Canvas.Draw(Rect.Left, Rect.Top, Bmp);
    finally
      Bmp.Free;
      Icon.Free;
    end;
  end;
end;

// select all items in ListBox
procedure TForm1.Selectall1Click(Sender: TObject);
var
  i : integer;
begin
  //for i := 0 to Listbox1.Items.Count -1 do
    //Listbox1.Selected[i] := true;

  FastSelectAll(ListBox1);
end;

procedure TForm1.Unpack1Click(Sender: TObject);
begin
  Button7.Click;
end;

// Start the help message process and wait until it is finished.
// get all parameter switches for winrar compressor
procedure ExecuteHelpmessageAndWait(const FileName, Parameters: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  CmdLine: string;          // command line
  ExitCode: Cardinal;       // Safely closing the console
  SelectedPriority: DWORD;  // priority class
  ProgramPath: string;
begin
  // Read the selected process flag from the ComboBox objects.
  SelectedPriority := DWORD(Form1.ComboBox2.Items.Objects[Form1.ComboBox2.ItemIndex]);

  // Assemble help message command line (/k) for wait console
  CmdLine := Format('cmd.exe /k "%s" %s', [FileName, Parameters]);

  // Initialize structures
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;

  // show or hide console
  StartupInfo.wShowWindow := SW_NORMAL;

  // Create process
  if CreateProcess(
    nil,                       // Module name (use 'nil' and command in CmdLine)
    PChar(CmdLine),            // Command line
    nil,                       // Process safety attributes
    nil,                       // Thread safety attributes
    False,                     // Handle inheritance
    SelectedPriority,          // Creation flags (starts in a new console window)
    nil,                       // New environment specification block
    nil,                       // Current Directory
    StartupInfo,               // STARTUP INFO
    ProcessInfo) then          // PROCESS INFORMATION
  begin
    // Wait until the called program has finished
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);

    // Optional: Retrieve and display the process exit code.
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);

    // Close handles to avoid memory leaks.
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end
  else
    // Throws an error if the process could not be started.
    RaiseLastOSError;
end;

// Start the main compression process and wait until it is finished.
procedure ExecuteAndWait(const FileName, Parameters: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  CmdLine: string;          // command line
  ExitCode: Cardinal;       // Safely closing the console
  SelectedPriority: DWORD;  // priority class
  ProgramPath: string;
begin
  // Read the selected flag from the ComboBox objects.
  SelectedPriority := DWORD(Form1.ComboBox2.Items.Objects[Form1.ComboBox2.ItemIndex]);

  // Assemble command line
  CmdLine := Format('"%s" %s', [FileName, Parameters]);

  // Initialize structures
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;

  // show or hide console
  if Form1.CheckBox12.Checked = true then
  begin
    StartupInfo.wShowWindow := SW_NORMAL;
  end else begin
    StartupInfo.wShowWindow := SW_HIDE;
  end;

  // Create process
  if CreateProcess(
    nil,                       // Module name (use 'nil' and command in CmdLine)
    PChar(CmdLine),            // Command line
    nil,                       // Process safety attributes
    nil,                       // Thread safety attributes
    False,                     // Handle inheritance
    SelectedPriority,          // Creation flags (starts in a new console window)
    nil,                       // New environment specification block
    nil,                       // Current Directory
    StartupInfo,               // STARTUP INFO
    ProcessInfo) then          // PROCESS INFORMATION
  begin
    // Wait until the called program has finished
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);

    // Optional: Retrieve and display the process exit code.
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);

    // Close handles to avoid memory leaks.
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end
  else
    // Throws an error if the process could not be started.
    RaiseLastOSError;
end;

// precise determination of the file size
function Get_File_Size(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  // check if file exists
  FH := FindFirstFile(PChar(S), FD);
  // check file handle ist value
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);
    end;
end;

// Load comment text in full unicode support
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog2.Execute then
  begin
    // load comment text unicode compatible
    case ComboBox8.ItemIndex of
    0 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.Default);
    1 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.UTF7);
    2 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.UTF8);
    3 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.Unicode);
    4 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.BigEndianUnicode);
    5 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.ASCII);
    6 : Memo1.Lines.LoadFromFile(OpenDialog2.FileName, TEncoding.ANSI);
    end;
  end;
end;

// clear comment memo box
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

// load file(s) or archives for compress/decompress processes
procedure TForm1.Button1Click(Sender: TObject);
var
  i, size : integer;
begin
  if OpenDialog1.Execute then
  begin
    ListBox1.Clear;
    // set filesize to (zero = kb)
    size := 0;

    // load all files selected in the windows open dialog
    for i := 0 to OpenDialog1.Files.Count - 1 do
    begin
      ListBox1.Items.Add(OpenDialog1.Files[i]);
      size := Get_File_Size(OpenDialog1.Files[i]) + size;
      StatusBar1.Panels[1].Text := IntToStr(size div 1000) + ' kb';
    end;

    // enable PopUpMenu functions
    Button6.Enabled := true;
    Button7.Enabled := true;
    Pack1.Enabled := true;
    Unpack1.Enabled := true;
    Properties1.Enabled := true;
    Remove1.Enabled := true;
    Selectall1.Enabled := true;
    Clear1.Enabled := true;

    // Pass the folder path with a slash at the end.
    path := ExtractFileDir(OpenDialog1.FileName) + '\';

    // calculate the sum of the entries..
    sum := ListBox1.Items.Count;
    // ..set it to zero and pass them to the ProgressBar.Max
    ProgressBar1.Position := 0;
    ProgressBar1.Max := sum;

    // count loaded files
    GroupBox6.Caption := ' Multiple Files : ' + IntToStr(ListBox1.Items.Count) + ' ';

    // update ListBox
    ListBox1.Repaint;
    ListBox1.SetFocus;
    // update form
    Application.ProcessMessages;
  end;

  { // This part allows you to select an entire folder rather than individual
    // files; all files within that folder will then be loaded.
  if SelectDirectory('Select directory', '', path) then
  begin
    if ListBox1.Items.Count > -1 then Properties1.Enabled := true;
    ListBox1.Clear;
    Button6.Enabled := true;
    Button7.Enabled := true;
    Pack1.Enabled := true;
    Unpack1.Enabled := true;
    // Add a backslash to the path.
    path := path + '\';
    GetAllFilesExtra(ListBox1.Items);
    // Determine the size of the entire folder content.
    StatusBar1.Panels[1].Text := IntToStr( GetDirectorySize(path) div 1000) + ' kb';
    // count loaded files
    GroupBox6.Caption := ' Multiple Files : ' + IntToStr(ListBox1.Items.Count) + ' ';

    // update shell icons
    ListBox1.Repaint;
    ListBox1.SetFocus;

    Label20.Caption := path;
  end;
  }

end;

// begin the compression process
procedure TForm1.Button6Click(Sender: TObject);
var
  filename : string;
  i : integer;
  HasSelection: Boolean;
begin
  HasSelection := False;

  for i := 0 to ListBox1.Items.Count - 1 do
  begin
    if ListBox1.Selected[i] then
    begin
      HasSelection := True;
      Break; // Abort the loop as soon as at least one has been found
    end;
  end;

  if HasSelection then
  begin
    //ShowMessage('At least one entry is selected.');
  end else begin
    Beep;
    ShowMessage('No entry selected.');
    Exit;
  end;

  // deactivate components during the process
  Screen.Cursor := crHourGlass;
  Button1.Enabled := false;
  Button7.Enabled := false;
  Pack1.Enabled := false;
  Unpack1.Enabled := false;
  Remove1.Enabled := false;
  Selectall1.Enabled := false;
  Clear1.Enabled := false;
  Properties1.Enabled := false;

  { clear parameter string
    This can also be used as a string variable; the label is merely an
    example of the parameters (switches). }
  Label3.Caption := '';

  { ---------------------------------------------------------- }
  { ----- define the parameter flags for the compressor ------ }
  { ---------------------------------------------------------- }

  // Add archive comment
  if CheckBox21.Checked = true then
  begin
    // text must be save
    Memo1.Lines.SaveToFile(MainDir + 'Data\Comment\comment.txt');
    Label3.Caption := Label3.Caption + ' -z"' + MainDir + 'Data\Comment\comment.txt" ';
  end;

  // Delete archive attribute
  if CheckBox1.Checked = true then
    Label3.Caption := Label3.Caption + ' -ac ';

  // Ignore file attributes
  if CheckBox2.Checked = true then
    Label3.Caption := Label3.Caption + ' -ai ';

  // Synchronize archive content
  if CheckBox3.Checked = true then
    Label3.Caption := Label3.Caption + ' -as ';

  // Allow potentially incompatible names
  if CheckBox4.Checked = true then
    Label3.Caption := Label3.Caption + ' -oni ';

  // Store NTFS data streams
  if CheckBox5.Checked = true then
    Label3.Caption := Label3.Caption + ' -os ';

  // Save file owner and group
  if CheckBox6.Checked = true then
    Label3.Caption := Label3.Caption + ' -ow ';

  // Disable name-based sorting for robust archives
  if CheckBox7.Checked = true then
    Label3.Caption := Label3.Caption + ' -ds ';

  // Do not add empty directories
  if CheckBox10.Checked = true then
    Label3.Caption := Label3.Caption + ' -ed ';

  // Update existing files
  if CheckBox11.Checked = true then
    Label3.Caption := Label3.Caption + ' -f ';

  // Disable all notifications
  if CheckBox13.Checked = true then
    Label3.Caption := Label3.Caption + ' -inul ';

  // Keep damaged unpacked files
  if CheckBox14.Checked = true then
    Label3.Caption := Label3.Caption + ' -kb ';

  // Automatically rename files
  if CheckBox15.Checked = true then
    Label3.Caption := Label3.Caption + ' -or ';

  // Delete files after archiving
  if CheckBox16.Checked = true then
    Label3.Caption := Label3.Caption + ' -df ';

  // Open files that are locked by other applications
  if CheckBox17.Checked = true then
    Label3.Caption := Label3.Caption + ' -dh ';

  // Move files to the Recycle Bin when deleting them
  if CheckBox18.Checked = true then
    Label3.Caption := Label3.Caption + ' -dr ';

  // Set the "Compressed" NTFS attribute
  if CheckBox19.Checked = true then
    Label3.Caption := Label3.Caption + ' -oc ';

  // Securely delete files after archiving
  if CheckBox20.Checked = true then
    Label3.Caption := Label3.Caption + ' -dw ';

  // Store hard links as links rather than as files
  if CheckBox22.Checked = true then
    Label3.Caption := Label3.Caption + ' -oh ';

  // Recursively search subdirectories
  if CheckBox23.Checked = true then
    Label3.Caption := Label3.Caption + ' -r ';

  // Update and add files in the archive
  if CheckBox24.Checked = true then
    Label3.Caption := Label3.Caption + ' -u ';

  // Answer all questions with 'Yes'
  if CheckBox25.Checked = true then
    Label3.Caption := Label3.Caption + ' -y ';

  // Set the archive timestamp to the timestamp of the most recent file
  if CheckBox26.Checked = true then
    Label3.Caption := Label3.Caption + ' -tl ';

  // Test files for errors after archiving
  if CheckBox27.Checked = true then
    Label3.Caption := Label3.Caption + ' -t ';

  // Save archive Encrypt file data and file headers
  if CheckBox9.Checked = true then
  begin
    case ComboBox7.ItemIndex of
    0 : Label3.Caption := Label3.Caption + ' -p' + Edit1.Text + ' ';
    1 : Label3.Caption := Label3.Caption + ' -hp' + Edit1.Text + ' ';
    end;
  end;

  // Specify compression method (0–none...3–standard...5–maximum)
  case ComboBox4.ItemIndex of
    0 : Label3.Caption := Label3.Caption + ' -m0 ';
    1 : Label3.Caption := Label3.Caption + ' -m3 ';
    2 : Label3.Caption := Label3.Caption + ' -m5 ';
  end;

  // Select hash algorithm [BLAKE2, CRC32] for file checksum
  case ComboBox3.ItemIndex of
    0 : Label3.Caption := Label3.Caption + ' -htc ';
    1 : Label3.Caption := Label3.Caption + ' -htb ';
  end;

  // upper/lower archive filenames
  case ComboBox1.ItemIndex of
    1 : Label3.Caption := Label3.Caption + ' -cl ';
    2 : Label3.Caption := Label3.Caption + ' -cu ';
  end;

  // Set overwrite mode
  case ComboBox6.ItemIndex of
    0 : Label3.Caption := Label3.Caption + ' -o+ ';
    1 : Label3.Caption := Label3.Caption + ' -o- ';
  end;

  // get winrar.exe compressor path
  app := ExtractFilePath(Application.ExeName)+'Data\Rar\rar.exe';

  // update program
  StatusBar1.Panels[5].Text := 'wait, compressing';
  Application.ProcessMessages;

  // Start the compression folder process and wait until it is finished.
  // All kinds of files are being compressed.
  if ListBox1.ItemIndex > -1 then
  begin
    // Identify the files selected for packing operation
    with ListBox1 do
    begin
      for i := -1 + Items.Count downto 0 do
      begin
        if Selected[i] then // check item is selected
          // Apply the selected mode to the file format.
          case ComboBox5.ItemIndex of
          0 : // creating a standard RAR archive
              ExecuteAndWait(PChar(app), PChar(' a '+ Label3.Caption + ' -ep "' + path +
                         ExtractFileName(ExcludeTrailingPathDelimiter(Path)) + '.rar"' +
                         ' "' + ListBox1.Items.Strings[i] + '"'));

          1 : // creating a standard ZIP archive
              ExecuteAndWait(PChar(app), PChar(' a '+ Label3.Caption + ' -ep "' + path +
                         ExtractFileName(ExcludeTrailingPathDelimiter(Path)) + '.zip"' +
                         ' "' + ListBox1.Items.Strings[i] + '"'));

          2 : // create a self-extracting SFX file
              ExecuteAndWait(PChar(app), PChar(' a -sfx "' + path +
                         ExtractFileName(ExcludeTrailingPathDelimiter(Path)) + '.exe"' +
                         ' "' + ListBox1.Items.Strings[i] + '"'));
          end;

        // pass the status value to the progress bar
        ProgressBar1.Position := Items.Count;
        Application.ProcessMessages;
      end;
    end;
  end;

  // Determine the size of the entire folder content.
  StatusBar1.Panels[3].Text := IntToStr( Get_File_Size(Path +
                                        ExtractFileName(ExcludeTrailingPathDelimiter(Path)) +
                                        '.rar') div 1000)  +
                                        ' kb';

  StatusBar1.Panels[5].Text := 'File(s) compress finish.';
  // update shell icons
  ListBox1.Repaint;
  ListBox1.SetFocus;
  Button1.Enabled := true;
  Button7.Enabled := true;
  Pack1.Enabled := true;
  Unpack1.Enabled := true;
  Remove1.Enabled := true;
  Selectall1.Enabled := true;
  Clear1.Enabled := true;
  Properties1.Enabled := true;
  Screen.Cursor := crDefault;
end;

// start folder decompressed opration
procedure TForm1.Button7Click(Sender: TObject);
var
  filename : string;
  i : integer;
  HasSelection: Boolean;
begin
  HasSelection := False;

  for i := 0 to ListBox1.Items.Count - 1 do
  begin
    if ListBox1.Selected[i] then
    begin
      HasSelection := True;
      Break; // Abort the loop as soon as at least one has been found
    end;
  end;

  if HasSelection then
  begin
    //ShowMessage('At least one entry is selected.');
  end else begin
    Beep;
    ShowMessage('No entry selected.');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  Button1.Enabled := false;
  Button7.Enabled := false;
  Pack1.Enabled := false;
  Unpack1.Enabled := false;
  Remove1.Enabled := false;
  Selectall1.Enabled := false;
  Clear1.Enabled := false;
  Properties1.Enabled := false;


  // clear parameter string
  Label3.Caption := '';

  // get winrar.exe compressor path
  app := ExtractFilePath(Application.ExeName)+'Data\Rar\Rar.exe';

  // update program
  StatusBar1.Panels[5].Text := 'wait, decompressing';
  Application.ProcessMessages;

        // folder decompress operation
        with ListBox1 do
        begin
          for i := -1 + Items.Count downto 0 do
          begin
            // check whether archive formats are selected..
            if (ExtractFileExt(ListBox1.Items.Strings[i]) = '.rar') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.zip') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.7z') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.tar') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.cab') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.arj') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.lzh') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.jar') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.gz') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.bz2') or
               (ExtractFileExt(ListBox1.Items.Strings[i]) = '.xz') then
               begin
                { The parameter (-o+) is important in this case, as it allows
                  files in the folder to be overwritten if they are also present
                  in the archive.

                  If it is removed, the decompression process crashes;
                  even a (try-except) block won't help here, because the process is
                  being handled outside of the (*.exe). }
                  ExecuteAndWait(PChar(app), PChar(' x -o+ "' +                 // parameters
                                                   ListBox1.Items.Strings[i] +  // filepath
                                                   '"' +                        // filepath end
                                                   ' "' + path +                // destination
                                                   '"'));                       // path end
              end else begin
                // ..if no archive was found
                StatusBar1.Panels[5].Text := 'No archive files found.';
                Button1.Enabled := true;
                Button7.Enabled := true;
                Pack1.Enabled := true;
                Unpack1.Enabled := true;
                Remove1.Enabled := true;
                Selectall1.Enabled := true;
                Clear1.Enabled := true;
                Properties1.Enabled := true;
                Screen.Cursor := crDefault;
                Exit;
              end;
          end;
        end;

  // Determine the size of the entire folder content.
  StatusBar1.Panels[3].Text := IntToStr( GetDirectorySize(path) div 1000) + ' kb';
  StatusBar1.Panels[5].Text := 'File(s) decompress finish.';

  // update ListBox
  ListBox1.Repaint;
  ListBox1.SetFocus;

  Button1.Enabled := true;
  Button7.Enabled := true;
  Pack1.Enabled := true;
  Unpack1.Enabled := true;
  Remove1.Enabled := true;
  Selectall1.Enabled := true;
  Clear1.Enabled := true;
  Properties1.Enabled := true;
  // update form
  Application.ProcessMessages;
  Screen.Cursor := crDefault;
end;

// get help console message and parameter switches information
procedure TForm1.Button8Click(Sender: TObject);
begin
  // get winrar.exe path for help message
  app := ExtractFilePath(Application.ExeName)+'Data\Rar\rar.exe';
  // execute the help console message for compressor
  ExecuteHelpmessageAndWait(PChar(app), PChar(' \h '));
  StatusBar1.SetFocus;
end;

// intigrate comment to the archive
procedure TForm1.CheckBox21Click(Sender: TObject);
begin
  if CheckBox21.Checked = true then
  begin
    Label12.Enabled := true;
    ComboBox8.Enabled := true;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    Memo1.Enabled := true;
  end else begin
    Label12.Enabled := false;
    ComboBox8.Enabled := false;
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    Memo1.Enabled := false;
  end;
end;

// bring form to the forefront
procedure TForm1.CheckBox8Click(Sender: TObject);
begin
  if CheckBox8.Checked = true then
  begin
    SetWindowPos(Handle, HWND_TOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end else begin
    SetWindowPos(Handle, HWND_NOTOPMOST, Left,Top, Width,Height,
             SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  end;
end;

// enable password entry
procedure TForm1.CheckBox9Click(Sender: TObject);
begin
  if CheckBox9.Checked = true then
  begin
    Label16.Enabled := true;
    Label17.Enabled := true;
    ComboBox7.Enabled := true;
    Edit1.Enabled := true;
  end else begin
    Label16.Enabled := false;
    Label17.Enabled := false;
    ComboBox7.Enabled := false;
    Edit1.Enabled := false;
  end;
end;

// clear all items in the listbox
procedure TForm1.Clear1Click(Sender: TObject);
begin
  ListBox1.Clear;
  Button6.Enabled := false;
  Button7.Enabled := false;
  Pack1.Enabled := false;
  Unpack1.Enabled := false;
  Remove1.Enabled := false;
  Selectall1.Enabled := false;
  Clear1.Enabled := false;
  Properties1.Enabled := false;
  GroupBox6.Caption := ' Multiple Files : 0 ';

  // calculate the sum of the entries..
  sum := ListBox1.Items.Count;
  // ..set it to zero
  ProgressBar1.Position := 0;

  StatusBar1.Panels[1].Text := '0 kb';
  StatusBar1.Panels[3].Text := '0 kb';
  ListBox1.SetFocus;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    ListBox1.SetFocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteOptions;

  { is used in Delphi to undo the subclassing of a TListBox component and
    restore the original behavior of the window procedure. }
  ListBox1.WindowProc := OldLBWindowProc;
  // re-enable the drag-and-drop function
  DragAcceptFiles(ListBox1.Handle, False);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
  rar : TArray<string>;
  files : string;
begin
  // check whether the required files are present..
  rar := [MainDir + 'Data\Rar\Rar.exe',
          MainDir + 'Data\Rar\UnRAR.exe',
          MainDir + 'Data\Rar\Zip.SFX',
          MainDir + 'Data\Rar\Zip32.SFX',
          MainDir + 'Data\Rar\RarExt.dll',
          MainDir + 'Data\Rar\RarExt32.dll',
          MainDir + 'Data\Rar\WinCon.SFX',
          MainDir + 'Data\Rar\WinCon32.SFX'];

  for files in rar do
    if not FileExists(files) then
    begin
      // .. if not, terminate the program
      ShowMessage('Missed : ' + files + #10#13 +
                  'check ..Rar\ folder' + #10#13 +
                  'Application terminate!');
      Application.Terminate;
    end;

  StatusBar1.Panels[5].Text := 'RAR files found.';

  // It is necessary in order to see the horizontal scrollbar in the listbox.
  DoubleBuffered := true;
  Listbox1.Perform(LB_SetHorizontalExtent, 2000, Longint(0));

  // 1. Enable multiple file selection (preserving any existing options)
  OpenDialog1.Options := OpenDialog1.Options + [ofAllowMultiSelect];

  // Prevents free text input
  ComboBox2.Style := csDropDownList;
  // Link names and the corresponding WinAPI constants
  ComboBox2.AddItem('Idle (Low)', TObject(IDLE_PRIORITY_CLASS));
  // Manually defined for older Delphi versions, if applicable.
  ComboBox2.AddItem('Below Normal', TObject($00004000));
  ComboBox2.AddItem('Normal', TObject(NORMAL_PRIORITY_CLASS));
  // Manually defined if necessary
  ComboBox2.AddItem('Above Normal', TObject($00008000));
  ComboBox2.AddItem('High (Process)', TObject(HIGH_PRIORITY_CLASS));
  ComboBox2.AddItem('Realtime (Real-Time)', TObject(REALTIME_PRIORITY_CLASS));

  // Select 'Normal' by default (index 2)
  ComboBox2.ItemIndex := 2;

  ListBox1.Style := lbOwnerDrawFixed;
  ListBox1.ItemHeight := 16;

  // store defualt WindowProc
  OldLBWindowProc := ListBox1.WindowProc;
  // replace default WindowProc
  ListBox1.WindowProc := LBWindowProc;
  // now ListBox1 accept dropped files
  DragAcceptFiles(ListBox1.Handle, True);
end;

// read the options
procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
  CheckBox9.OnClick(sender);
  CheckBox21.OnClick(sender);
end;

procedure TForm1.Label11Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    PChar(MainDir + 'Data\Rar\Order.htm'), nil, nil, SW_SHOWNORMAL) ;
end;

procedure TForm1.Label11MouseLeave(Sender: TObject);
begin
  Label11.Font.Color := clBlack;
  Label11.Font.Style := [];
end;

procedure TForm1.Label11MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label11.Font.Color := clBlue;
  Label11.Font.Style := [fsUnderline];
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    PChar(MainDir + 'Data\Rar\WinRAR.chm'), nil, nil, SW_SHOWNORMAL) ;
end;

procedure TForm1.Label2MouseLeave(Sender: TObject);
begin
  Label2.Font.Color := clBlack;
  Label2.Font.Style := [];
end;

procedure TForm1.Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label2.Font.Color := clBlue;
  Label2.Font.Style := [fsUnderline];
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    PChar(MainDir + 'Data\Rar\ReadMe.txt'), nil, nil, SW_SHOWNORMAL) ;
end;

procedure TForm1.Label6MouseLeave(Sender: TObject);
begin
  Label6.Font.Color := clBlack;
  Label6.Font.Style := [];
end;

procedure TForm1.Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label6.Font.Color := clBlue;
  Label6.Font.Style := [fsUnderline];
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    PChar(MainDir + 'Data\Rar\License.txt'), nil, nil, SW_SHOWNORMAL) ;
end;

procedure TForm1.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Color := clBlack;
  Label7.Font.Style := [];
end;

procedure TForm1.Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label7.Font.Color := clBlue;
  Label7.Font.Style := [fsUnderline];
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  ProgressBar1.Position := 0;
  if ListBox1.MultiSelect then
    sum := ListBox1.SelCount
  else if ListBox1.ItemIndex <> -1 then
    sum := 1
  else
    sum := 0;
  // Pass the sum of the selected entries to the ProgressBar as max.
  ProgressBar1.Max :=  sum;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  Properties1.Click;
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
 Len: Integer;
 NewText: String;
begin
  NewText := Listbox1.Items[Index];

  // draw horizontal scrollbar
  with Listbox1.Canvas do
  begin
    FillRect(Rect);
    TextOut(Rect.Left + 1, Rect.Top, NewText);
    Len := TextWidth(NewText) + Rect.Left + 10;
    if Len>flbHorzScrollWidth then
    begin
      flbHorzScrollWidth := Len;
      Listbox1.Perform(LB_SETHORIZONTALEXTENT, flbHorzScrollWidth, 0 );
    end;
  end;

  // draw the icons in the listbox
  DrawListBoxExtra(Control, Index, Rect, State);
end;

procedure TForm1.Pack1Click(Sender: TObject);
begin
  Button6.Click;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    ListBox1.SetFocus;
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  Panel2.Visible := Panel3.Checked;
end;

procedure TForm1.Properties1Click(Sender: TObject);
begin
  PropertiesDialog(ListBox1.Items.Strings[ListBox1.ItemIndex]);
end;

end.
