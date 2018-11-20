## Using `dd` to clone/compress a hard drive partition
Mount the partiton where you'll be writing the drive to
```bash
# mount /path/to/device /path
```
Use dd to copy the partition and gzip to compress it. Make sure the partition you're about the copy is not actively mounted.
```bash
# dd if=/path/to/filesystem | gzip -c > filename.image.gz
```
To copy your image onto a filesystem
```bash
# gunzip -c filename.image.gz | dd of=/path/to/device
```
