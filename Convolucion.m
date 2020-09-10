function varargout = Convolucion(varargin)
% CONVOLUCION MATLAB code for Convolucion.fig
%      CONVOLUCION, by itself, creates a new CONVOLUCION or raises the existing
%      singleton*.
%
%      H = CONVOLUCION returns the handle to a new CONVOLUCION or the handle to
%      the existing singleton*.
%
%      CONVOLUCION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVOLUCION.M with the given input arguments.
%
%      CONVOLUCION('Property','Value',...) creates a new CONVOLUCION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Convolucion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Convolucion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Convolucion

% Last Modified by GUIDE v2.5 25-May-2017 17:58:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Convolucion_OpeningFcn, ...
                   'gui_OutputFcn',  @Convolucion_OutputFcn, ...
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


% --- Executes just before Convolucion is made visible.
function Convolucion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Convolucion (see VARARGIN)

% Choose default command line output for Convolucion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Convolucion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Convolucion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Grafica.
function Grafica_Callback(hObject, eventdata, handles)
pause on;
a = str2num(get(handles.IntervaloInfXt,'string'));%-2input('Primer intervalo x(t):\n');
b = str2num(get(handles.IntervaloSupXt,'string'));%2input('Segundo intervalo x(t):\n');
syms t
x = get(handles.Funcion1,'string');%t.^2input('Función x(t):\n');
t2 = a:.1:b;
x = subs(x,t,t2);
a1 = str2num(get(handles.IntervaloInfHt,'string'));%-1input('Primer intervalo h (t):\n');
b1 = str2num(get(handles.IntervaloSupHt,'string'));%1input('Segundo intervalo ht:\n');
t2 = a1:.1:b1;
h = get(handles.Funcion2,'string');%0*t+1;input('Función h(t):\n ');
h = subs(h,t,t2);
m = length(x);
n = length(h);
hi = fliplr(h);

k = 60;
X = [x,zeros(1,(k*2)-m)];
X = X([end-k+1:end 1:end-k]);
H = [h,zeros(1, (k*2)-n)];
H = H([end-k+1:end 1:end-k]);
Hi=[hi,zeros(1,(k*2)-n)];
xn=-k:k-1;
Y=zeros(1,(k*2));
p=zeros(1,(k*2));


for i=1:(k*2)-n
    p=X.*Hi;
    Y(i+n-1)=sum(p);
    
    plot(handles.Grafica1,xn,X);
    ylabel('x(t)');
    title('señal invariante en el tiempo');
    plot(handles.Grafica2,xn,Hi,'g');
    ylabel('h(t)');
    title('señal viajante');
    plot(handles.Grafica3,xn,Y,'red');
    ylabel('y(t)')
    title('convolución');
    Hi=Hi([end 1: end-1]);
    pause(0.05);
end
pause off;





function IntervaloSupHt_Callback(hObject, eventdata, handles)
% hObject    handle to IntervaloSupHt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IntervaloSupHt as text
%        str2double(get(hObject,'String')) returns contents of IntervaloSupHt as a double


% --- Executes during object creation, after setting all properties.
function IntervaloSupHt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntervaloSupHt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IntervaloInfHt_Callback(hObject, eventdata, handles)
% hObject    handle to IntervaloInfHt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IntervaloInfHt as text
%        str2double(get(hObject,'String')) returns contents of IntervaloInfHt as a double


% --- Executes during object creation, after setting all properties.
function IntervaloInfHt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntervaloInfHt (see GCBO)
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



function Funcion1_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Funcion1 as text
%        str2double(get(hObject,'String')) returns contents of Funcion1 as a double


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



function IntervaloSupXt_Callback(hObject, eventdata, handles)
% hObject    handle to IntervaloSupXt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IntervaloSupXt as text
%        str2double(get(hObject,'String')) returns contents of IntervaloSupXt as a double


% --- Executes during object creation, after setting all properties.
function IntervaloSupXt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntervaloSupXt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IntervaloInfXt_Callback(hObject, eventdata, handles)
% hObject    handle to IntervaloInfXt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IntervaloInfXt as text
%        str2double(get(hObject,'String')) returns contents of IntervaloInfXt as a double


% --- Executes during object creation, after setting all properties.
function IntervaloInfXt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntervaloInfXt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
close
Menu


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
winopen Convolucion.txt


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
