import socket, string, sys


if len(sys.argv) < 7 :
  print 'There should be 7 arguments'
  sys.exit(1)

SERVER = str(sys.argv[1])
PORT = int(sys.argv[2])
NICKNAME  = str(sys.argv[3])
CHANNEL  = str(sys.argv[4])
MESSAGE  = str(sys.argv[5])
NOJOIN = str(sys.argv[6])
CHANNEL = "#" + CHANNEL

#open a socket to handle the connection
IRC = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

#open a connection with the server
def irc_conn():
    IRC.connect((SERVER, PORT))

#simple function to send data through the socket
def send_data(command):
    IRC.send(command + '\n')

#join the channel
def join(channel):
    send_data("JOIN %s" % channel)

#send login data (customizable)
def login(nickname, username='user', password = None, realname='Pythonist', hostname='Helena', servername='Server'):
    send_data("USER %s %s %s %s" % (username, hostname, servername, realname))
    send_data("NICK " + nickname)

irc_conn()
login(NICKNAME)

if NOJOIN == False :
    join(CHANNEL)

keepRunning = True
while (keepRunning):
    buffer = IRC.recv(1024)
    msg = string.split(buffer)

    if msg[0] == "PING": #check if server have sent ping command
        send_data("PONG %s" % msg[1]) #answer with pong as per RFC 1459
    if msg [1] == 'JOIN':
        send_data("PRIVMSG " + CHANNEL + " : " + MESSAGE )
        keepRunning = False
