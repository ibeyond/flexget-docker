Last login: Sun Feb 23 17:41:57 on ttys000
songqingjie@songqingjies-MacBook-Air ~ % ssh songqingjie@192.168.123.100
songqingjie@192.168.123.100's password: 
[songqingjie@QNAP ~]$ ls                            
backupdata.tar	backup.sql  Camera Uploads/  docker/  @Recycle@  sbin/	Share/
[songqingjie@QNAP ~]$ cd docker/
[songqingjie@QNAP docker]$ ls
flexget-docker/
[songqingjie@QNAP docker]$ cd flexget-docker/
[songqingjie@QNAP flexget-docker]$ ls
Dockerfile
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .         
Sending build context to Docker daemon   2.56kB
Step 1/7 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/7 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/7 : RUN pip3 install --upgrade wheel setuptools     && pip3 install -I flexget
 ---> Running in 7cebafd043d7
Collecting wheel
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7f870620f240>, 'Connection to pypi.org timed out. (connect timeout=15)')': /simple/wheel/
  Retrying (Retry(total=3, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7f87061d75f8>, 'Connection to pypi.org timed out. (connect timeout=15)')': /simple/wheel/
  Retrying (Retry(total=2, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7f87061d7320>, 'Connection to pypi.org timed out. (connect timeout=15)')': /simple/wheel/
^C
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/7 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/7 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/7 : RUN pip3 install --upgrade wheel setuptools     && pip3 install -I flexget
 ---> Running in b5b4ceef7419
Collecting wheel
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7f99c48fe2e8>, 'Connection to pypi.org timed out. (connect timeout=15)')': /simple/wheel/
^C
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/7 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/7 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/7 : RUN pip3 install --upgrade wheel setuptools     && pip3 install -I flexget
 ---> Running in 7672300a2cc3
Collecting wheel
^C
[songqingjie@QNAP flexget-docker]$ vi Dockerfile                   

# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

RUN pip3 wheel

# Install flexget
RUN pip3 install --upgrade setuptools \
    && pip3 install -I flexget

# Cleanup

# Folders and configs
RUN mkdir -p /config

VOLUME ["/config"]

#RUN touch /config/config.yml

EXPOSE 3539:3539
# Run commands: Remove lock files and start daemon

CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"Dockerfile" 24 lines, 553 characters written
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/8 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/8 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/8 : RUN pip3 wheel
 ---> Running in 112d60d8c5b0
ERROR: You must give at least one requirement to wheel (see "pip help wheel")
The command '/bin/sh -c pip3 wheel' returned a non-zero code: 1
[songqingjie@QNAP flexget-docker]$ 
[songqingjie@QNAP flexget-docker]$ vi Dockerfile                   

# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

RUN pip3 install wheel

# Install flexget
RUN pip3 install --upgrade setuptools \
    && pip3 install -I flexget

# Cleanup

# Folders and configs
RUN mkdir -p /config

VOLUME ["/config"]

#RUN touch /config/config.yml

EXPOSE 3539:3539
# Run commands: Remove lock files and start daemon

CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
~
~
~
~
~
~
~
~
~
~
~
~
~
~
"Dockerfile" 24 lines, 561 characters written
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/8 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/8 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/8 : RUN pip3 install wheel
 ---> Running in a870d9808ce6
Collecting wheel
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7f3f9db52b70>, 'Connection to pypi.org timed out. (connect timeout=15)')': /simple/wheel/
^C
[songqingjie@QNAP flexget-docker]$ dig pypi.org

; <<>> DiG 9.10.1-P2 <<>> pypi.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21174
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;pypi.org.			IN	A

;; ANSWER SECTION:
pypi.org.		1994	IN	A	151.101.192.223
pypi.org.		1994	IN	A	151.101.128.223
pypi.org.		1994	IN	A	151.101.0.223
pypi.org.		1994	IN	A	151.101.64.223

;; Query time: 0 msec
;; SERVER: 127.0.1.1#53(127.0.1.1)
;; WHEN: Sun Feb 23 17:51:35 HKT 2020
;; MSG SIZE  rcvd: 101

[songqingjie@QNAP flexget-docker]$ dig pypi.org @1.1.1.1

; <<>> DiG 9.10.1-P2 <<>> pypi.org @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 36915
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1024
;; QUESTION SECTION:
;pypi.org.			IN	A

;; ANSWER SECTION:
pypi.org.		3600	IN	A	151.101.192.223
pypi.org.		3600	IN	A	151.101.64.223
pypi.org.		3600	IN	A	151.101.128.223
pypi.org.		3600	IN	A	151.101.0.223

