wifi.setmode(wifi.SOFTAP)

cfg={}
cfg.ssid="mywifi"
cfg.pwd="qwerty123"
cfg.ip="192.168.0.1"
cfg.netmask="255.255.255.0"
cfg.gateway="192.168.0.1"

port = 9876
wifi.ap.setip(cfg)
wifi.ap.config(cfg)
cnf=nil
cmd = ""
chCount = 4
chPin = {6, 1, 2, 5} -- 12, 5, 4, 14
PinValue = {0,0,0,0}
PinSort = {1,2,3,4}
brojac = 0

for i=1, chCount do
    gpio.mode(chPin[i],gpio.OUTPUT)
    gpio.write(chPin[i],gpio.LOW)
end

function stringStarts(a,b)
    return string.sub(a,1,string.len(b))==b
end
function mysort()
    for i=1,4 do
        for j=i+1,4 do
            if PinValue[i]>PinValue[j] then
                PinSort[j]=temp
             end
         end
    end
end
function exeCmd(st)
    comand = string.sub(st,1,1)
    if comand == '~' then        
        b = string.sub(st,3,3)-'0'
        gpio.write(chPin[b],gpio.LOW)
    elseif comand=='m' then    
        b = string.sub(st,2,2)-'0'
        gpio.write(chPin[b],gpio.HIGH)        
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
            print(i..". Value: "..PinValue[i]..", Sort: "..PinSort[i].."\n")
        end    
    end   
end
function receiveData(conn, data)
    cmd = cmd .. data
    --print(cmd)
    local a, b = string.find(cmd, "\n", 1, true)   
    while a do
        exeCmd(string.sub(cmd, 1, a-1) )
        cmd = string.sub(cmd, a+1, string.len(cmd))
        a, b = string.find(cmd, "\n", 1, true)
    end
end
srv=net.createServer(net.TCP, port) 
srv:listen(port,function(conn)
    print("RoboRemo connected000")
    
    conn:on("receive",receiveData)
    
    
    conn:on("disconnection",function(c) 
        print("RoboRemo disconnected")
    end)
    
end)
tmr.alarm(0,20,1,function()
   
   for i=1,4 do
      if PinValue[i]>99 then
        gpio.write(chPin[i],gpio.HIGH)
      else   
        gpio.write(chPin[i],gpio.LOW)   
      end
   end
   tmr.delay(9001-PinValue[1]*90)
   for i=1,4 do
       if PinValue[i]>1 then
        gpio.write(chPin[i],gpio.HIGH)    
       end
   end
   
end)
