# ns3-docker-ubuntu-focal
Dockerfile to build ns3.37 for Ubuntu 20.04 Focal Fossa

## Credits
largely borrowed from https://github.com/hygorjardim/ns3-docker which uses Ubuntu 16.04 

## Version
https://www.nsnam.org/release/ns-allinone-3.37.tar.bz2

## Before you start
Change the timezone in the Dockerfile if you like

## Building the image
You can build the docker image by running:
```
make build
```

To start the image, simply run:
```
make start
```

## Connect to the container
```docker exec -it ns3 bash```

## Testing the image
To make sure that it works, in the container run:

1. ``` cd ns-allinone-3.37/ns-3.37/ ```
2. ``` cp examples/tutorial/second.cc scratch/ ```
3. ``` ./ns3 scratch/second   ```

Expected output:

```
root@ubuntu20:/usr/ns-allinone-3.37/ns-3.37# ./ns3 run scratch/second
Scanning dependencies of target scratch_second
[  0%] Building CXX object scratch/CMakeFiles/scratch_second.dir/second.cc.o
[  0%] Linking CXX executable ../../build/scratch/ns3.37-second-default
At time +2s client sent 1024 bytes to 10.1.2.4 port 9
At time +2.0118s server received 1024 bytes from 10.1.1.1 port 49153
At time +2.0118s server sent 1024 bytes to 10.1.1.1 port 49153
At time +2.02161s client received 1024 bytes from 10.1.2.4 port 9
root@ubuntu20:/usr/ns-allinone-3.37/ns-3.37# 
```

## Testing the python bindings
To check if the python bindings were created and installed, run
1. ``` cd ns-allinone-3.37/ns-3.37/ ```
2. ``` python3 examples/wireless/mixed-wired-wireless.py ```


Expected output:

```
root@ubuntu20:/usr/ns-allinone-3.37/ns-3.37# python3 examples/wireless/mixed-wired-wireless.py
Enabling OLSR routing on all backbone nodes
Configuring local area network for backbone node  0
Configuring local area network for backbone node  1
Configuring local area network for backbone node  2
Configuring local area network for backbone node  3
Configuring local area network for backbone node  4
Configuring local area network for backbone node  5
Configuring local area network for backbone node  6
Configuring local area network for backbone node  7
Configuring local area network for backbone node  8
Configuring local area network for backbone node  9
Configuring wireless network for backbone node  0
Configuring wireless network for backbone node  1
Configuring wireless network for backbone node  2
Configuring wireless network for backbone node  3
Configuring wireless network for backbone node  4
Configuring wireless network for backbone node  5
Configuring wireless network for backbone node  6
Configuring wireless network for backbone node  7
Configuring wireless network for backbone node  8
Configuring wireless network for backbone node  9
Create Applications.
Configure Tracing.
Run Simulation.
root@ubuntu20:/usr/ns-allinone-3.37/ns-3.37# 
```

## License 

[MIT License](/LICENSE) © jgoff
