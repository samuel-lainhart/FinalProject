function [] = morePowahBabeh()

%I just wanna go fast

close all;

global gui;

gui.fig = figure(); %main graph

gui.p = plot(0,0);

gui.p.Parent.Position = [0.2 0.25 0.7 0.7];
%added a "box" for my buttons
gui.buttonGroup = uibuttongroup('visible','on','unit','normalized','position',[0 0.25 .15 .2],'selectionchangedfcn',{@radioSelect});
%I added buttons to switch between diff power types
gui.r1 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .7 1 .2],'handleVisibility','off','string','Horsepower');

gui.r2 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .15 1 .2],'handleVisibility','off','string','Kilowatts');
%in an ideal world we'd use this scroll bar to navigate RPM powerbands.
gui.scrollBar = uicontrol('style','slider','units','normalized','position',[0.2 0.075 0.7 0.05],'value',1,'min',1,'max',8,'sliderstep',[1/8 1/8],'callback',{@scrollbar});

gui.animateButton = uicontrol('style','pushbutton','units','normalized','position',[0.025 .05 .1 .1],'string','Animate','callback',{@animate});

scrollbar();

end

function [] = buttonPlot(~,~)

%figure window
fig = uifigure;

%UI axes
ax = uiaxes('Parent',fig,'Units','pixels','Position', [0.2 0.25 0.7 0.7]);   

%push button
btn = uibutton(fig,'push','Position',[0.2 0.25 0.7 0.7],'ButtonPushedFcn', @(btn,event) plotButtonPushed(btn,ax));
end


function plotButtonPushed(btn,ax) %ButtonPushedFcn callback
        x = linspace(0,2*pi,100);
        y = sin(x);
        plot(ax,x,y)
end

function [] = animate(~,~) %animation for graph
    global gui;
    for i = 1:6
        gui.scrollBar.Value = i;
        scrollbar();
        pause(1);
    end
end

function [] = scrollbar(~,~) %allows...well scrolling
    global gui;
    gui.scrollBar.Value = round(gui.scrollbar.Value);
    type = gui.buttonGroup.SelectedObject.String;
    plotSelectedPowahBabeh(type);
end

function [] = radioSelect(~,~) %radio select function
    global gui;
        type = gui.buttonGroup.SelectedObject.String;
    plotSelectedPowahBabeh(type);
end

function [] = plotSelectedPowahBabeh(type)
    global gui;
    %data = readmatrix('Engine Data.csv');
    %PowahListing = data{:,1};
    %displacement = data{:,2};
    title('Estimated Powah Babeh');
    RPM = gui.scrollBar.Value;
  HorsePower = (RPM * Torque)/ 5250 %magic equation to get our ponies in a row.
    if ~strcmp(type,'Killowatts')
        Killowatts = (HorsePower * 0.745699872); % equation to convert from herspers to killerwerts
   
    end
    
    %title(['Estimated Powah Babeh']); 
        end


