import socket

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect(("localhost", 8005))
    print(s.recv(1024))
    s.sendall(b"PLAYER_LIST @replace-me@#")
    print(s.recv(1024))
