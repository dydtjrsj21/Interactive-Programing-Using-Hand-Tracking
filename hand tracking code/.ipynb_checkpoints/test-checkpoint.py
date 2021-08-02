{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import socket \n",
    "HOST = '127.0.0.1' \n",
    "PORT = 3030 \n",
    "s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) \n",
    "s.bind((HOST, PORT)) \n",
    "s.listen(1) \n",
    "conn, addr = s.accept() \n",
    "print('Connected by', addr)\n",
    "while True: \n",
    "    data = conn.recv(1024).decode() \n",
    "    if not data: break \n",
    "    kk = str(data) + ' world!' \n",
    "    conn.send(kk.encode()) \n",
    "conn.close()\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
