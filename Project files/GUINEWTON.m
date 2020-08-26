function varargout = GUINEWTON(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUINEWTON_OpeningFcn, ...
                   'gui_OutputFcn',  @GUINEWTON_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


function GUINEWTON_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = GUINEWTON_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%daqui para cima o código foi gerado automáticamente

function pushbutton1_Callback(hObject, eventdata, handles)%botão roda o fluxo de pot
set(handles.text3,'String','Os resultados serão apresentados no Command Window'); %Apos clicar no botão aparece o texto no text3
pause(0.5); %pausa o programa por 0.5s
set(handles.text3,'String',''); %depois apaga oque está escrito no text3


var = get(handles.edit1,'string'); %vai receber oque esta escrito no edit1 (caixa que o usuário pode alterar)
run(var) %roda oque foi escrito
NOVAguiabrenewton(busdata,linedata,basemva,var); %comeca o calculo


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles) %botão procurar
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
var2 = uigetfile('*.m'); %abra uma janela, e permite escolher um arquivo do tipo .m, e salva o nome do arquivo escolhido em var2
set(handles.edit1,'String',var2); %altera o texto da caixa de procura


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text3,'String','Os resultados serão apresentados no Command Window'); %Apos clicar no botão aparece o texto no text3
pause(0.5); %pausa o programa por 0.5s
set(handles.text3,'String',''); %depois apaga oque está escrito no text3


var = get(handles.edit1,'string'); %vai receber oque esta escrito no edit1 (caixa que o usuário pode alterar)
run(var) %roda oque foi escrito
guiabrenewtonD(busdata,linedata,basemva,var); %comeca o calculo


% --- Executes on button press in btn_ajuda.
function btn_ajuda_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ajuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('test.pdf');
