# irc-notify

Send a message to an IRC channel

## Options

### required

* `server` - The hostname or ip address of the IRC server.
* `port` - The port of the IRC server.
* `nickname` - The nickname of the user that sends the message.
* `channel` - The channel that the message will be send to.

### optional

* `passed-message` - Use this option to override the default passed message.
* `failed-message` -  Use this option to override the default failed message.
* `on` - Possible values: `always` and `failed`, default `always`

## Example


    build:
        after-steps:
         - wouter/irc-notify:
            server: irc.freenode.net
            port: 6667
            nickname: nick
            channel: chan

