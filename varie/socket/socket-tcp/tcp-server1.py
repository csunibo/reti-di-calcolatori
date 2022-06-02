# Import socket module
from socket import * 

# Create a UDP server socket
#(AF_INET is used for IPv4 protocols)
#(SOCK_DGRAM is used for UDP)
tcpServerSocket = socket(AF_INET, SOCK_STREAM)

# Assign a server port number
serverPort = 12001

# Bind the socket to server address and server port (on local machine only)
tcpServerSocket.bind(("", serverPort))

# start listening on welcoming socket queueing max 1 connection at a time (others refused)
tcpServerSocket.listen(1)

# Server should be up and running and listening to the incoming connections
print('The server is ready to receive')

while True:
   tcpConnectedClientSocket, addr = tcpServerSocket.accept()
   print('Received a client connection from:', addr)

   # Receives the request message from the client. Note the recv() vs. recvfrom()
   message = tcpConnectedClientSocket.recv(2048).decode()
   modifiedMessage = message.upper()
   print(modifiedMessage)
   # sends the modified message to the client. Note the send() vs. sendto()
   tcpConnectedClientSocket.send(modifiedMessage.encode())

   tcpConnectedClientSocket.close()
