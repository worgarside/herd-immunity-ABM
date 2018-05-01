function [agt]=migrate(agt,cn)

%migration functions for class RABBIT
%agt=vaccinated object
%cn - current agent number

%SUMMARY OF RABBIT MIGRATE RULE
%Rabbits will migrate only if they have not eaten
%Rabbits will always try to migrate towards the nearest food source
%The vaccinated will extract the distibution of food in its LOCAL environment (at
%distances < its daily migration limit)
%It will identify the location of the nearest food and migrate into it.
%It's new position will be randomly placed within this square
%If no food is detected within its search radius it will move randomly (up
%to 8 atempts without leaving the model edge)

global ENV_DATA IT_STATS N_IT
%N_IT is current iteration number
%IT_STATS is data structure containing statistics on model at each
%iteration (no. agents etc)
%interpolated to each grid point
%ENV_DATA is a data structure containing information about the model
%environment
%    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
%    ENV_DATA.units - FIXED AS KM
%    ENV_DATA.bm_size - length of environment edge in km
%    ENV_DATA.food is  a bm_size x bm_size array containing distribution
%    of food

mig=0;                               %indicates whether vaccinated has successfully migrated
pos=agt.pos;                         %extract current position
spd=5;                       %vaccinated migration speed in units per iteration - this is equal to the food search radius

cnt=1;
dir=rand*2*pi;
while mig==0&&cnt<=8
    npos(1)=pos(1)+spd*cos(dir);        %new x co-ordinate
    npos(2)=pos(2)+spd*sin(dir);        %new y co-ordinate
    if npos(1)<ENV_DATA.bm_size&&npos(2)<ENV_DATA.bm_size&&npos(1)>=1&&npos(2)>=1   %check that infected has not left edge of model - correct if so.
        mig=1;
    end
    cnt=cnt+1;
    dir=dir+(pi/4);         %if migration not successful, then increment direction by 45 degrees and try again
    
end

if mig==1
    agt.pos=npos;                                   %update agent memory
    IT_STATS.mig(N_IT+1)=IT_STATS.mig(N_IT+1)+1;    %update model statistics
end