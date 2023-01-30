# py36

#  Install Python3.6 - This will automate the build and install from source.

---

###  Install setup tools:

```

# become root
sudo -i

#install git
yum install -y git

git clone https://github.com/tlepple/py36.git

# change dir
cd py36

# run the install
./setup.sh
```


###  Check that all ran as expected:

```
which python3.6

# expected output:
/usr/local/bin/python3.6

# python version
python3.6 --version

#expected output:
Python 3.6.9


```