;; Query time: 523 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Sun Feb 23 17:51:44 HKT 2020
;; MSG SIZE  rcvd: 101

[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/8 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/8 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/8 : RUN pip3 install wheel
 ---> Running in 700f0e6d7936
Collecting wheel
  Downloading https://files.pythonhosted.org/packages/8c/23/848298cccf8e40f5bbb59009b32848a4c38f4e7f3364297ab3c3e2e2cd14/wheel-0.34.2-py2.py3-none-any.whl
Installing collected packages: wheel
Successfully installed wheel-0.34.2
 ---> 16d1adb39810
Removing intermediate container 700f0e6d7936
Step 4/8 : RUN pip3 install --upgrade setuptools     && pip3 install -I flexget
 ---> Running in 0eb1150ecfac
Collecting setuptools
  Downloading https://files.pythonhosted.org/packages/3d/72/1c1498c1e908e0562b1e1cd30012580baa7d33b5b0ffdbeb5fde2462cc71/setuptools-45.2.0-py3-none-any.whl (584kB)
Installing collected packages: setuptools
  Found existing installation: setuptools 40.8.0
    Not uninstalling setuptools at /usr/lib/python3/dist-packages, outside environment /usr
    Can't uninstall 'setuptools'. No files were found to uninstall.
Successfully installed setuptools-45.2.0
Collecting flexget
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7faba3003978>, 'Connection to pypi.org timed out. (connect timeout=15)')': /simple/flexget/
^C
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/8 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/8 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/8 : RUN pip3 install wheel
 ---> Using cache
 ---> 16d1adb39810
Step 4/8 : RUN pip3 install --upgrade setuptools     && pip3 install -I flexget
 ---> Running in 187aaba313a4
Collecting setuptools
  Downloading https://files.pythonhosted.org/packages/3d/72/1c1498c1e908e0562b1e1cd30012580baa7d33b5b0ffdbeb5fde2462cc71/setuptools-45.2.0-py3-none-any.whl (584kB)
Installing collected packages: setuptools
  Found existing installation: setuptools 40.8.0
    Not uninstalling setuptools at /usr/lib/python3/dist-packages, outside environment /usr
    Can't uninstall 'setuptools'. No files were found to uninstall.
Successfully installed setuptools-45.2.0
Collecting flexget
  Downloading https://files.pythonhosted.org/packages/74/51/7866f605c900a5b050ab118b6f0e204c9479e872bdbd154d3fe564644787/FlexGet-3.1.28-py2.py3-none-any.whl (8.7MB)
Collecting soupsieve==1.9.5 (from flexget)
  Downloading https://files.pythonhosted.org/packages/81/94/03c0f04471fc245d08d0a99f7946ac228ca98da4fa75796c507f61e688c2/soupsieve-1.9.5-py2.py3-none-any.whl
Collecting tempora==1.8 (from flexget)
  Downloading https://files.pythonhosted.org/packages/33/ac/50ea4e5a23d6de977fffbc3c7cf94df60e9d1c9f5479e6f9845fb333342c/tempora-1.8-py2.py3-none-any.whl
Collecting flask==1.0.2 (from flexget)
  Downloading https://files.pythonhosted.org/packages/7f/e7/08578774ed4536d3242b14dacb4696386634607af824ea997202cd0edb4b/Flask-1.0.2-py2.py3-none-any.whl (91kB)
Collecting flask-restful==0.3.6 (from flexget)
  Downloading https://files.pythonhosted.org/packages/47/08/89cf8594735392cd71752f7cf159fa63765eac3e11b0da4324cdfeaea137/Flask_RESTful-0.3.6-py2.py3-none-any.whl
Collecting portend==2.6 (from flexget)
  Downloading https://files.pythonhosted.org/packages/d7/79/eee70a512bffe5ceb5008f8e3326581948f50ca393c3bcb4d557e4818bd1/portend-2.6-py2.py3-none-any.whl
Collecting python-dateutil==2.6.1 (from flexget)
  Downloading https://files.pythonhosted.org/packages/4b/0d/7ed381ab4fe80b8ebf34411d14f253e1cf3e56e2820ffa1d8844b23859a2/python_dateutil-2.6.1-py2.py3-none-any.whl (194kB)
Collecting progressbar==2.5 (from flexget)
  Downloading https://files.pythonhosted.org/packages/a3/a6/b8e451f6cff1c99b4747a2f7235aa904d2d49e8e1464e0b798272aa84358/progressbar-2.5.tar.gz
