function masterFunction()
% pb=0.1;pd=0;riv=[-5,-2,-0.5,0.5,2,5];ele=0;
% pb=0.09;pd=0.004;riv=[-5,-2,-0.5,0.5,2,5];ele=3.98;
% pb=0.09275906519;pd=0.0039211715138;riv=0.03284381407;ele=3.974896932;
% pb=0.1;pd=0.01;riv=5;ele=500;time=2500;popSize=250000;

% % % % % % % %Coweeta and other structures % % % % % % %
% shapefile='Coweeta\coweetaProject.shp';%'SF_Files\SF11\SF11.shp';
% tifFile='Coweeta\coweeta1.tif';%'SF_Files\SF11\sf11_landscape.tif';
% fileHolder='CoweetaTestCase\';
% for filenumber=1%:11
% %     
% % for iteration=1:5
% % shapefile=strcat('SF2020\Shapefiles\SF2020_SF', num2str(filenumber), '.shp');%'SF_Files\SF11\SF11.shp';
% % tifFile=strcat('SF2020\SF2020_sf', num2str(filenumber), '_landscape.tif');%'SF_Files\SF11\sf11_landscape.tif';
% % tifFile=strcat('SF2020\SF1_10mLand.tif');
% % fileHolder='SF2020TestCase\';
% % load([fileHolder '\Images\' 'Coweeta_Pb_0.092759,Pd_0.0039212,Ele_3.9749,Riv_-5.mat'],'Images')
% % for run=1:size(riv,2)
% % name=['SF' num2str(filenumber) '_Pb_' num2str(pb) ',Pd_' num2str(pd) ',Ele_' num2str(ele) ',Riv_' num2str(riv(run)) '_iteration_' num2str(iteration) '.mat']; % % % % % % % % % % % % % %
% name=['Coweeta_Pb_' num2str(pb) ',Pd_' num2str(pd) ',Ele_' num2str(ele) ',Riv_' num2str(riv(run)) ',iteration_' num2str(iteration) '.mat']; % % % % % % % % % % % % % %
% % 
% % name=['SF2020_sf8_landscapeTestCase_Pb_' num2str(pb) ',Pd_' num2str(pd) ',Ele_' num2str(ele) ',Riv_' num2str(riv(run)) '.mat']; % % % % % % % % % % % % % %
% MainScriptNew(shapefile,tifFile,pb,pd,1,1,7,riv(run),1,ele,name,fileHolder); %
% % % % % % % load([fileHolder name]); % % % % % % %
% % [images]=FrancescoGifGeneratorComputer(name, fileHolder,shapefile,tifFile); % % % % % % %
% % name2=strcat(fileHolder,name); % % % % % % %
% % VideoMakerTest(images,name2); % % % % % % %
% % gausspopdens(1,1,name,fileHolder) % % % % % % %
% % [MEDIANDeath,MEANIEDeath,STANDIVDeath,MEDIAN,MEANIE,STANDIV]=dispKcalclallIndividual(name,fileHolder);
% % % % % % % %
% % [riverMedian,riverMean,riverSD,TP]=riverdistanceallIndividual(fileHolder,name,1,shapefile,tifFile,1);
% % TAll{iteration,run}(1:6)=[MEDIANDeath,MEANIEDeath,STANDIVDeath,MEDIAN,MEANIE,STANDIV];
% % load(name2,'deathInformation');
% % TAll{iteration,run}(10:14)=[pb,pd,ele,riv(run),size(deathInformation,1)];
% % TAll{iteration,run}(7:9)=[riverMedian,riverMean,riverSD];
% % TPAll{iteration,run}=TP; 
% % trans_prob_fig_script(name,fileHolder,TP,shapefile);
% % Images{run}=images;
% % end
% % save([fileHolder '\Images\' name],'Images','-v7.3');
% % save([fileHolder 'AllInfo' name],'-v7.3');
% % end
% % end
%----------------------------------------------------------------------------------------------------
% %Idealized and Subsections
% [filenameholder]=Idealized_Geometry_Generator(1,250,1,0,'West_SouthWest_Connections');
fileHolder='IdealRunsTest\';
% load([fileHolder 'West_SouthWest_Connections_size_1x250_width_1_buffer_0'])

% filenameholder='IdealizedGeometries\Tilted_Trough_size_1001x1001_width_20_buffer_50';
%%%%% Interchange Wedge for Trough or Tilted_Trough in all places to change
%%%%% shape

%%%%% Code to generate Wedge Run.
%%%%% (pb,pd,nmoves,altprobcoeff,type,upcoeff,probtype,bias)
%%%%#3rd to last=upcoeff()=gridType(5)<--River, last=bias()<---Ele
% %%%%% Generate Ideal Sim runs
%%%%%pb=0.09;pd=0.004;riv=[-5,-2,-0.5,0.5,2,5];ele=3.98;
pb=0.09;pd=0.004;
%river vals%
a=[-5,-2,-0.5,0.5,2,5];
%ele vals%
b=[3.98];
gridTypeNames={'Wedge','Trough','Tilted_Trough'};
lattitude=1001;
longitude=1001;
count=1;
for gridTypeStyle=2%:-1:1
for width=20%:-10:0
    idealLandGridName=strcat(gridTypeNames{gridTypeStyle}, '_size_', num2str(lattitude), 'x', num2str(longitude), '_width_', num2str(width),  '_buffer_', num2str(50));
    Idealized_Geometry_Generator(lattitude,longitude,width,gridTypeStyle,idealLandGridName)
for i=1:6
    for j=1%:2
        filename=strcat('Pb_',num2str(pb),',Pd_',num2str(pd),',Ele_',num2str(b(j)),',Riv_',num2str(a(i)),'.mat');
        [filenameholder,filename,River,Elevation]=PreIdealTiltedMainScript(pb,pd,1,1,2,a(i),1,b(j),filename,fileHolder,width,gridTypeNames{gridTypeStyle},idealLandGridName);

        
        
        
        % %         fileName=strcat('West_SouthWest_Connections_size_1x250_width_1_buffer_0_Riv_', num2str(a(i)), '_Ele_', num2str(b(j)), '.mat');
%         fileName=strcat('West_SouthWest_Connections_size_1x250_width_1_buffer_0_Riv_', num2str(riv), '_Ele_', num2str(ele),',Run_',num2str(run), '.mat');
% %         IdealizedMainScript(River,Elevation,pb,pd,1,1,2,a(i),1,b(j),Coordinates,fileName,fileHolder)
%         IdealizedMainScript(River,Elevation,pb,pd,1,1,2,riv,1,ele,Coordinates,fileName,fileHolder,time,popSize)
%         
%         % %%%%% Code to load instead of generating new run
%         % simulationFileName='IdealizedGeometries\East_SouthEast_Connections_size_1x250_width_1_buffer_0_upcoeff_-100000_bias_-100000.mat';
%         load([fileHolder fileName])
%         
% %         fileHolder='IdealizedGeometries\West_SouthWest_Connections\';
%         landname='West_SouthWest_Connections_size_1x250_width_1_buffer_0';
%         % %%%%%Use to generate a gif 
% %         fileList = dir([fileHolder landname '_upcoeff*100_bias*.mat']); 
% %         numfile=length(fileList); 
% %         for file=1:numfile
% %             filename=fileList(file).name(1:end-4);
% %             filename2=strcat(fileHolder, filename); load([filename2 '.mat']); 
% load([fileHolder landname '.mat'],'River','Elevation','Coordinates'); 
% %             surf(Elevation)
%         name2=strcat(fileHolder,fileName);
[images] = FrancescoIdealGifGenerator(River,Elevation,filenameholder);
          save([fileHolder '\Images\' filename],'images','-v7.3');
          name=strcat(fileHolder, 'Images\', filename);
          VideoMakerTest(images,name)
%         end
        
        % %%%%Use to Compute and display Gaussian
%         gausspopdensIdeal(1,1,simulationFileName,filenameholder)
        
        %%%%%Compute the L2 norms
        [MEDIANDeath,MEANIEDeath,STANDIVDeath,MEDIAN,MEANIE,STANDIV]=dispKcalclallIndividual(filename,fileHolder);
%         [riverMedian,riverMean,riverSD]=riverdistanceallIndividual(fileHolder,filename,1,'Coweeta/coweetaProject.shp','Coweeta/coweeta1.tif',1);
        TAll{1,count}(1:6)=[MEDIANDeath,MEANIEDeath,STANDIVDeath,MEDIAN,MEANIE,STANDIV];
        count=count+1;
    end
end
end
save([fileHolder 'IdealLandscapesTAll.mat'],'TAll','-v7.3')
end
% FrancescoGifGenerator()
% Gauss=zeros(size(gaussall,1),size(gaussall,2));
% for j=1:1:size(gaussall,1)
%     Gauss(j,:)=gaussall(size(gaussall,1)-j+1,:);
% end
% imagesc(Gauss)

