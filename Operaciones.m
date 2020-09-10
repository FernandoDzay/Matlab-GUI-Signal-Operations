function varargout = Operaciones(varargin)
% OPERACIONES MATLAB code for Operaciones.fig
%      OPERACIONES, by itself, creates a new OPERACIONES or raises the existing
%      singleton*.
%
%      H = OPERACIONES returns the handle to a new OPERACIONES or the handle to
%      the existing singleton*.
%
%      OPERACIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERACIONES.M with the given input arguments.
%
%      OPERACIONES('Property','Value',...) creates a new OPERACIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Operaciones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Operaciones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Operaciones

% Last Modified by GUIDE v2.5 25-May-2017 06:17:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Operaciones_OpeningFcn, ...
                   'gui_OutputFcn',  @Operaciones_OutputFcn, ...
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
% End initialization code - DO NOT EDIT

% --- Executes just before Operaciones is made visible.
function Operaciones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Operaciones (see VARARGIN)

% Choose default command line output for Operaciones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Operaciones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Operaciones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BottonSuma.
function BottonSuma_Callback(hObject, eventdata, handles)
syms t;
F1 = get(handles.Funcion1,'string');
F2 = get(handles.Funcion2,'string');
Posicion11 = str2num(get(handles.Posicion11,'string'));
Posicion12 = str2num(get(handles.Posicion12,'string'));
Ancho1 = Posicion12 - Posicion11;
Posicion21 = str2num(get(handles.Posicion21,'string'));
Posicion22 = str2num(get(handles.Posicion22,'string'));
Ancho2 = Posicion22 - Posicion21;

Desplazamiento1 = Ancho1/2 + Posicion11;
T = Ancho1;
t2 = Posicion11:.01:Posicion22;
F1 = subs(F1,t, t2);
F2 = subs(F2,t, t2);
 

Rect = rectpuls(t2-Desplazamiento1,T);
y = F1.*Rect;

T2 = Ancho2;
Desplazamiento2 = Ancho2/2 + Posicion21;
Rect2 = rectpuls(t2-Desplazamiento2,T2);
y2 = F2.*Rect2;
suma = y + y2;

plot(handles.GraficarOp,t2,suma);


% --- Executes on button nnnnnnnnnnnnnpress in BottonResta.
function BottonResta_Callback(hObject, eventdata, handles)
syms t;
F1 = get(handles.Funcion1,'string');
F2 = get(handles.Funcion2,'string');
Posicion11 = str2num(get(handles.Posicion11,'string'));
Posicion12 = str2num(get(handles.Posicion12,'string'));
Ancho1 = Posicion12 - Posicion11;
Posicion21 = str2num(get(handles.Posicion21,'string'));
Posicion22 = str2num(get(handles.Posicion22,'string'));
Ancho2 = Posicion22 - Posicion21;

Desplazamiento1 = Ancho1/2 + Posicion11;
T = Ancho1;
t2 = Posicion11:.01:Posicion22;
F1 = subs(F1,t, t2);
F2 = subs(F2,t, t2);
 

Rect = rectpuls(t2-Desplazamiento1,T);
y = F1.*Rect;

T2 = Ancho2;
Desplazamiento2 = Ancho2/2 + Posicion21;
Rect2 = rectpuls(t2-Desplazamiento2,T2);
y2 = F2.*Rect2;
resta = y - y2;

plot(handles.GraficarOp,t2,resta);



% --- Executes on button press in BottonMultiplicar.
function BottonMultiplicar_Callback(hObject, eventdata, handles)
syms t;
F1 = get(handles.Funcion1,'string');
F2 = get(handles.Funcion2,'string');
Posicion11 = str2num(get(handles.Posicion11,'string'));
Posicion12 = str2num(get(handles.Posicion12,'string'));
Ancho1 = Posicion12 - Posicion11;
Posicion21 = str2num(get(handles.Posicion21,'string'));
Posicion22 = str2num(get(handles.Posicion22,'string'));
Ancho2 = Posicion22 - Posicion21;

Desplazamiento1 = Ancho1/2 + Posicion11;
T = Ancho1;
t2 = Posicion11:.01:Posicion22;
F1 = subs(F1,t, t2);
F2 = subs(F2,t, t2);
 

Rect = rectpuls(t2-Desplazamiento1,T);
y = F1.*Rect;

T2 = Ancho2;
Desplazamiento2 = Ancho2/2 + Posicion21;
Rect2 = rectpuls(t2-Desplazamiento2,T2);
y2 = F2.*Rect2;
Multiplicacion = y .* y2;

plot(handles.GraficarOp,t2,Multiplicacion);





% --- Executes on button press in BottonIntegracion.
function BottonIntegracion_Callback(hObject, eventdata, handles)

if isempty(get(handles.Funcion2,'string')) && isempty(get(handles.Posicion21,'string')) && isempty(get(handles.Posicion22,'string'))
   
else
    msgbox('Favor de sólo insertar la señal 1');
end

  set(handles.Funcion2,'string','');
    set(handles.Posicion21,'string','');
    set(handles.Posicion22,'string','');
    
