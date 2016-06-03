function mysort()
    bil = {false,false,false,false}
    for i=1,4 do
        temp=1
        for j=1,4 do
            if PinValue[i]<PinValue[j] then
                temp=temp+1
            end
        end
        while bil[temp] do
            temp=temp + 1
        end
        bil[temp]=true
        PinSort[i]=temp
    end
    tempo={1,1,1,1}
    for i=1,4 do
        tempo[PinSort[i ] ]=i
    end
    PinSort=tempo
    bil=nil
end
