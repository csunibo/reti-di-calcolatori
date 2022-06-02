# Import socket module
from socket import * 

# Create a UDP server socket
#(AF_INET is used for IPv4 protocols)
#(SOCK_DGRAM is used for UDP)
serverSocket = socket(AF_INET, SOCK_DGRAM)

# Assign a server port number
serverPort = 12001

# Bind the socket to server address and server port
serverSocket.bind(("", serverPort))

# Server should be up and running and listening to the incoming connections
print('The server is ready to receive')

while True:
   # Receives the request message from the client
   message, clientAddress = serverSocket.recvfrom(2048)
   print("client address:", clientAddress)
   modifiedMessage = message.decode().upper()
   print(modifiedMessage)
   serverSocket.sendto(modifiedMessage.encode(), clientAddress)