if isempty(get(handles.Funcion2,'string')) && isempty(get(handles.Posicion21,'string')) && isempty(get(handles.Posicion22,'string'))
    syms t;
    F1 = str2double(get(handles.Funcion1,'string'));
    F1 = int(sym(F1),t);
    Posicion11 = str2num(get(handles.Posicion11,'string'));
    Posicion12 = str2num(get(handles.Posicion12,'string'));
    Ancho1 = Posicion12 - Posicion11;

    Desplazamiento1 = Ancho1/2 + Posicion11;
    T = Ancho1;
    t2 = Posicion11-3:.01:Posicion12+3;
    F1 = subs(F1,t, t2);

    Rect = rectpuls(t2-Desplazamiento1,T);
    y = F1.*Rect;

    plot(handles.GraficarOp,t2,y);
else
    set(handles.Funcion2,'string','');
    set(handles.Posicion21,'string','');
    set(handles.Posicion22,'string','');
    
end




% --- Executes on button press in BottonDiferenciador.
function BottonDiferenciador_Callback(hObject, eventdata, handles)
if isempty(get(handles.Funcion2,'string')) && isempty(get(handles.Posicion21,'string')) && isempty(get(handles.Posicion22,'string'))
   
else
    msgbox('Favor de sólo insertar la señal 1');
end

  set(handles.Funcion2,'string','');
    set(handles.Posicion21,'string','');
    set(handles.Posicion22,'string','');
    
if isempty(get(handles.Funcion2,'string')) && isempty(get(handles.Posicion21,'string')) && isempty(get(handles.Posicion22,'string'))
    syms t;
    F1 = get(handles.Funcion1,'string');
    F1 = diff(sym(F1),t);
    Posicion11 = str2num(get(handles.Posicion11,'string'));
    Posicion12 = str2num(get(handles.Posicion12,'string'));
    Ancho1 = Posicion12 - Posicion11;

    Desplazamiento1 = Ancho1/2 + Posicion11;
    T = Ancho1;
    t2 = Posicion11-3:.01:Posicion12+3;
    F1 = subs(F1,t, t2);

    Rect = rectpuls(t2-Desplazamiento1,T);
    y = F1.*Rect;

    plot(handles.GraficarOp,t2,y);
else
 set(handles.Funcion2,'string','');
    set(handles.Posicion21,'string','');
    set(handles.Posicion22,'string','');
end




function Funcion1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Funcion1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Funcion2_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Funcion2 as text
%        str2double(get(hObject,'String')) returns contents of Funcion2 as a double


% --- Executes during object creation, after setting all properties.
function Funcion2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Posicion11_Callback(hObject, eventdata, handles)
% hObject    handle to Posicion11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Posicion11 as text
%        str2double(get(hObject,'String')) returns contents of Posicion11 as a double


% --- Executes during object creation, after setting all properties.
function Posicion11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Posicion11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Posicion21_Callback(hObject, eventdata, handles)
% hObject    handle to Posicion21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Posicion21 as text
%        str2double(get(hObject,'String')) returns contents of Posicion21 as a double


% --- Executes during object creation, after setting all properties.
function Posicion21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Posicion21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jump1_Callback(hObject, eventdata, handles)
% hObject    handle to Posicion21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Posicion21 as text
%        str2double(get(hObject,'String')) returns contents of Posicion21 as a double


% --- Executes during object creation, after setting all properties.
function jump1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Posicion21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Posicion12_Callback(hObject, eventdata, handles)
% hObject    handle to Posicion21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Posicion21 as text
%        str2double(get(hObject,'String')) returns contents of Posicion21 as a double


% --- Executes during object creation, after setting all properties.
function Posicion12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Posicion21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jump2_Callback(hObject, eventdata, handles)
% hObject    handle to jump2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jump2 as text
%        str2double(get(hObject,'String')) returns contents of jump2 as a double


% --- Executes during object creation, after setting all properties.
function jump2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jump2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Posicion22_Callback(hObject, eventdata, handles)
% hObject    handle to Posicion22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Posicion22 as text
%        str2double(get(hObject,'String')) returns contents of Posicion22 as a double


% --- Executes during object creation, after setting all properties.
function Posicion22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Posicion22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Funcion1 and none of its controls.
function Funcion1_KeyPressFcn(hObject, eventdata, handles)


% --- Executes on button press in BottonGrafica1.
function BottonGrafica1_Callback(hObject, eventdata, handles)
syms t;
F1 = get(handles.Funcion1,'string');

Posicion11 = str2num(get(handles.Posicion11,'string'));
Posicion12 = str2num(get(handles.Posicion12,'string'));
Ancho1 = Posicion12 - Posicion11;

Desplazamiento1 = Ancho1/2 + Posicion11;
T = Ancho1;
t2 = Posicion11-3:.01:Posicion12+3;
F1 = subs(F1,t, t2);

Rect = rectpuls(t2-Desplazamiento1,T);
y = F1.*Rect;

plot(handles.Grafica1,t2,y);

% --- Executes on button press in BottonGrafica2.
function BottonGrafica2_Callback(hObject, eventdata, handles)
syms t;
F2 = get(handles.Funcion2,'string');

Posicion21 = str2num(get(handles.Posicion21,'string'));
Posicion22 = str2num(get(handles.Posicion22,'string'));
Ancho2 = Posicion22 - Posicion21;

Desplazamiento2 = Ancho2/2 + Posicion21;
T = Ancho2;
t2 = Posicion21-3:.01:Posicion22+3;
F2 = subs(F2,t, t2);

Rect = rectpuls(t2-Desplazamiento2,T);
y = F2.*Rect;

plot(handles.Grafica2,t2,y);


% --------------------------------------------------------------------
function Atras_Callback(hObject, eventdata, handles)
close
Menu


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
winopen Operaciones.txt
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
