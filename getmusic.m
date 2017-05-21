function getmusic(score,beat,name,amp,leng)   % amp: music amplitude (standard: 1)  % leng: length of beat (standard: 1)
A4=440;                           % standard pitch
sf=44100;                         % sampling frequency
p0=sf/2;
ET12=A4/2^(9/12)*2.^((0:11)/12);  % 12-ET
map=[1 3 5 6 8 10 12];            % map the score digit to the digit applied to 12-ET 
interv=zeros(1,2000);             % zero interval between notes
m=[];                             % initial music data
for i=1:length(score)
    m=[m,interv,amp*sin((1:leng*beat(i)*p0)/sf*2*pi*ET12(map(score(i))))];
end
audiowrite([name,'.wav'],m,sf)    % export the wav. file
end