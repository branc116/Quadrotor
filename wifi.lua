function stringStarts(a,b)
    return string.sub(a,1,string.len(b))==b
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
    print("Connected")
    
    conn:on("receive",receiveData)
    conn:on("disconnection",function(c) 
        print("Disconnected")
    end)
    
end)
