function exeCmd(st)
    comand = string.sub(st,1,1)
    if comand == '~' then        
        b = string.sub(st,3,3)-'0'
        PinValue[b]=0
        mysort()
    elseif comand=='m' then    
        b = string.sub(st,2,2)-'0'
        PinValue[b]=100
        mysort()
    elseif comand=='s' then
        b=tonumber(string.sub(st,3,string.len(st)))
        index = tonumber(string.sub(st,2,2))
        if index== 0 then
            for i=1,4 do
                PinValue[i]=b
            end
        else
            PinValue[index]=b
            mysort()
        end 
    elseif comand == '?' then
        for i=1,4 do
            print(i..". Value: "..PinValue[i]..", Sort: "..PinSort[i])
        end    
        print("\n\n")
    end   
end
