# Disclaimer

This is a fork of [MaximeD,s docker-react-native](https://github.com/MaximeD/docker-react-native), which in turn was forked from [gilesp's react_native](https://github.com/gilesp/docker/tree/master/react_native).

# Usage

## Get image

Usual clone and image install:
```
> git clone https://github.com/sunwukonga/docker-react-native.git
> cd docker-react-native

> docker build -t react-native .
```

Next you will need to have the two scripts available in your path. For example you can edit your `.bashrc` and add:
```
export PATH="$HOME/docker-react-native:$PATH"
```
Note: CaptainObviousTip --> don't forget to replace $Home with your actual home directory.

## Clone BBBargains App

Within docker-react-native directory of host:
```
git clone https://github.com/sunwukonga/BBBargainsApp.git
```

## Enter Docker Container

Connect to docker container and install missing packages
```
> cd BBBargainsApp
> react-native-container.sh
```

Install node packages
```
dev> yarn
dev> cd node_modules/react-native
dev> yarn
```

## Run project

### Setup routing to host, start log, run on android
Inside docker container (Android):
```
dev> adb reverse tcp:8081 tcp:8081
dev> react-native start > react-start.log 2>&1 &
dev> react-native run-android
```

### Hot reload

```
dev> watchman watch .
```


To enable it on your phone, shake it (or better yet type ./shake.sh in terminal), and select `Enable Hot Reloading`.

*I've never had to do the following, but it was in the original instructions:*

You will also need to access `Dev Settings > Debug server host & port for device`
and enter `localhost:8081`.

# Install udev rules

*Again, I never had to do the following on my own system:*

On your host system, you'll need to install the android udev rules if you want to connect your phone or tablet via USB and deploy the react native app directly to it. You can get the rules from http://source.android.com/source/51-android.rules and you can install them as follows:

```
wget -S -O - http://source.android.com/source/51-android.rules | sed "s/<username>/$USER/" | sudo tee >/dev/null /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
```
