yaml_file='H:/Users/Jack/Source/Repos/BraitenbergSimulator/BraitenbergSimulator/BraitenbergSimulator/yaml/testScene.yaml';
csv_file ='H:/Users/Jack/Source/Repos/BraitenbergSimulator/BraitenbergSimulator/BraitenbergSimulator/logs/testVehicle201641-1245.csv';
SceneStruct = yaml.ReadYaml(yaml_file);

% get light position
list=  SceneStruct.lights;
centres = [];
radii = [];
for f = 1 : 1 : size(list,2)
    cell = strcat('SceneStruct.',list(1,f));
    LightStruct = eval(cell{1});
    position = LightStruct.position;
    radius = LightStruct.radius;
    x_loc = position{1};
    y_loc = position{2};
    centres = cat(1,centres, [x_loc,y_loc]);
    radii = cat(1,radii,radius);
end

%get vehicle track
fileID = fopen(csv_file);
vehicleCSV = textscan(fileID, '%s %s %s %s %s %s','delimiter', ',', 'CollectOutput',1);
fclose(fileID);

vehicleTrackData = csvread(csv_file,1,1);

eventColumn = vehicleCSV{1}(:,1);
indices = find(strcmp(eventColumn, 'B'));

figure;
hold on;
%plot light positions
viscircles(centres,radii);

%plot vehicle track
val = 1;
if(size(indices,1) > 0)
    for b = 1 : 1: size(indices,1)
        datax = vehicleTrackData(val : indices(b)-2,3);
        datay = vehicleTrackData(val : indices(b)-2,2);
        %ax = gca;
        %ax.ColorOrderIndex = 1;
        plot(datax,datay);

        if (b + 1) > size(indices,1)
            val = indices(b)-1;
        else
            val = indices(b);
        end
    end
else
    plot(vehicleTrackData(:,2),vehicleTrackData(:,3));
end

title(strcat(SceneStruct.name, ' coverage plot'));
axis square;
axis([-50,50,-50,50]);