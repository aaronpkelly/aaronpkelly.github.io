---
title: Building a PyInstaller Windows EXE on Linux
description: I show you how I built a PyInstaller Windows EXE on Linux
date: 2021-06-27
layout: post
tags:
  - python
  - pyinstaller
  - python-fire
  - gooey
---

I have a [project](https://git.sr.ht/~aaronkelly/easy-s3-bucket-downloader) that uses [python-fire](https://github.com/google/python-fire) to automatically turn my python program into a command-line app, and [gooey](https://github.com/chriskiehl/Gooey) to give the app a GUI.

I realised however that PyInstaller has [a limitation](https://pyinstaller.readthedocs.io/en/stable/operating-mode.html):

> The output of PyInstaller is specific to the active operating system and the active version of Python. This means that to prepare a distribution for:
>       a different OS
>       a different version of Python
>       a 32-bit or 64-bit OS
>
> you run PyInstaller on that OS, under that version of Python. The Python interpreter that executes PyInstaller is part of the bundle, and it is specific to the OS and the word size.

I've tried to manually build it myself by running windows 7 under qemu - difficult, non-automated

# Installing and configuring Wine

I started by using this [great blog post](https://www.andreafortuna.org/2017/12/27/how-to-cross-compile-a-python-script-into-a-windows-executable-on-linux/) to build a proof of concept. Below, I add a bit more detail to these steps. 

After installing Wine, make sure to change your windows version to Windows 8.1 or greater (I used Windows 10), as the most recent version of Python 3 will check for this. You can change the version of Windows that wine reports itself as by running:

	winecfg
	
Also, while running the various Wine commands below, you might notice that there's a lot of debug error messages like `00f8:fixme:file:server_get_file_info Unsupported info class e
`. You can disable these by typing the following command:

	export WINEDEBUG=-all

# Installing Python 3.9.5 in Wine

Get the latest installer. I chose the 32-bit version below, but you should be able to use the 64-bit version by replacing `wine` with `wine64`:

	curl -LO https://www.python.org/ftp/python/3.9.5/python-3.9.5.exe

Then run the below command to start the installation.

	$ wine python-3.9.5.exe

My advice for the installation is:
- choose advanced install, and:
- deselect all optional extras except pip
- install for all users
- add global environment variables (i think this helps)

You can check that it's installed with:
 
	 $ wine python 
	00f4:fixme:heap:RtlSetHeapInformation 00000000 1 00000000 0 stub
	Python 3.4.4rc1 (v3.4.4rc1:04f3f725896c, Dec  6 2015, 16:42:12) [MSC v.1600 32 bit (Intel)] on win32
	Type "help", "copyright", "credits" or "license" for more information.
	>>>
	
Nice!

# Using pip to install PyInstaller + friends

Now install pyinstaller, and any python libraries that your project needs, e.g.:

	$ wine pip install boto3 gooey fire pyinstaller
	MESA-INTEL: warning: Performance support disabled, consider sysctl dev.i915.perf_stream_paranoid=0

	Collecting boto3
	  Downloading boto3-1.17.101-py2.py3-none-any.whl (131 kB)
		 |████████████████████████████████| 131 kB 906 kB/s
	Collecting gooey
	  Downloading Gooey-1.0.8.1-py2.py3-none-any.whl (680 kB)
		 |████████████████████████████████| 680 kB 2.3 MB/s
	Collecting fire
	  Downloading fire-0.4.0.tar.gz (87 kB)
		 |████████████████████████████████| 87 kB 1.5 MB/s
	Collecting pyinstaller
	  Downloading pyinstaller-4.3.tar.gz (3.7 MB)
		 |████████████████████████████████| 3.7 MB 2.3 MB/s
	Collecting s3transfer<0.5.0,>=0.4.0
	  Downloading s3transfer-0.4.2-py2.py3-none-any.whl (79 kB)
		 |████████████████████████████████| 79 kB 623 kB/s
	Collecting botocore<1.21.0,>=1.20.101
	  Downloading botocore-1.20.101-py2.py3-none-any.whl (7.7 MB)
		 |████████████████████████████████| 7.7 MB 11.4 MB/s
	Collecting jmespath<1.0.0,>=0.7.1
	  Downloading jmespath-0.10.0-py2.py3-none-any.whl (24 kB)
	Collecting python-dateutil<3.0.0,>=2.1
	  Downloading python_dateutil-2.8.1-py2.py3-none-any.whl (227 kB)
		 |████████████████████████████████| 227 kB 9.3 MB/s
	Collecting urllib3<1.27,>=1.25.4
	  Downloading urllib3-1.26.6-py2.py3-none-any.whl (138 kB)
		 |████████████████████████████████| 138 kB 11.4 MB/s
	Collecting six>=1.5
	  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
	Collecting wxpython>=4.1.0
	  Downloading wxPython-4.1.1-cp39-cp39-win32.whl (15.1 MB)
		 |████████████████████████████████| 15.1 MB 5.1 MB/s
	Collecting pygtrie>=2.3.3
	  Downloading pygtrie-2.4.2.tar.gz (35 kB)
	Collecting psutil>=5.4.2
	  Downloading psutil-5.8.0-cp39-cp39-win32.whl (241 kB)
		 |████████████████████████████████| 241 kB 1.3 MB/s
	Collecting Pillow>=4.3.0
	  Downloading Pillow-8.2.0-cp39-cp39-win32.whl (1.9 MB)
		 |████████████████████████████████| 1.9 MB 6.4 MB/s
	Collecting colored>=1.3.93
	  Downloading colored-1.4.2.tar.gz (56 kB)
		 |████████████████████████████████| 56 kB 975 kB/s
	Collecting numpy
	  Downloading numpy-1.21.0-cp39-cp39-win32.whl (11.6 MB)
		 |████████████████████████████████| 11.6 MB 2.8 MB/s
	Collecting termcolor
	  Downloading termcolor-1.1.0.tar.gz (3.9 kB)
	Using legacy 'setup.py install' for colored, since package 'wheel' is not installed.
	Using legacy 'setup.py install' for pygtrie, since package 'wheel' is not installed.
	Using legacy 'setup.py install' for fire, since package 'wheel' is not installed.
	Using legacy 'setup.py install' for termcolor, since package 'wheel' is not installed.
	Installing collected packages: six, urllib3, python-dateutil, jmespath, Pillow, numpy, botocore, wxpython
	, termcolor, s3transfer, pygtrie, psutil, colored, gooey, fire, boto3
		Running setup.py install for termcolor ... done
		Running setup.py install for pygtrie ... done
		Running setup.py install for colored ... done
		Running setup.py install for fire ... done
	Successfully installed Pillow-8.2.0 boto3-1.17.101 botocore-1.20.101 colored-1.4.2 fire-0.4.0 gooey-1.0.8
	.1 jmespath-0.10.0 numpy-1.21.0 psutil-5.8.0 pygtrie-2.4.2 python-dateutil-2.8.1 s3transfer-0.4.2 six-1.1
	6.0 termcolor-1.1.0 urllib3-1.26.6 wxpython-4.1.1
	WARNING: You are using pip version 21.1.1; however, version 21.1.3 is available.
	You should consider upgrading via the 'c:\program files\python39-32\python.exe -m pip install --upgrade p
	ip' command

# Building the Windows EXE

Now that you have a fully installed python environment inside Wine, you can finally turn your Python program into an executable binary file:

	$ wine pyinstaller --onefile app.py
	MESA-INTEL: warning: Performance support disabled, consider sysctl dev.i915.perf_stream_paranoid=0

	198 INFO: PyInstaller: 4.3
	198 INFO: Python: 3.9.5
	302 INFO: Platform: Windows-7-6.1.7601
	304 INFO: wrote Z:\home\aaron\src\easy-s3-bucket-downloader\app.spec
	310 INFO: UPX is not available.
	312 INFO: Extending PYTHONPATH with paths
	['Z:\\home\\aaron\\src\\easy-s3-bucket-downloader',
	 'Z:\\home\\aaron\\src\\easy-s3-bucket-downloader']
	338 INFO: checking Analysis
	340 INFO: Building Analysis because Analysis-00.toc is non existent
	340 INFO: Initializing module dependency graph...
	346 INFO: Caching module graph hooks...
	380 INFO: Analyzing base_library.zip ...
	3442 INFO: Processing pre-find module path hook distutils from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks\\pre_find_module_path\\hook-distutils.py'.
	3444 INFO: distutils: retargeting to non-venv dir 'c:\\program files\\python39-32\\lib'
	6040 INFO: Caching module dependency graph...
	6325 INFO: running Analysis Analysis-00.toc
	6329 INFO: Adding Microsoft.Windows.Common-Controls to dependent assemblies of final executable
	  required by c:\program files\python39-32\python.exe
	6572 INFO: Analyzing Z:\home\aaron\src\easy-s3-bucket-downloader\app.py
	7080 INFO: Processing pre-safe import module hook six.moves from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks\\pre_safe_import_module\\hook-six.moves.py'.
	7869 INFO: Processing pre-safe import module hook urllib3.packages.six.moves from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks\\pre_safe_import_module\\hook-urllib3.packages.six.moves.py'.
	9902 INFO: Processing pre-find module path hook site from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks\\pre_find_module_path\\hook-site.py'.
	9904 INFO: site: retargeting to fake-dir 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\fake-modules'
	19568 INFO: Processing module hooks...
	19568 INFO: Loading module hook 'hook-boto3.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\_pyinstaller_hooks_contrib\\hooks\\stdhooks'...
	21580 INFO: Loading module hook 'hook-botocore.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\_pyinstaller_hooks_contrib\\hooks\\stdhooks'...
	27215 INFO: Loading module hook 'hook-gooey.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\_pyinstaller_hooks_contrib\\hooks\\stdhooks'...
	28300 INFO: Loading module hook 'hook-difflib.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28304 INFO: Loading module hook 'hook-distutils.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28306 INFO: Loading module hook 'hook-distutils.util.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28310 INFO: Loading module hook 'hook-encodings.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28594 INFO: Loading module hook 'hook-heapq.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28599 INFO: Loading module hook 'hook-lib2to3.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28826 INFO: Loading module hook 'hook-multiprocessing.util.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	28830 INFO: Loading module hook 'hook-numpy.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29021 INFO: Import to be excluded not found: 'f2py'
	29022 INFO: Loading module hook 'hook-numpy._pytesttester.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29026 INFO: Loading module hook 'hook-pickle.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29030 INFO: Loading module hook 'hook-PIL.Image.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29602 INFO: Loading module hook 'hook-PIL.ImageFilter.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29607 INFO: Loading module hook 'hook-PIL.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29610 INFO: Import to be excluded not found: 'FixTk'
	29615 INFO: Loading module hook 'hook-PIL.SpiderImagePlugin.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	29617 INFO: Import to be excluded not found: 'FixTk'
	29619 INFO: Loading module hook 'hook-pkg_resources.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	30398 INFO: Processing pre-safe import module hook win32com from 'c:\\program files\\python39-32\\lib\\site-packages\\_pyinstaller_hooks_contrib\\hooks\\pre_safe_import_module\\hook-win32com.py'.
	30753 WARNING: Hidden import "pkg_resources.py2_warn" not found!
	30754 WARNING: Hidden import "pkg_resources.markers" not found!
	30758 INFO: Loading module hook 'hook-setuptools.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32094 INFO: Import to be excluded not found: 'setuptools.py27compat'
	32094 INFO: Import to be excluded not found: 'setuptools.py33compat'
	32095 INFO: Loading module hook 'hook-sysconfig.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32096 INFO: Loading module hook 'hook-win32ctypes.core.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32639 INFO: Loading module hook 'hook-xml.dom.domreg.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32641 INFO: Loading module hook 'hook-xml.etree.cElementTree.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32643 INFO: Loading module hook 'hook-xml.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32645 INFO: Loading module hook 'hook-setuptools.msvc.py' from 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks'...
	32686 INFO: Looking for ctypes DLLs
	32773 INFO: Analyzing run-time hooks ...
	32779 INFO: Including run-time hook 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks\\rthooks\\pyi_rth_multiprocessing.py'
	32783 INFO: Including run-time hook 'c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\hooks\\rthooks\\pyi_rth_pkgres.py'
	32801 INFO: Looking for dynamic libraries
	33623 INFO: Looking for eggs
	33623 INFO: Using Python library c:\program files\python39-32\python39.dll
	33623 INFO: Found binding redirects:
	[]
	33630 INFO: Warnings written to Z:\home\aaron\src\easy-s3-bucket-downloader\build\app\warn-app.txt
	33743 INFO: Graph cross-reference written to Z:\home\aaron\src\easy-s3-bucket-downloader\build\app\xref-app.html
	33801 INFO: checking PYZ
	33802 INFO: Building PYZ because PYZ-00.toc is non existent
	33802 INFO: Building PYZ (ZlibArchive) Z:\home\aaron\src\easy-s3-bucket-downloader\build\app\PYZ-00.pyz
	35006 INFO: Building PYZ (ZlibArchive) Z:\home\aaron\src\easy-s3-bucket-downloader\build\app\PYZ-00.pyz completed successfully.
	35030 INFO: checking PKG
	35031 INFO: Building PKG because PKG-00.toc is non existent
	35031 INFO: Building PKG (CArchive) PKG-00.pkg
	41967 INFO: Building PKG (CArchive) PKG-00.pkg completed successfully.
	42002 INFO: Bootloader c:\program files\python39-32\lib\site-packages\PyInstaller\bootloader\Windows-32bit\run.exe
	42002 INFO: checking EXE
	42003 INFO: Building EXE because EXE-00.toc is non existent
	42003 INFO: Building EXE from EXE-00.toc
	42006 INFO: Copying icons from ['c:\\program files\\python39-32\\lib\\site-packages\\PyInstaller\\bootloader\\images\\icon-console.ico']
	42008 INFO: Writing RT_GROUP_ICON 0 resource with 104 bytes
	42008 INFO: Writing RT_ICON 1 resource with 3752 bytes
	42009 INFO: Writing RT_ICON 2 resource with 2216 bytes
	42009 INFO: Writing RT_ICON 3 resource with 1384 bytes
	42009 INFO: Writing RT_ICON 4 resource with 37019 bytes
	42010 INFO: Writing RT_ICON 5 resource with 9640 bytes
	42010 INFO: Writing RT_ICON 6 resource with 4264 bytes
	42010 INFO: Writing RT_ICON 7 resource with 1128 bytes
	42015 INFO: Updating manifest in Z:\home\aaron\src\easy-s3-bucket-downloader\build\app\run.exe.zlb10bnm
	42017 INFO: Updating resource type 24 name 1 language 0
	42020 INFO: Appending archive to EXE Z:\home\aaron\src\easy-s3-bucket-downloader\dist\app.exe
	48788 INFO: Building EXE from EXE-00.toc completed successfully.

Once it's done building things in the _./build_ folder, it will finally write the EXE file to the _./dist_ folder.

Try running it with Wine!:

	$ wine dist/app.exe

# Supplementary info
## Installing Python3 older the older MSI installers

the last MSI version released?:
https://www.python.org/ftp/python/3.4.4/

NOTE: amd64 (https://www.python.org/ftp/python/3.4.4/python-3.4.4.amd64.msi) does not seem to be supported on NixOS's default wine installation, use the 32-bit

	$ curl -LO https://www.python.org/ftp/python/3.4.4/python-3.4.4rc1.msi

Please try to avoid running the installer as a super-user:

	$ wine msiexec /install python-3.4.4rc1.msi
	
You can also append `/qb` for an unattended install, but make sure the package installs correctly in the first place, otherwise it will just silently fail
	
> -i installs or configures a product
> /q set user interface level (B=basic ui)

You should see that python is installed here: _/home/aaron/.wine/drive_c/Python34_

# github actions
But apparently there's a github acton that someone has created that runs Wine in Docker and build it:

https://dmnfarrell.github.io/software/github-actions-pyinstaller

