import requests
import hashlib
path="http://docker.hackthebox.eu:32401/"
s=requests.Session()
#get it
out=s.get(path).text
bda=out.find("<h3 align='center'>")
sali=out.find("</h3>")
#find it
tohash=out[bda+19:sali].encode('utf-8')
#hash it
hash=hashlib.md5(tohash).hexdigest()
#send it
data={'hash': hash}
req=s.post(url=path,data=data)
#get it
print(req.text)