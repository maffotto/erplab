function varargout = grandaverager_DQ(varargin)
% GRANDAVERAGER_DQ MATLAB code for grandaverager_DQ.fig
%      GRANDAVERAGER_DQ, by itself, creates a new GRANDAVERAGER_DQ or raises the existing
%      singleton*.
%
%      H = GRANDAVERAGER_DQ returns the handle to a new GRANDAVERAGER_DQ or the handle to
%      the existing singleton*.
%
%      GRANDAVERAGER_DQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRANDAVERAGER_DQ.M with the given input arguments.
%
%      GRANDAVERAGER_DQ('Property','Value',...) creates a new GRANDAVERAGER_DQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grandaverager_DQ_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grandaverager_DQ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grandaverager_DQ

% Last Modified by GUIDE v2.5 23-May-2019 13:00:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grandaverager_DQ_OpeningFcn, ...
                   'gui_OutputFcn',  @grandaverager_DQ_OutputFcn, ...
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


% --- Executes just before grandaverager_DQ is made visible.
function grandaverager_DQ_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grandaverager_DQ (see VARARGIN)

% Choose default command line output for grandaverager_DQ
handles.output = hObject;

%set(handles.gui_chassis,'Name', 'Grand Averager - Custom DQ Measure Combo')



% Sort DQ in

% DQ out
handles.n_custom = 0;
handles.custom_DQ_list = [];
str0 = '';
set(handles.listbox_custom,'String',str0)


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes grandaverager_DQ wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grandaverager_DQ_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox_existing_DQ.
function listbox_existing_DQ_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_existing_DQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_existing_DQ contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_existing_DQ


% --- Executes during object creation, after setting all properties.
function listbox_existing_DQ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_existing_DQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox_combine_method.
function listbox_combine_method_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_combine_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_combine_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_combine_method


% --- Executes during object creation, after setting all properties.
function listbox_combine_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_combine_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_add.
function togglebutton_add_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_add

add_this = get(hObject,'Value');

if add_this
    
    
    old_list = cellstr(get(handles.listbox_custom,'String'));
    old_n = numel(old_list);
    
    measure_n = get(handles.listbox_existing_DQ,'Value');
    measure_cell = cellstr(get(handles.listbox_existing_DQ,'String'));
    measure_str = measure_cell{measure_n};
    
    comb_n = get(handles.listbox_combine_method,'Value');
    comb_cell = cellstr(get(handles.listbox_combine_method,'String'));
    comb_str = comb_cell{comb_n};
    
    str_here = [measure_str ' ' comb_str];
    
    
    if isempty(old_list) || isempty(old_list{1})
        old_list{old_n} = str_here;
        handles.n_custom = handles.n_custom + 1;
        n = handles.n_custom;
    else
        
        old_list{old_n+1} = str_here;
        handles.n_custom = handles.n_custom + 1;
        n = handles.n_custom;
    end
    
    new_list = old_list;
    set(handles.listbox_custom,'String',new_list);
    
    pause(0.1);
    set(handles.togglebutton_add,'Value',0)
else
    % already down   
    pause(0.1);
    set(handles.togglebutton_add,'Value',0)
end


% Update handles structure
guidata(hObject, handles);




% --- Executes on selection change in listbox_custom.
function listbox_custom_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_custom contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_custom


% --- Executes during object creation, after setting all properties.
function listbox_custom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_remove.
function togglebutton_remove_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_remove

remove1 = get(hObject,'Value');

if remove1
    
    measure_n = get(handles.listbox_custom,'Value');
    measure_cell = cellstr(get(handles.listbox_custom,'String'));
    
    measure_cell(measure_n) = [];
    
    if isempty(measure_cell)
        measure_cell{1} = '';
    end
    
    set(handles.listbox_custom,'String',measure_cell);
    
    disp_txt = ['Custom entry ' num2str(measure_n) ' removed'];
    pause(0.1);
    set(handles.togglebutton_remove,'Value',0)
else
     % already down   
    pause(0.1);
    set(handles.togglebutton_remove,'Value',0)
end
    
