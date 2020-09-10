function varargout = Laplace(varargin)
% LAPLACE MATLAB code for Laplace.fig
%      LAPLACE, by itself, creates a new LAPLACE or raises the existing
%      singleton*.
%
%      H = LAPLACE returns the handle to a new LAPLACE or the handle to
%      the existing singleton*.
%
%      LAPLACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAPLACE.M with the given input arguments.
%
%      LAPLACE('Property','Value',...) creates a new LAPLACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Laplace_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Laplace_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Laplace

% Last Modified by GUIDE v2.5 25-May-2017 06:15:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Laplace_OpeningFcn, ...
                   'gui_OutputFcn',  @Laplace_OutputFcn, ...
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


% --- Executes just before Laplace is made visible.
function Laplace_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Laplace (see VARARGIN)

% Choose default command line output for Laplace
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Laplace wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Laplace_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function InsertTrans_Callback(hObject, eventdata, handles)
% hObject    handle to InsertTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsertTrans as text
%        str2double(get(hObject,'String')) returns contents of InsertTrans as a double


% --- Executes during object creation, after setting all properties.
function InsertTrans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsertTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PushButton_TrasfLaplace.
function PushButton_TrasfLaplace_Callback(hObject, eventdata, handles)
%transformada de Laplace 
if isempty(get(handles.InsertTrans, 'string'))
  set(handles.InsertTrans,'string',0);
end
if isempty(get(handles.InsertTransI, 'string'))
  set(handles.InsertTransI,'string',0);
end
xt=sym(get(handles.InsertTrans,'string'));
F=laplace(xt);
set(handles.Result,'string',char(F));




% --- Executes on button press in PushButton_transi.
function PushButton_transi_Callback(hObject, eventdata, handles)
if isempty(get(handles.InsertTrans, 'string'))
  set(handles.InsertTrans,'string',0);
end
if isempty(get(handles.InsertTransI, 'string'))
  set(handles.InsertTransI,'string',0);
end
xt=sym(get(handles.InsertTransI,'string'));
F=ilaplace(xt);
set(handles.Result,'string',char(F));
pretty(F)


function InsertTransI_Callback(hObject, eventdata, handles)
% hObject    handle to InsertTransI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InsertTransI as text
%        str2double(get(hObject,'String')) returns contents of InsertTransI as a double


% --- Executes during object creation, after setting all properties.
function InsertTransI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InsertTransI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Result_Callback(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Result as text
%        str2double(get(hObject,'String')) returns contents of Result as a double


% --- Executes during object creation, after setting all properties.
function Result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Atras_Callback(hObject, eventdata, handles)
close
Menu


% --------------------------------------------------------------------
function Ayuda_Callback(hObject, eventdata, handles)
% hObject    handle to Ayuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Tutorial_Callback(hObject, eventdata, handles)
winopen Laplace.txt
