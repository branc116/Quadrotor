# Quadrotor
Quadrotor made with esp8266 with nodeMCU and lua

For this quad you will need:
* esp8266 esp-12 with nodeMCU framework
* 4 motors 
* 4 pwms 
* Android phone
* RoboRemo App
* Pvc
* 3.7v LiPo battery with 3c rating or more

To make it work you'll have to:
* Make an more or less symmetrical case 
* Put motors, battery, esp and pwms in case
* Connect ESP with pwms
* Connect pwms to motors
* Open export of a layout of a controler on you phone with RoboRemo app
* Push all the .lua files to your esp
* fly

My didn't work becouse I connected my motors to 7.2v and one of the motors burned...

But I think software is more or less stable.

Maybe in future I'll add gyro to make the flight more stable, but the problem is the heap memory on the esp...
One can't put a lot of code on a esp.
Maybe when the esp32 comes out I'll be able to make it work, who knows...


