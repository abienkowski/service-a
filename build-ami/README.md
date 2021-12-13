# Roll your own image or distro

This part of the projects shows how to create a custom AMI or create a new distroy based on LFS (Linux From Scratch) book.

Only custom AMI based on Ubuntu 18.04 release has been implemented at this time.

The following references have been used in creating this part of the repo.

https://github.com/jen20/packer-ubuntu-zfs
https://www.idalko.com/build-linux-distribution/
https://github.com/wolfhechel/packer-lfs

# Build AMI

```
packer build ami-template.json
```
