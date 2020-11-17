%% Opening files
clearvars -except A structCreated j
load('FileName');


Fs = 1/Signal_0.x_values.increment; 
time = 0:1/Fs:(Signal_0.x_values.number_of_values-1)/Fs;
SignalName = Signal_0.function_record.name;
Names = string(zeros(1,length(SignalName)));

y = zeros(length(Signal_0.y_values.values),length(SignalName));

for i = 1:length(SignalName)
    Names(:,i) = string((SignalName{1,i}'));
    y(:,i) = Signal_0.y_values.values(:,i);
end

yMax = max([max(y) abs(min(y))]);

%%
structCreated = false;

%% Plots

% for i = 1:length(SignalName)
%     subplot(floor(length(SignalName)/2),round(length(SignalName)/2),i)
%     plot(time, y(:,i)), title(Names(i)); 
%     xlabel('time (s)');
%     ylabel('Amplitude (RMS)');
%     ylim([-yMax,yMax]);
%     xlim([0 max(time)]);
% end

%% Audios
for i = 1:length(SignalName)
    p(i) = audioplayer(y(:,i)/yMax,Fs);
end

%% Struct
if structCreated == false
    A.A1 = p;
    structCreated = true;
    j = 1;
else
    j=j+1;
    eval(['A.A' num2str(j) '= p']);    
end
%% Clear Struct
clear A j
structCreated = false;