Collecting click==6.7 (from flexget)
  Downloading https://files.pythonhosted.org/packages/34/c1/8806f99713ddb993c5366c362b2f908f18269f8d792aff1abfd700775a77/click-6.7-py2.py3-none-any.whl (71kB)
Collecting feedparser==5.2.1 (from flexget)
  Downloading https://files.pythonhosted.org/packages/91/d8/7d37fec71ff7c9dbcdd80d2b48bcdd86d6af502156fc93846fb0102cb2c4/feedparser-5.2.1.tar.bz2 (192kB)
Collecting flask-compress==1.4.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/0e/2a/378bd072928f6d92fd8c417d66b00c757dc361c0405a46a0134de6fd323d/Flask-Compress-1.4.0.tar.gz
Collecting tzlocal==1.4 (from flexget)
  Downloading https://files.pythonhosted.org/packages/db/53/1334a66eef27703f3bd14c9592f6468bc46ad4371b23bd9b7c25cece8f28/tzlocal-1.4.tar.gz
Collecting flask-cors==3.0.2 (from flexget)
  Downloading https://files.pythonhosted.org/packages/4f/4f/ea10ca247c21b6512766cf730621697ec2766fb2f712245b2c00983a57b1/Flask_Cors-3.0.2-py2.py3-none-any.whl
Collecting six==1.13.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/65/26/32b8464df2a97e6dd1b656ed26b2c194606c16fe163c695a992b36c11cdf/six-1.13.0-py2.py3-none-any.whl
Collecting terminaltables==3.1.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/9b/c4/4a21174f32f8a7e1104798c445dacdc1d4df86f2f26722767034e4de4bff/terminaltables-3.1.0.tar.gz
Collecting sqlalchemy==1.3.11 (from flexget)
  Downloading https://files.pythonhosted.org/packages/34/5c/0e1d7ad0ca52544bb12f9cb8d5cc454af45821c92160ffedd38db0a317f6/SQLAlchemy-1.3.11.tar.gz (6.0MB)
Collecting cheroot==8.2.1 (from flexget)
  Downloading https://files.pythonhosted.org/packages/bf/be/51b1517c6dbf3851d44b36ff08a6e1012464149f89f74c46b29d2f76545e/cheroot-8.2.1-py2.py3-none-any.whl (79kB)
Collecting requests==2.21.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/7d/e3/20f3d364d6c8e5d2353c72a67778eb189176f08e873c9900e10c0287b84b/requests-2.21.0-py2.py3-none-any.whl (57kB)
Collecting loguru==0.4.1 (from flexget)
  Downloading https://files.pythonhosted.org/packages/b2/f4/2c8b94025c6e30bdb331c7ee628dc152771845aedff35f0365c2a4dacd42/loguru-0.4.1-py3-none-any.whl (54kB)
Collecting babelfish==0.5.5 (from flexget)
  Downloading https://files.pythonhosted.org/packages/34/b7/b36c651a9136990060ab4d6c9a32de81752123105b940b2f3b958e5c6cd0/babelfish-0.5.5.tar.gz (90kB)
Collecting jaraco.functools==2.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/12/a4/3e7366d0f5e75dcad7be88524c8cbd0f3a9fb1db243269550981740c57fe/jaraco.functools-2.0-py2.py3-none-any.whl
Collecting zxcvbn-python==4.4.15 (from flexget)
  Downloading https://files.pythonhosted.org/packages/5e/1f/531b038175f77f75aa0f4eb9f67da232f38a8ee5c37957747115b3e83f59/zxcvbn-python-4.4.15.tar.gz (405kB)
Collecting flask-login==0.4.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/5a/14/364597ec0dd5490eb4443adae60b35088a6b7d466a9f7c8dacbe259477b5/Flask_Login-0.4.0-py2.py3-none-any.whl
Collecting chardet==3.0.3 (from flexget)
  Downloading https://files.pythonhosted.org/packages/8c/27/99f781a11e4daa5acadf97add6e5883ec5f8f9abbf279e790fd0ff371db7/chardet-3.0.3-py2.py3-none-any.whl (133kB)
Collecting werkzeug==0.15.6 (from flexget)
  Downloading https://files.pythonhosted.org/packages/b7/61/c0a1adf9ad80db012ed7191af98fa05faa95fa09eceb71bb6fa8b66e6a43/Werkzeug-0.15.6-py2.py3-none-any.whl (328kB)
