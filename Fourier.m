function varargout = Fourier(varargin)
% FOURIER MATLAB code for Fourier.fig
%      FOURIER, by itself, creates a new FOURIER or raises the existing
%      singleton*.
%
%      H = FOURIER returns the handle to a new FOURIER or the handle to
%      the existing singleton*.
%
%      FOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURIER.M with the given input arguments.
%
%      FOURIER('Property','Value',...) creates a new FOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fourier

% Last Modified by GUIDE v2.5 25-May-2017 06:19:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @Fourier_OutputFcn, ...
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


% --- Executes just before Fourier is made visible.
function Fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fourier (see VARARGIN)

% Choose default command line output for Fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BottonFourier_trigo.
function BottonFourier_trigo_Callback(hObject, eventdata, handles)
clc
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end




syms t;
n = 1:str2num(get(handles.Armonicos,'string'));
T = str2num(get(handles.Periodo,'string'));
w0 = 2*pi/T;

xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');

a0 = (1/T)*(int(xt1,t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
an = (2/T)*(int(xt1.*cos(n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*cos(n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*cos(n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
bn = (2/T)*(int(xt1.*sin(n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*sin(n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*sin(n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
u = ones(1,str2double(get(handles.Armonicos,'string')));
xt = an.*cos(n*w0*t) + bn.*sin(n*w0*t);
xt = dot(xt,u);
xt = a0 + xt;
simplify(xt);
pretty(xt)








% syms t;
% n = 1:str2num(get(handles.Armonicos,'string'));
% T = str2num(get(handles.Periodo,'string'));
% w0 = 2*pi/T;
% xt = get(handles.Funcion,'string');
% 
% a0 = (1/T)*int(xt,t,get(handles.LimInf,'string'),str2num(get(handles.LimSup,'string')));
% an = (2/T)*int(xt*cos(n*w0*t),t,get(handles.LimInf,'string'),str2num(get(handles.LimSup,'string')));
% bn = (2/T)*int(xt*sin(n*w0*t),t,get(handles.LimInf,'string'),str2num(get(handles.LimSup,'string')));
% u = ones(1,str2double(get(handles.Armonicos,'string')));
% xt = an.*cos(n*w0*t) + bn.*sin(n*w0*t);
% xt = dot(xt,u);
% xt = a0 + xt;
% simplify(xt);
% pretty(xt)



% --- Executes on button press in Botton_FourierComp.
function Botton_FourierComp_Callback(hObject, eventdata, handles)
clc
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end
%----obtencion de funciones
xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');
%----

r=sym(pi);
T= str2num(get(handles.Periodo,'string'));
w0 = 2*r/T;
%syms n;
n = 1:str2num(get(handles.Armonicos,'string'));
syms t;
%
c0 = (1/T)*(int(xt1,t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
Cn = (1/T)*(int(xt1.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));

u = ones(1,str2double(get(handles.Armonicos,'string')));
%xt = an.*cos(n*w0*t) + bn.*sin(n*w0*t);
xt = Cn.*exp(j*n*w0*t);
xt = dot(xt,u);
xt = c0 + xt;
simplify(xt);
pretty(xt)


%----------------------------------------------------------------------------------------
% syms t;
% n = 1:str2num(get(handles.Armonicos,'string'));
% T = str2num(get(handles.Periodo,'string'));
% w0 = 2*pi/T;
% 
% xt1 = get(handles.Funcion1,'string');
% xt2 = get(handles.Funcion2,'string');
% xt3 = get(handles.Funcion3,'string');
% 
% a0 = (1/T)*(int(xt1,t,get(handles.LimInf1,'string'),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,get(handles.LimInf2,'string'),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,get(handles.LimInf3,'string'),str2num(get(handles.LimSup3,'string'))));
% an = (2/T)*(int(xt1.*cos(n*w0*t),t,get(handles.LimInf1,'string'),str2num(get(handles.LimSup1,'string'))) + int(xt2.*cos(n*w0*t),t,get(handles.LimInf2,'string'),str2num(get(handles.LimSup2,'string'))) + int(xt3.*cos(n*w0*t),t,get(handles.LimInf3,'string'),str2num(get(handles.LimSup3,'string'))));
% bn = (2/T)*(int(xt1.*sin(n*w0*t),t,get(handles.LimInf1,'string'),str2num(get(handles.LimSup1,'string'))) + int(xt2.*sin(n*w0*t),t,get(handles.LimInf2,'string'),str2num(get(handles.LimSup2,'string'))) + int(xt3.*sin(n*w0*t),t,get(handles.LimInf3,'string'),str2num(get(handles.LimSup3,'string'))));
% u = ones(1,str2double(get(handles.Armonicos,'string')));
% xt = an.*cos(n*w0*t) + bn.*sin(n*w0*t);
% xt = dot(xt,u);
% xt = a0 + xt;
% simplify(xt);
% pretty(xt)
%---------------------------------------------------------------------








% --- Executes on button press in Botton_FourierTrans.
function Botton_FourierTrans_Callback(hObject, eventdata, handles)
clc
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end

syms j w t;
f = exp(-10*t);
LimInf1 = get(handles.LimInf1,'string');
LimSup1 = get(handles.LimSup1,'string');

LimInf2 = get(handles.LimInf2,'string');
LimSup2 = get(handles.LimSup2,'string');

LimInf3 = get(handles.LimInf3,'string');
LimSup3 = get(handles.LimSup3,'string');
f1 = get(handles.Funcion1,'string');
f2 = get(handles.Funcion2,'string');
f3 = get(handles.Funcion3,'string');

X = int(f1*exp(-j*w*t),t,LimInf1,LimSup1) + int(f2*exp(-j*w*t),t,LimInf2,LimSup2) + int(f3*exp(-j*w*t),t,LimInf3,LimSup1);
disp(' X(jw) '), pretty(X)

w = -20:.01:20;
inline(X);
ans(-20:.01:20);

subplot(2,1,1);
plot(w,real(ans),'g','linewidth',2);
title('|X(jw)| Dominio de la frecuencia ');
xlabel(' (w) Rango ');
grid on;

subplot(2,1,2)
plot(w,imag(ans),'r','linewidth',2.5);
title('< X(jw) Angulo ')
xlabel('(w) rango')
grid on;


% --- Executes on button press in Botton_FourierTinv.
function Botton_FourierTinv_Callback(hObject, eventdata, handles)
% hObject    handle to Botton_FourierTinv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Botton_FourierEfase.
function Botton_FourierEfase_Callback(hObject, eventdata, handles)
clc
set(handles.Funcion3,'string',0)
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end
T = str2num(get(handles.Periodo,'string'));
w0=2*pi/T;
syms t;
syms n
xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');
%grafica ara frecuencias desde +5pi a 5pi

n=1:str2num(get(handles.Armonicos,'string'));
C0 = (1/T)*(int(xt1,t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));

Cn = (1/T)*(int(xt1.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));

w=[w0*n 0 w0*(-n)];
argcn=angle([Cn C0 Cn]);
stem(w,argcn); grid on;
title('Espectro de Fase');
xlabel('w0*n'); ylabel('Ángulo');



% --- Executes on button press in Botton_FourierEAmpli.
function Botton_FourierEAmpli_Callback(hObject, eventdata, handles)
clc
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end
T = str2num(get(handles.Periodo,'string'));
w0=2*pi/T;
syms t;
syms n
xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');
%grafica ara frecuencias desde +5pi a 5pi

n=1:str2num(get(handles.Armonicos,'string'));
C0 = (1/T)*(int(xt1,t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));

Cn = (1/T)*(int(xt1.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));

w=[w0*n 0 w0*(-n)];
modcn=abs([Cn C0 Cn]);
stem(w,modcn); grid on;
title(['Espectro,T=', num2str(T)]);
ylabel('|Cn|');



% --- Executes on button press in Botton_FourierCoef.
function Botton_FourierCoef_Callback(hObject, eventdata, handles)
clc
set(handles.Funcion3,'string',0)
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end
syms t n;
%n = 1:str2num(get(handles.Armonicos,'string'));
T = str2num(get(handles.Periodo,'string'));
w0 = 2*pi./T;

xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');

a0 = (1./T)*(  int(xt1,t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
an = (2./T)*(int(xt1*cos(n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2*cos(n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3*cos(n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
bn = (2./T)*(int(xt1*sin(n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2*sin(n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3*sin(n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
disp('a0')
pretty(a0)

disp('an')
pretty(an)

disp('bn')
pretty(bn)

% --- Executes on button press in Botton_FourierCn.
function Botton_FourierCn_Callback(hObject, eventdata, handles)
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end
%----obtencion de funciones
xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');
%----

r=sym(pi);
T= str2num(get(handles.Periodo,'string'));
w0 = 2*r/T;
syms n;
syms t;
%
Cn = (1/T)*(int(xt1.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*exp(-j*n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));


disp('Cn =')
pretty(Cn)




function Periodo_Callback(hObject, eventdata, handles)
% hObject    handle to Periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Periodo as text
%        str2double(get(hObject,'String')) returns contents of Periodo as a double


% --- Executes during object creation, after setting all properties.
function Periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Armonicos_Callback(hObject, eventdata, handles)
% hObject    handle to Armonicos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Armonicos as text
%        str2double(get(hObject,'String')) returns contents of Armonicos as a double


% --- Executes during object creation, after setting all properties.
function Armonicos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Armonicos (see GCBO)
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



function LimInf1_Callback(hObject, eventdata, handles)
% hObject    handle to LimInf1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LimInf1 as text
%        str2double(get(hObject,'String')) returns contents of LimInf1 as a double


% --- Executes during object creation, after setting all properties.
function LimInf1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimInf1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LimSup1_Callback(hObject, eventdata, handles)
% hObject    handle to LimSup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LimSup1 as text
%        str2double(get(hObject,'String')) returns contents of LimSup1 as a double


% --- Executes during object creation, after setting all properties.
function LimSup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimSup1 (see GCBO)
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



function LimInf2_Callback(hObject, eventdata, handles)
% hObject    handle to LimInf2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LimInf2 as text
%        str2double(get(hObject,'String')) returns contents of LimInf2 as a double


% --- Executes during object creation, after setting all properties.
function LimInf2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimInf2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LimSup2_Callback(hObject, eventdata, handles)
% hObject    handle to LimSup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LimSup2 as text
%        str2double(get(hObject,'String')) returns contents of LimSup2 as a double


% --- Executes during object creation, after setting all properties.
function LimSup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimSup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Funcion3_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Funcion3 as text
%        str2double(get(hObject,'String')) returns contents of Funcion3 as a double


% --- Executes during object creation, after setting all properties.
function Funcion3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LimInf3_Callback(hObject, eventdata, handles)
% hObject    handle to LimInf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LimInf3 as text
%        str2double(get(hObject,'String')) returns contents of LimInf3 as a double


% --- Executes during object creation, after setting all properties.
function LimInf3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimInf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LimSup3_Callback(hObject, eventdata, handles)
% hObject    handle to LimSup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LimSup3 as text
%        str2double(get(hObject,'String')) returns contents of LimSup3 as a double


% --- Executes during object creation, after setting all properties.
function LimSup3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LimSup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Botton_FourierGraficar.
function Botton_FourierGraficar_Callback(hObject, eventdata, handles)
clc
if isempty(get(handles.Funcion1, 'string'))
  set(handles.Funcion1,'string',0);
end
if isempty(get(handles.LimInf1, 'string'))
  set(handles.LimInf1,'string',0);
end
if isempty(get(handles.LimSup1, 'string'))
  set(handles.LimSup1,'string',0);
end

if isempty(get(handles.Funcion2, 'string'))
  set(handles.Funcion2,'string',0);
end
if isempty(get(handles.LimInf2, 'string'))
  set(handles.LimInf2,'string',0);
end
if isempty(get(handles.LimSup2, 'string'))
  set(handles.LimSup2,'string',0);
end

if isempty(get(handles.Funcion3, 'string'))
  set(handles.Funcion3,'string',0);
end
if isempty(get(handles.LimInf3, 'string'))
  set(handles.LimInf3,'string',0);
end
if isempty(get(handles.LimSup3, 'string'))
  set(handles.LimSup3,'string',0);
end

syms t;
n = 1:str2num(get(handles.Armonicos,'string'));
T = str2num(get(handles.Periodo,'string'));
w0 = 2*pi/T;

xt1 = get(handles.Funcion1,'string');
xt2 = get(handles.Funcion2,'string');
xt3 = get(handles.Funcion3,'string');

a0 = (1/T)*(int(xt1,t,get(handles.LimInf1,'string'),str2num(get(handles.LimSup1,'string'))) + int(xt2,t,get(handles.LimInf2,'string'),str2num(get(handles.LimSup2,'string'))) + int(xt3,t,get(handles.LimInf3,'string'),str2num(get(handles.LimSup3,'string'))));
an = (2/T)*(int(xt1.*cos(n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*cos(n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*cos(n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
bn = (2/T)*(int(xt1.*sin(n*w0*t),t,str2num(get(handles.LimInf1,'string')),str2num(get(handles.LimSup1,'string'))) + int(xt2.*sin(n*w0*t),t,str2num(get(handles.LimInf2,'string')),str2num(get(handles.LimSup2,'string'))) + int(xt3.*sin(n*w0*t),t,str2num(get(handles.LimInf3,'string')),str2num(get(handles.LimSup3,'string'))));
u = ones(1,str2double(get(handles.Armonicos,'string')));
xt = an.*cos(n*w0*t) + bn.*sin(n*w0*t);
xt = dot(xt,u);
xt = a0 + xt;

t2 = 0:.1:20;
xt = subs(xt,t, t2);
plot(handles.Graficar,t2,xt);  


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tag_Callback(hObject, eventdata, handles)
close
Menu

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
winopen Fourier.txt
