function [] = morePowahBabeh()
%I just wanna go fast
close all;
global gui;
gui.fig = figure();
gui.p = plot(0,0);
gui.p.Parent.Position = [0.2 0.25 0.7 0.7];

gui.buttonGroup = uibuttongroup('visible','on','unit','normalized','position',[0 0.25 .15 .2],'selectionchangedfcn',{@radioSelect});
gui.r1 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .7 1 .2],'handleVisibility','off','string','Horsepower');
gui.r2 = uicontrol(gui.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .15 1 .2],'handleVisibility','off','string','Kilowatts');


gui.scrollBar = uicontrol('style','slider','units','normalized','position',[0.2 0.075 0.7 0.05],'value',1,'min',1,'max',12,'sliderstep',[1/11 1/11],'callback',{@scrollbar});
%scrollbar();
gui.animateButton = uicontrol('style','pushbutton','units','normalized','position',[0.025 .05 .1 .1],'string','Animate','callback',{@animate});

end

function [] = animate(~,~)
    global gui;
    for i = 1:12
        gui.scrollBar.Value = i;
        scrollbar();
        pause(1);
    end
end

function [] = scrollbar(~,~)
    global gui;
    gui.scrollBar.Value = round(gui.scrollbar.Value);
    type = gui.buttonGroup.SelectedObject.String;
    plotSelectedPowahBabeh(type);
end

function [] = radioSelect(~,~)
    global gui;
        type = gui.buttonGroup.SelectedObject.String;
    plotSelectedPowahBabeh(type);
end

function [] = plotSelectedPowahBabeh(type)
    global gui;
    data = readmatrix('Engine Data.csv');
    monthListing = data{:,1};
    temps = data{:,2};
    
    rpm = gui.scrollBar.Value;
  % monthTemps = temps(monthListing -- rpm);
  HorsePower = (RPM * (EngineVolume + Cylinders))/ 5250
    if ~strcmp(type,'Killowatts')
        Killowatts = (HorsePower * 0.745699872);
   
    end
    
    title(['Estimated Powah Babeh' monthString]);
        end


