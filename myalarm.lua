safety=true
tmr.alarm(0,20,1,function()
   if safety == false then
    for i=1,4 do
        if PinValue[PinSort[i ] ]>99 then
            gpio.write(chPin[PinSort[i ] ],gpio.HIGH)
        else   
            gpio.write(chPin[PinSort[i ] ],gpio.LOW)   
          end
    end
    if PinValue[PinSort[1 ] ]<100 then
        tmr.delay(9001-PinValue[PinSort[1 ] ]*90)
    end
    if PinValue[PinSort[1 ] ] >1 then
        gpio.write(chPin[PinSort[1 ] ] ,gpio.HIGH)
    end
    for i=2,4 do
        newDelay=((PinValue[PinSort[i-1] ]-PinValue[PinSort[i] ])*90)
        if newDelay>0 then
            tmr.delay(newDelay)
        end
        if PinValue[PinSort[i ] ]>1 then
            gpio.write(chPin[PinSort[i ] ] ,gpio.HIGH)         
        end
    end
  else
    for i=1,4 do
        gpio.write(chPin[i],gpio.LOW)
    end
  end
end)
