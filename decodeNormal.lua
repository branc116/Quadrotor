PressLoc = {0,0}
power=0
function exeCmd(st)
    --pr,dr,rl,of,on,db,pw
    comand = string.sub(st,1,2)
    
    if comand == "pr" then
        PressLoc[1] = tonumber(string.sub(st,4,6))
        PressLoc[2] = tonumber(string.sub(st,8,10))
        print ("pr: ".. st)
    elseif comand == "dr" then
        dX=PressLoc[1]-tonumber(string.sub(st,4,6))
        dY=PressLoc[2]-tonumber(string.sub(st,8,10))
        PinValue[1]=power-(-dX-dY)/4
        PinValue[2]=power-(dX-dY)/4
        PinValue[3]=power-(dX+dY)/4
        PinValue[4]=power-(-dX+dY)/4
        mysort()
    elseif comand == "rl" then
            for i=1,4 do
                PinValue[i]=power
            end
    elseif comand == "of" then
        safety=true
    elseif comand == "on" then
        safety=false
    elseif comand == "db" then
        for i=1,4 do
            print(i..". Value: "..PinValue[i]..", Sort: "..PinSort[i])
        end    
        print("\n\n")
    elseif comand == "pw" then
            power=tonumber(string.sub(st,3,string.len(st)))
            for i=1,4 do
                PinValue[i]=power
            end
    end
    
end
