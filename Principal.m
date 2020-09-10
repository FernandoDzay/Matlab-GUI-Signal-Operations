function varargout = Principal(varargin)
% PRINCIPAL MATLAB code for Principal.fig
%      PRINCIPAL, by itself, creates a new PRINCIPAL or raises the existing
%      singleton*.
%
%      H = PRINCIPAL returns the handle to a new PRINCIPAL or the handle to
%      the existing singleton*.
%
%      PRINCIPAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRINCIPAL.M with the given input arguments.
%
%      PRINCIPAL('Property','Value',...) creates a new PRINCIPAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Principal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Principal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Principal

% Last Modified by GUIDE v2.5 25-May-2017 01:01:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Principal_OpeningFcn, ...
                   'gui_OutputFcn',  @Principal_OutputFcn, ...
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


% --- Executes just before Principal is made visible.
function Principal_OpeningFcn(hObject, eventdata, handles, varargin)
%T�tulos sobre imagen
%T�tulo
a=imread('Proyecto.jpg');
image(a);
axis off;



% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Principal (see VARARGIN)

% Choose default command line output for Principal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Principal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Principal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ButtonComenzar.
function ButtonComenzar_Callback(hObject, eventdata, handles)
close
Menu



% --- Executes on button press in BottonFourier.
function BottonFourier_Callback(hObject, eventdata, handles)
% hObject    handle to BottonFourier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
