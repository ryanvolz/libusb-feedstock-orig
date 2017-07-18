About libusb
============

Home: http://libusb.info/

Package license: LGPL-2.1

Feedstock license: BSD 3-Clause

Summary: A cross-platform library to access USB devices

libusb is a library for USB device access from Linux, Mac OS X, Windows,
OpenBSD/NetBSD and Haiku userspace.


Current build status
====================

Linux: [![Circle CI](https://circleci.com/gh/ryanvolz/libusb-feedstock.svg?style=shield)](https://circleci.com/gh/ryanvolz/libusb-feedstock)
OSX: [![TravisCI](https://travis-ci.org/ryanvolz/libusb-feedstock.svg?branch=master)](https://travis-ci.org/ryanvolz/libusb-feedstock)
Windows: ![](https://cdn.rawgit.com/conda-forge/conda-smithy/90845bba35bec53edac7a16638aa4d77217a3713/conda_smithy/static/disabled.svg)

Current release info
====================
Version: [![Anaconda-Server Badge](https://anaconda.org/ryanvolz/libusb/badges/version.svg)](https://anaconda.org/ryanvolz/libusb)
Downloads: [![Anaconda-Server Badge](https://anaconda.org/ryanvolz/libusb/badges/downloads.svg)](https://anaconda.org/ryanvolz/libusb)

Installing libusb
=================

Installing `libusb` from the `ryanvolz` channel can be achieved by adding `ryanvolz` to your channels with:

```
conda config --add channels ryanvolz
```

Once the `ryanvolz` channel has been enabled, `libusb` can be installed with:

```
conda install libusb
```

It is possible to list all of the versions of `libusb` available on your platform with:

```
conda search libusb --channel ryanvolz
```




Updating libusb-feedstock
=========================

If you would like to improve the libusb recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`ryanvolz` channel, whereupon the built conda packages will be available for
everybody to install and use from the `ryanvolz` channel.
Note that all branches in the ryanvolz/libusb-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](http://conda.pydata.org/docs/building/meta-yaml.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](http://conda.pydata.org/docs/building/meta-yaml.html#build-number-and-string)
   back to 0.