Collecting more-itertools==7.2.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/45/dc/3241eef99eb45f1def35cf93af35d1cf9ef4c0991792583b8f33ea41b092/more_itertools-7.2.0-py3-none-any.whl (57kB)
Collecting guessit==3.1.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/3e/4d/0f3c55ff4fbef55e6e1086e9f273cef4f70d8aa1b975f2a4d9821e0fdc34/guessit-3.1.0.tar.gz (144kB)
Collecting apscheduler==3.5.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/19/d9/ca8322005bcd84c38e38cfaf2d5bd6fb66c14b4e977e973c6bb5ac5b98c7/APScheduler-3.5.0-py2.py3-none-any.whl (60kB)
Collecting rebulk==2.0.0 (from flexget)
  Downloading https://files.pythonhosted.org/packages/ad/f6/3b27f7399ac8486d86e239e0a44acacfd0e0a3e5903071420c0b0cf8b465/rebulk-2.0.0.tar.gz (257kB)
Collecting certifi==2017.4.17 (from flexget)
  Downloading https://files.pythonhosted.org/packages/eb/01/c1f58987b777d6c4ec535b4e004a4a07bfc9db06f0c7533367ca6da8f2a6/certifi-2017.4.17-py2.py3-none-any.whl (375kB)
Collecting zc.lockfile==2.0 (from flexget)
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ProtocolError('Connection aborted.', RemoteDisconnected('Remote end closed connection without response'))': /simple/zc-lockfile/
^C
[songqingjie@QNAP flexget-docker]$ dig pypi.org @1.1.1.1           

; <<>> DiG 9.10.1-P2 <<>> pypi.org @1.1.1.1
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65233
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;pypi.org.			IN	A

;; ANSWER SECTION:
pypi.org.		2641	IN	A	151.101.0.223
pypi.org.		2641	IN	A	151.101.192.223
pypi.org.		2641	IN	A	151.101.128.223
pypi.org.		2641	IN	A	151.101.64.223

;; Query time: 2 msec
;; SERVER: 1.1.1.1#53(1.1.1.1)
;; WHEN: Sun Feb 23 17:57:12 HKT 2020
;; MSG SIZE  rcvd: 90

[songqingjie@QNAP flexget-docker]$ vi Dockerfile                   

# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

RUN pip3 install wheel


# Install flexget
RUN pip3 install --upgrade setuptools 
    && pip3 install -I flexget

   
# Cleanup

# Folders and configs
RUN mkdir -p /config

VOLUME ["/config"]

#RUN touch /config/config.yml

EXPOSE 3539:3539
# Run commands: Remove lock files and start daemon

CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
~
~
~
~
~
~
~
~
~
~
~
~
[songqingjie@QNAP flexget-docker]$ vi Dockerfile 

# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

RUN pip3 install wheel

# Install flexget
RUN pip3 install --upgrade setuptools \
    && pip3 install -I flexget

# Cleanup

# Folders and configs
RUN mkdir -p /config

VOLUME ["/config"]

#RUN touch /config/config.yml

EXPOSE 3539:3539
# Run commands: Remove lock files and start daemon

CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
~
~
~
~
~
~
~
~
~
~
~
~
~
~
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/8 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/8 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/8 : RUN pip3 install wheel
 ---> Using cache
 ---> 16d1adb39810
Step 4/8 : RUN pip3 install --upgrade setuptools     && pip3 install -I flexget
 ---> Running in 5fcbd83882b7
Collecting setuptools
  Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ConnectTimeoutError(<urllib3.connection.VerifiedHTTPSConnection object at 0x7f484b42cac8>, 'Connection to files.pythonhosted.org timed out. (connect timeout=15)')': /packages/3d/72/1c1498c1e908e0562b1e1cd30012580baa7d33b5b0ffdbeb5fde2462cc71/setuptools-45.2.0-py3-none-any.whl
^C
[songqingjie@QNAP flexget-docker]$ docker build -t flexget-docker .
Sending build context to Docker daemon   2.56kB
Step 1/8 : FROM bitnami/minideb:latest
 ---> 3b80e185d43d
Step 2/8 : RUN install_packages python3 python3-pip python3-setuptools
 ---> Using cache
 ---> 49e665506266
Step 3/8 : RUN pip3 install wheel
 ---> Using cache
 ---> 16d1adb39810
Step 4/8 : RUN pip3 install --upgrade setuptools     && pip3 install -I flexget
 ---> Running in db1dcf81215d
^C
[songqingjie@QNAP flexget-docker]$ vi Dockerfile                   

# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

RUN pip3 install wheel

# Install flexget
RUN pip3 install --upgrade setuptools \
    && pip3 install -I flexget

# Cleanup

# Folders and configs
RUN mkdir -p /config

VOLUME ["/config"]

#RUN touch /config/config.yml

EXPOSE 3539:3539
# Run commands: Remove lock files and start daemon

CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
