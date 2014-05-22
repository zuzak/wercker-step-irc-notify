# irc-notify

Send a message to an IRC channel
[![wercker status](https://app.wercker.com/status/5c75d503aaeeb2904559b756dae44eb3/ "wercker status")](https://app.wercker.com/project/bykey/5c75d503aaeeb2904559b756dae44eb3)

## Options

### required

* `server` - The hostname or ip address of the IRC server.
* `port` - The port of the IRC server.
* `nickname` - The nickname of the user that sends the message.
* `channel` - The channel that the message will be send to. Do not include '#' sign.

### optional

* `passed-message` - Use this option to override the default passed message.
* `failed-message` -  Use this option to override the default failed message.
* `on` - Possible values: `always` and `failed`, default `always`
* `nojoin` - Set this option to true to prevent the bot joining the channel.
  `-n` often needs to be set in the channel for this to work.

## Example


    build:
        after-steps:
         - zuzak/wercker-step-irc-notify:
            server: irc.freenode.net
            port: 6667
            nickname: yournickname
            channel: yourchannel

