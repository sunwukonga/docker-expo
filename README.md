# Disclaimer

This is a fork of [MaximeD,s docker-react-native](https://github.com/MaximeD/docker-react-native), which in turn was forked from [gilesp's react_native](https://github.com/gilesp/docker/tree/master/react_native).

# Usage

## Get image and build it

Clone and image build:
```
> git clone https://github.com/sunwukonga/docker-expo.git
> cd docker-expo

> docker build -t expo . 
```

Next you will need to have the two scripts available in your path. For example you can edit your `.bashrc` and add:
```
export PATH="$HOME/docker-expo:$PATH"
```
Note: CaptainObviousTip --> don't forget to replace $Home with your actual home directory.

## Clone BBB Expo App

Within docker-expo directory of host:
```
git clone https://github.com/sunwukonga/BBB.git
```

## Enter Docker Container

Connect to and enter docker container
```
> cd BBB
> expo-container.sh
```

## Run project from within *container*

You'll need your expo login credentials to do this.
```
dev> npm install
dev> exp start
```
