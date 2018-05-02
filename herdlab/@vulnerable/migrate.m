function [agt]=migrate(agt,cn)

global ENV_DATA IT_STATS STEP_NUM PARAM

migrated = false;
pos = agt.pos;
spd = PARAM.VULN_SPEED;
size = ENV_DATA.size;

cnt=1;
dir=rand*2*pi;
while ~migrated && cnt<=8
    npos(1) = pos(1)+spd*cos(dir);
    npos(2) = pos(2)+spd*sin(dir);
    if npos(1)<size && npos(2)<size && npos(1)>=1 && npos(2)>=1
        migrated=true;
    end
    cnt = cnt+1;
    dir = dir+(pi/4);
    
end

if migrated
    agt.pos = npos;
    IT_STATS.migrations(STEP_NUM+1) = IT_STATS.migrations(STEP_NUM+1) + 1;
end