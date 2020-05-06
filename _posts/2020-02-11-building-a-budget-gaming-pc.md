I have an old tower that I'm thinking of repurposing as a gaming machine.

# What I want

https://www.tomshardware.com/reviews/best-gpus,4380.html

RX 570 4GB Best Budget Gaming Card (Even if It’s Old and Not Efficient)

# Hardware I have already

## Motherboard

https://www.asus.com/Motherboards/P8P67/

https://www.pc-specs.com/mobo/Asus/Asus_P8P67/55

## lspci

```
/ # lspci
00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller (rev 09)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
00:19.0 Ethernet controller: Intel Corporation 82579V Gigabit Network Connection (rev 05)
00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)
00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 05)
00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b5)
00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 (rev b5)
00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 (rev b5)
00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 5 (rev b5)
00:1c.6 PCI bridge: Intel Corporation 82801 PCI Bridge (rev b5)
00:1c.7 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 8 (rev b5)
00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 05)
00:1f.0 ISA bridge: Intel Corporation Z68 Express Chipset LPC Controller (rev 05)
00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Desktop SATA AHCI Controller (rev 05)
00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 05)
03:00.0 USB controller: ASMedia Technology Inc. ASM1042 SuperSpeed USB Host Controller
04:00.0 SATA controller: JMicron Technology Corp. JMB362 SATA Controller (rev 10)
05:00.0 USB controller: ASMedia Technology Inc. ASM1042 SuperSpeed USB Host Controller
06:00.0 PCI bridge: ASMedia Technology Inc. ASM1083/1085 PCIe to PCI Bridge (rev 01)
07:02.0 FireWire (IEEE 1394): VIA Technologies, Inc. VT6306/7/8 [Fire II(M)] IEEE 1394 OHCI Controller (rev c0)
08:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9172 SATA 6Gb/s Controller (rev 11)
```

## hwinfo --short

```
/ # hwinfo --short
cpu:                                                            
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3240 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3240 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3240 MHz
                       Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz, 3240 MHz
keyboard:
  /dev/input/event2    OpenMoko Ultimate Hacking Keyboard
  /dev/ttyS0           serial console
mouse:
  /dev/input/mice      OpenMoko Ultimate Hacking Keyboard
monitor:
                       SONY TV
graphics card:
                       Intel 2nd Generation Core Processor Family Integrated Graphics Controller
sound:
                       Intel 6 Series/C200 Series Chipset Family High Definition Audio Controller
storage:
                       Intel 6 Series/C200 Series Chipset Family SATA AHCI Controller
                       Marvell 88SE9172 SATA 6Gb/s Controller
                       JMicron JMB362 SATA Controller
network:
                       Intel 82579V Gigabit Network Connection
network interface:
  lo                   Loopback network interface
  eth0                 Ethernet network interface
disk:
  /dev/sda             ST31000340NS
partition:
  /dev/sda1            Partition
  /dev/sda2            Partition
  /dev/sda3            Partition
  /dev/sda4            Partition
cdrom:
  /dev/sr0             TSSTcorp DVD-ROM TS-H353B
usb controller:
                       ASMedia ASM1042 SuperSpeed USB Host Controller
                       Intel 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2
                       ASMedia ASM1042 SuperSpeed USB Host Controller
                       Intel 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1
bios:
                       BIOS
bridge:
                       Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 1
                       Intel Z68 Express Chipset Family LPC Controller
                       Intel Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port
                       Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 8
                       Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 4
                       Intel 2nd Generation Core Processor Family DRAM Controller
                       Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 2
                       ASMedia ASM1083/1085 PCIe to PCI Bridge
                       Intel 82801 PCI Bridge
                       Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 5
hub:
                       Linux Foundation 3.0 root hub
                       Intel Integrated Rate Matching Hub
                       Linux Foundation 2.0 root hub
                       Linux Foundation 3.0 root hub
                       Linux Foundation 2.0 root hub
                       Linux Foundation 2.0 root hub
                       Intel Integrated Rate Matching Hub
                       Linux Foundation 2.0 root hub
memory:
                       Main Memory
firewire controller:
                       VIA VT6306/7/8 [Fire II(M)] IEEE 1394 OHCI Controller
bluetooth:
                       ASUSTek Bluetooth Device
unknown:
                       FPU
                       DMA controller
                       PIC
                       Keyboard controller
                       Intel 6 Series/C200 Series Chipset Family MEI Controller #1
                       Intel 6 Series/C200 Series Chipset Family SMBus Controller
  /dev/input/event3    OpenMoko Ultimate Hacking Keyboard
```

## hwinfo

```
  ~ cat my_hwinfo
/ # apk update && apk add hwinfo
fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/community/x86_64/APKINDEX.tar.gz
v3.11.6-16-gb9c639e036 [http://dl-cdn.alpinelinux.org/alpine/v3.11/main]
v3.11.6-15-g3ae2cc62ea [http://dl-cdn.alpinelinux.org/alpine/v3.11/community]
OK: 11270 distinct packages available
(1/3) Installing libx86emu (2.4-r0)
(2/3) Installing hwinfo-libs (21.60-r1)
(3/3) Installing hwinfo (21.60-r1)
Executing busybox-1.31.1-r9.trigger
OK: 9 MiB in 17 packages
/ # hwinfo
============ start debug info ============                      
libhd version 21.60 (x86-64) [7688]
using /var/lib/hardware
kernel version is 5.5
----- /proc/cmdline -----
  BOOT_IMAGE=(hd0,gpt1)/ostree/fedora-coreos-bf2120c8ffe173d3f1a381ae48ac3b19f4741a9feffd6698ce927decd57eaee9/vmlinuz-5.5.15-200.fc31.x86_64 mitigations=auto,nosmt systemd.unified_cgroup_hierarchy=0 console=tty0 console=ttyS0,115200n8 ignition.platform.id=metal ostree=/ostree/boot.0/fedora-coreos/bf2120c8ffe173d3f1a381ae48ac3b19f4741a9feffd6698ce927decd57eaee9/0
----- /proc/cmdline end -----
debug = 0xff7ffff7
probe = 0x15938fcdaa17fcf9fffe (+memory +pci +isapnp +net +floppy +misc +misc.serial +misc.par +misc.floppy +serial +cpu +bios +monitor +mouse +scsi +usb -usb.mods +modem +modem.usb +parallel +parallel.lp +parallel.zip -isa -isa.isdn +isdn +kbd +prom +sbus +int +braille +braille.alva +braille.fhp +braille.ht -ignx11 +sys -bios.vbe -isapnp.old -isapnp.new -isapnp.mod +braille.baum -manual +fb +pppoe -scan +pcmcia +fork -parallel.imm +s390 +cpuemu -sysfs -s390disks +udev +block +block.cdrom +block.part +edd +edd.mod -bios.ddc -bios.fb -bios.mode +input +block.mods +bios.vesa -cpuemu.debug -scsi.noserial +wlan -bios.crc -hal +bios.vram +bios.acpi -bios.ddc.ports=0 +modules.pata -net.eeprom +x86emu=dump -max -lxrc)
shm: attached segment 0 at 0x7fb04bebd000
>> hal.1: read hal data
>> floppy.1: get nvram
----- /proc/nvram -----
  Checksum status: valid
  # floppies     : 0
  Floppy 0 type  : none
  Floppy 1 type  : none
  HD 0 type      : 03
  HD 1 type      : 0d
  HD type 48 data: 63326/23/215 C/H/S, precomp 18933, lz 16156
  HD type 49 data: 511/139/213 C/H/S, precomp 64315, lz 65475
  DOS base memory: 629 kB
  Extended memory: 65535 kB (configured), 65535 kB (tested)
  Gfx adapter    : monochrome
  FPU            : installed
----- /proc/nvram end -----
>> floppy.2: nvram info
>> bios.1: cmdline
>> bios.1.1: apm
>> bios.2: ram
  bios: 0 disks
>> bios.2: rom
>> bios.3: smp
----- BIOS data 0x00400 - 0x004ff -----
  400  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  410  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  420  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  430  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  440  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  450  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  460  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  470  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  480  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  490  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  4a0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  4b0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  4c0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  4d0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  4e0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  4f0  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
----- BIOS data end -----
>> bios.4: vbe
>> bios.4.1: vbe info
=== bios setup ===
failed to read /dev/mem
x86emu: could not init vm
>> bios.5: 32
>> bios.6: acpi
>> sys.1: cpu
  hypervisor check: 0
  vm check: vm_1 = 0, vm_2 = 0
  is_vmware = 0, has_vmware_mouse = 0
>> misc.9: kernel log
>> misc.1: misc data
>> misc.1.1: open serial
>> misc.1.2: open parallel
----- exec: "/sbin/modprobe parport " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
----- exec: "/sbin/modprobe parport_pc " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> misc.2.1: io
>> misc.2.2: dma
>> misc.2.3: irq
----- /proc/ioports -----
  0000-0000 : PCI Bus 0000:00
    0000-0000 : dma1
    0000-0000 : pic1
    0000-0000 : timer0
    0000-0000 : timer1
    0000-0000 : keyboard
    0000-0000 : PNP0C09:00
      0000-0000 : EC data
    0000-0000 : keyboard
    0000-0000 : PNP0C09:00
      0000-0000 : EC cmd
    0000-0000 : rtc0
    0000-0000 : dma page reg
    0000-0000 : pic2
    0000-0000 : dma2
    0000-0000 : PNP0C04:00
      0000-0000 : fpu
    0000-0000 : pnp 00:01
    0000-0000 : pnp 00:04
    0000-0000 : vga+
    0000-0000 : pnp 00:01
      0000-0000 : ACPI PM1a_EVT_BLK
      0000-0000 : ACPI PM1a_CNT_BLK
      0000-0000 : ACPI PM_TMR
      0000-0000 : ACPI GPE0_BLK
      0000-0000 : iTCO_wdt.1.auto
        0000-0000 : iTCO_wdt
      0000-0000 : ACPI PM2_CNT_BLK
    0000-0000 : pnp 00:03
    0000-0000 : pnp 00:01
      0000-0000 : iTCO_wdt.1.auto
        0000-0000 : iTCO_wdt
    0000-0000 : pnp 00:05
    0000-0000 : pnp 00:01
    0000-0000 : pnp 00:01
  0000-0000 : PCI conf1
  0000-0000 : PCI Bus 0000:00
    0000-0000 : pnp 00:01
    0000-0000 : PCI Bus 0000:02
    0000-0000 : PCI Bus 0000:08
      0000-0000 : 0000:08:00.0
        0000-0000 : ahci
      0000-0000 : 0000:08:00.0
        0000-0000 : ahci
      0000-0000 : 0000:08:00.0
        0000-0000 : ahci
      0000-0000 : 0000:08:00.0
        0000-0000 : ahci
      0000-0000 : 0000:08:00.0
        0000-0000 : ahci
    0000-0000 : PCI Bus 0000:06
      0000-0000 : PCI Bus 0000:07
        0000-0000 : 0000:07:02.0
    0000-0000 : PCI Bus 0000:04
      0000-0000 : 0000:04:00.0
        0000-0000 : ahci
      0000-0000 : 0000:04:00.0
        0000-0000 : ahci
      0000-0000 : 0000:04:00.0
        0000-0000 : ahci
      0000-0000 : 0000:04:00.0
        0000-0000 : ahci
      0000-0000 : 0000:04:00.0
        0000-0000 : ahci
    0000-0000 : 0000:00:02.0
    0000-0000 : 0000:00:1f.3
      0000-0000 : i801_smbus
    0000-0000 : 0000:00:1f.2
      0000-0000 : ahci
    0000-0000 : 0000:00:19.0
    0000-0000 : 0000:00:1f.2
      0000-0000 : ahci
    0000-0000 : 0000:00:1f.2
      0000-0000 : ahci
    0000-0000 : 0000:00:1f.2
      0000-0000 : ahci
    0000-0000 : 0000:00:1f.2
      0000-0000 : ahci
    0000-0000 : pnp 00:01
      0000-0000 : pnp 00:01
----- /proc/ioports end -----
----- /proc/interrupts -----
    0:         23          0          0          0  IR-IO-APIC   2-edge      timer
    1:          0          0          0          4  IR-IO-APIC   1-edge      i8042
    8:          1          0          0          0  IR-IO-APIC   8-edge      rtc0
    9:          0          4          0          0  IR-IO-APIC   9-fasteoi   acpi
   12:          0          0          6          0  IR-IO-APIC  12-edge      i8042
   16:          0          0         29          0  IR-IO-APIC  16-fasteoi   ehci_hcd:usb1
   17:          0          0          2          0  IR-IO-APIC  17-fasteoi   firewire_ohci
   18:          0          0          0          0  IR-IO-APIC  18-fasteoi   i801_smbus
   19:          0          0          0          0  IR-IO-APIC  19-fasteoi   ahci[0000:04:00.0]
   23:          0          0          0        238  IR-IO-APIC  23-fasteoi   ehci_hcd:usb2
   24:          0          0          0          0  DMAR-MSI   0-edge      dmar0
   25:          0          0          0          0  DMAR-MSI   1-edge      dmar1
   33:          0          0          0      34873  IR-PCI-MSI 512000-edge      ahci[0000:00:1f.2]
   34:          0          0          0          0  IR-PCI-MSI 4194304-edge      ahci[0000:08:00.0]
   35:          0          0          0          0  IR-PCI-MSI 1572864-edge      xhci_hcd
   36:          0          0          0          0  IR-PCI-MSI 1572865-edge      xhci_hcd
   37:          0          0          0          0  IR-PCI-MSI 1572866-edge      xhci_hcd
   38:          0          0          0          0  IR-PCI-MSI 1572867-edge      xhci_hcd
   39:          0          0          0          0  IR-PCI-MSI 1572868-edge      xhci_hcd
   40:          0          0          0          0  IR-PCI-MSI 2621440-edge      xhci_hcd
   41:          0          0          0          0  IR-PCI-MSI 2621441-edge      xhci_hcd
   42:          0          0          0          0  IR-PCI-MSI 2621442-edge      xhci_hcd
   43:          0          0          0          0  IR-PCI-MSI 2621443-edge      xhci_hcd
   44:          0          0          0          0  IR-PCI-MSI 2621444-edge      xhci_hcd
   45:          0         79      20146         50  IR-PCI-MSI 409600-edge      eth0
   46:          0          0          0         18  IR-PCI-MSI 360448-edge      mei_me
   47:          0        727          0          0  IR-PCI-MSI 32768-edge      i915
   48:          0          0        543          0  IR-PCI-MSI 442368-edge      snd_hda_intel:card1
  NMI:         92         92         92         92   Non-maskable interrupts
  LOC:    1080203    1098469    1088136    1081080   Local timer interrupts
  SPU:          0          0          0          0   Spurious interrupts
  PMI:         92         92         92         92   Performance monitoring interrupts
  IWI:          0          3          0          3   IRQ work interrupts
  RTR:          0          0          0          0   APIC ICR read retries
  RES:      14882      19064      18593      14800   Rescheduling interrupts
  CAL:       5872       4769       3958       4531   Function call interrupts
  TLB:       5222       3680       2470       3111   TLB shootdowns
  TRM:     356440     356435     356434     356423   Thermal event interrupts
  THR:          0          0          0          0   Threshold APIC interrupts
  DFR:          0          0          0          0   Deferred Error APIC interrupts
  MCE:          0          0          0          0   Machine check exceptions
  MCP:          7          8          8          8   Machine check polls
  HYP:          0          0          0          0   Hypervisor callback interrupts
  HRE:          0          0          0          0   Hyper-V reenlightenment interrupts
  HVS:          0          0          0          0   Hyper-V stimer0 interrupts
  ERR:          0
  MIS:          0
  PIN:          0          0          0          0   Posted-interrupt notification event
  NPI:          0          0          0          0   Nested posted-interrupt event
  PIW:          0          0          0          0   Posted-interrupt wakeup event
----- /proc/interrupts end -----
----- /proc/dma -----
   4: cascade
----- /proc/dma end -----
>> misc.3: FPU
>> misc.3.1: DMA
>> misc.3.2: PIC
>> misc.3.3: timer
>> misc.3.4: RTC
>> cpu.1: cpuinfo
----- /proc/cpuinfo -----
  processor	: 0
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 1605.243
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 0
  cpu cores	: 4
  apicid		: 0
  initial apicid	: 0
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
  processor	: 1
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 1605.215
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 1
  cpu cores	: 4
  apicid		: 2
  initial apicid	: 2
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
  processor	: 2
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 1605.164
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 2
  cpu cores	: 4
  apicid		: 4
  initial apicid	: 4
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
  processor	: 3
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 1605.172
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 3
  cpu cores	: 4
  apicid		: 6
  initial apicid	: 6
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
----- /proc/cpuinfo end -----
>> memory.1: main memory size
  kcore mem:  0x0
  klog mem 0: 0x0
  klog mem 1: 0x0
  klog mem:   0x0
  bios mem:   0x0
  meminfo:    0x3e1fc7000
  xen balloon:    0x0
>> pci.1: sysfs drivers
----- sysfs driver list (id 0x05dc74eaa15afbf3) -----
       serio_raw: module = serio_raw
         psmouse: module = psmouse
snd_hda_codec_generic: module = snd_hda_codec_generic
snd_hda_codec_hdmi: /devices/pci0000:00/0000:00:1b.0/hdaudioC1D3
snd_hda_codec_hdmi: module = snd_hda_codec_hdmi
snd_hda_codec_realtek: /devices/pci0000:00/0000:00:1b.0/hdaudioC1D0
snd_hda_codec_realtek: module = snd_hda_codec_realtek
        coretemp: /devices/platform/coretemp.0
        coretemp: module = coretemp
       reg-dummy: /devices/platform/reg-dummy
        iTCO_wdt: /devices/pci0000:00/0000:00:1f.0/iTCO_wdt.1.auto
        iTCO_wdt: module = iTCO_wdt
        acpi-fan: /devices/platform/PNP0C0B:03
        acpi-fan: /devices/platform/PNP0C0B:01
        acpi-fan: /devices/platform/PNP0C0B:04
        acpi-fan: /devices/platform/PNP0C0B:02
        acpi-fan: /devices/platform/PNP0C0B:00
        acpi-wmi: /devices/pci0000:00/PNP0C14:00
        acpi-wmi: /devices/platform/PNP0C14:01
        acpi-wmi: module = wmi
  intel_rapl_msr: /devices/platform/intel_rapl_msr.0
  intel_rapl_msr: module = intel_rapl_msr
      alarmtimer: /devices/pnp0/00:02/rtc/rtc0/alarmtimer.0.auto
       eeepc-wmi: /devices/platform/eeepc-wmi
       eeepc-wmi: module = asus_wmi
      serial8250: /devices/platform/serial8250
           i8042: /devices/platform/i8042
          pcspkr: module = snd_pcsp
          pcspkr: /devices/platform/pcspkr
        ata_piix: module = ata_piix
        ehci-pci: /devices/pci0000:00/0000:00:1a.0
        ehci-pci: /devices/pci0000:00/0000:00:1d.0
      snb_uncore: /devices/pci0000:00/0000:00:00.0
      snb_uncore: module = intel_uncore
        xhci_hcd: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0
        xhci_hcd: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0
          shpchp: module = shpchp
   snd_hda_intel: /devices/pci0000:00/0000:00:1b.0
   snd_hda_intel: module = snd_hda_intel
            ahci: /devices/pci0000:00/0000:00:1f.2
            ahci: /devices/pci0000:00/0000:00:1c.7/0000:08:00.0
            ahci: /devices/pci0000:00/0000:00:1c.3/0000:04:00.0
            ahci: module = ahci
        pcieport: /devices/pci0000:00/0000:00:1c.0
        pcieport: /devices/pci0000:00/0000:00:01.0
        pcieport: /devices/pci0000:00/0000:00:1c.7
        pcieport: /devices/pci0000:00/0000:00:1c.3
        pcieport: /devices/pci0000:00/0000:00:1c.1
        pcieport: /devices/pci0000:00/0000:00:1c.6
        pcieport: /devices/pci0000:00/0000:00:1c.4
   firewire_ohci: /devices/pci0000:00/0000:00:1c.6/0000:06:00.0/0000:07:02.0
   firewire_ohci: module = firewire_ohci
         lpc_ich: /devices/pci0000:00/0000:00:1f.0
         lpc_ich: module = lpc_ich
      virtio-pci: module = virtio_pci
          mei_me: /devices/pci0000:00/0000:00:16.0
          mei_me: module = mei_me
          e1000e: /devices/pci0000:00/0000:00:19.0
          e1000e: module = e1000e
      i801_smbus: /devices/pci0000:00/0000:00:1f.3
      i801_smbus: module = i2c_i801
            i915: /devices/pci0000:00/0000:00:02.0
            i915: module = i915
        uhci_hcd: module = uhci_hcd
       processor: /devices/system/cpu/cpu7
       processor: /devices/system/cpu/cpu5
       processor: /devices/system/cpu/cpu3
       processor: /devices/system/cpu/cpu1
       processor: /devices/system/cpu/cpu6
^[[13;5Rrocessor: /devices/system/cpu/cpu4
       processor: /devices/system/cpu/cpu2
       processor: /devices/system/cpu/cpu0
        mei_hdcp: /devices/pci0000:00/0000:00:16.0/0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04
        mei_hdcp: module = mei_hdcp
              sr: /devices/pci0000:00/0000:00:1f.2/ata5/host4/target4:0:0/4:0:0:0
              sd: /devices/pci0000:00/0000:00:1f.2/ata6/host5/target5:0:0/5:0:0:0
     hid-generic: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:1D50:6122.0002
     hid-generic: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005
     hid-generic: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2/0003:1D50:6122.0003
     hid-generic: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0/0003:1D50:6122.0001
     hid-generic: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3/0003:1D50:6122.0004
      magicmouse: module = hid_magicmouse
           ntrig: module = hid_ntrig
        rtc_cmos: /devices/pnp0/00:02
          system: /devices/pnp0/00:07
          system: /devices/pnp0/00:05
          system: /devices/pnp0/00:03
          system: /devices/pnp0/00:01
          system: /devices/pnp0/00:06
          system: /devices/pnp0/00:04
          system: /devices/pnp0/00:00
          usbhid: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4
          usbhid: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2
          usbhid: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0
          usbhid: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3
          usbhid: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1
          usbhid: module = usbhid
             usb: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5
             usb: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
             usb: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3
             usb: /devices/pci0000:00/0000:00:1d.0/usb2/2-1
             usb: /devices/pci0000:00/0000:00:1a.0/usb1
             usb: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7
             usb: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6
             usb: /devices/pci0000:00/0000:00:1a.0/usb1/1-1
             usb: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4
             usb: /devices/pci0000:00/0000:00:1d.0/usb2
           btusb: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0
           btusb: module = btusb
           btusb: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.1
             hub: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6/6-0:1.0
             hub: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1:1.0
             hub: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3/3-0:1.0
             hub: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4/4-0:1.0
             hub: /devices/pci0000:00/0000:00:1a.0/usb1/1-0:1.0
             hub: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5/5-0:1.0
             hub: module = usbcore
             hub: /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0
             hub: /devices/pci0000:00/0000:00:1d.0/usb2/2-0:1.0
           usbfs: module = usbcore
        wmi-bmof: /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP0C14:01/05901221-D566-11D1-B2F0-00A0C9062910
        wmi-bmof: module = wmi_bmof
         thermal: /devices/LNXSYSTM:00/LNXSYBUS:01/LNXTHERM:01
         thermal: /devices/LNXSYSTM:00/LNXSYBUS:01/LNXTHERM:00
           video: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00
          button: /devices/LNXSYSTM:00/LNXPWRBN:00
          button: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00
              ec: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/PNP0C09:00
----- sysfs driver list end -----
>> pci.2: get sysfs pci data
  pci device: name = 0000:03:00.0
    path = /devices/pci0000:00/0000:00:1c.1/0000:03:00.0
    modalias = "pci:v00001B21d00001042sv00001043sd00008488bc0Csc03i30"
    class = 0xc0330
    vendor = 0x1b21
    device = 0x1042
    subvendor = 0x1043
    subdevice = 0x8488
    irq = 17
    res[0] = 0xf7c00000 0xf7c07fff 0x140204
    config[64]
  pci device: name = 0000:00:1f.2
    path = /devices/pci0000:00/0000:00:1f.2
    modalias = "pci:v00008086d00001C02sv00001043sd0000844Dbc01sc06i01"
    class = 0x10601
    vendor = 0x8086
    device = 0x1c02
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 33
    res[0] = 0xf0d0 0xf0d7 0x40101
    res[1] = 0xf0c0 0xf0c3 0x40101
    res[2] = 0xf0b0 0xf0b7 0x40101
    res[3] = 0xf0a0 0xf0a3 0x40101
    res[4] = 0xf060 0xf07f 0x40101
    res[5] = 0xf7d26000 0xf7d267ff 0x40200
    config[64]
  pci device: name = 0000:00:1c.0
    path = /devices/pci0000:00/0000:00:1c.0
    modalias = "pci:v00008086d00001C10sv00001043sd0000844Dbc06sc04i00"
    class = 0x60400
    vendor = 0x8086
    device = 0x1c10
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 27
    config[64]
  pci device: name = 0000:00:1f.0
    path = /devices/pci0000:00/0000:00:1f.0
    modalias = "pci:v00008086d00001C44sv00001043sd0000844Dbc06sc01i00"
    class = 0x60100
    vendor = 0x8086
    device = 0x1c44
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 0
    config[64]
  pci device: name = 0000:00:01.0
    path = /devices/pci0000:00/0000:00:01.0
    modalias = "pci:v00008086d00000101sv00001043sd0000844Dbc06sc04i00"
    class = 0x60400
    vendor = 0x8086
    device = 0x101
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 26
    config[64]
  pci device: name = 0000:00:1c.7
    path = /devices/pci0000:00/0000:00:1c.7
    modalias = "pci:v00008086d00001C1Esv00001043sd0000844Dbc06sc04i00"
    class = 0x60400
    vendor = 0x8086
    device = 0x1c1e
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 32
    config[64]
  pci device: name = 0000:08:00.0
    path = /devices/pci0000:00/0000:00:1c.7/0000:08:00.0
    modalias = "pci:v00001B4Bd00009172sv00001043sd00008477bc01sc06i01"
    class = 0x10601
    vendor = 0x1b4b
    device = 0x9172
    subvendor = 0x1043
    subdevice = 0x8477
    irq = 34
    res[0] = 0xc040 0xc047 0x40101
    res[1] = 0xc030 0xc033 0x40101
    res[2] = 0xc020 0xc027 0x40101
    res[3] = 0xc010 0xc013 0x40101
    res[4] = 0xc000 0xc00f 0x40101
    res[5] = 0xf7810000 0xf78101ff 0x40200
    res[6] = 0xf7800000 0xf780ffff 0x46200
    config[64]
  pci device: name = 0000:00:16.0
    path = /devices/pci0000:00/0000:00:16.0
    modalias = "pci:v00008086d00001C3Asv00001043sd0000844Dbc07sc80i00"
    class = 0x78000
    vendor = 0x8086
    device = 0x1c3a
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 46
    res[0] = 0xf7d2c000 0xf7d2c00f 0x140204
    config[64]
  pci device: name = 0000:00:1b.0
    path = /devices/pci0000:00/0000:00:1b.0
    modalias = "pci:v00008086d00001C20sv00001043sd00008410bc04sc03i00"
    class = 0x40300
    vendor = 0x8086
    device = 0x1c20
    subvendor = 0x1043
    subdevice = 0x8410
    irq = 48
    res[0] = 0xf7d20000 0xf7d23fff 0x140204
    config[64]
  pci device: name = 0000:00:1c.3
    path = /devices/pci0000:00/0000:00:1c.3
    modalias = "pci:v00008086d00001C16sv00001043sd0000844Dbc06sc04i00"
    class = 0x60400
    vendor = 0x8086
    device = 0x1c16
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 29
    config[64]
  pci device: name = 0000:00:19.0
    path = /devices/pci0000:00/0000:00:19.0
    modalias = "pci:v00008086d00001503sv00001043sd0000849Cbc02sc00i00"
    class = 0x20000
    vendor = 0x8086
    device = 0x1503
    subvendor = 0x1043
    subdevice = 0x849c
    irq = 45
    label = "Onboard LAN"
    res[0] = 0xf7d00000 0xf7d1ffff 0x40200
    res[1] = 0xf7d29000 0xf7d29fff 0x40200
    res[2] = 0xf080 0xf09f 0x40101
    config[64]
  pci device: name = 0000:00:1f.3
    path = /devices/pci0000:00/0000:00:1f.3
    modalias = "pci:v00008086d00001C22sv00001043sd0000844Dbc0Csc05i00"
    class = 0xc0500
    vendor = 0x8086
    device = 0x1c22
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 18
    res[0] = 0xf7d25000 0xf7d250ff 0x140204
    res[4] = 0xf040 0xf05f 0x40101
    config[64]
  pci device: name = 0000:00:00.0
    path = /devices/pci0000:00/0000:00:00.0
    modalias = "pci:v00008086d00000100sv00001043sd0000844Dbc06sc00i00"
    class = 0x60000
    vendor = 0x8086
    device = 0x100
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 0
    config[64]
  pci device: name = 0000:00:1c.1
    path = /devices/pci0000:00/0000:00:1c.1
    modalias = "pci:v00008086d00001C12sv00001043sd0000844Dbc06sc04i00"
    class = 0x60400
    vendor = 0x8086
    device = 0x1c12
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 28
    config[64]
  pci device: name = 0000:06:00.0
    path = /devices/pci0000:00/0000:00:1c.6/0000:06:00.0
    modalias = "pci:v00001B21d00001080sv00001B21sd00001080bc06sc04i01"
    class = 0x60401
    vendor = 0x1b21
    device = 0x1080
    subvendor = 0x1b21
    subdevice = 0x1080
    irq = 18
    config[64]
  pci device: name = 0000:00:1a.0
    path = /devices/pci0000:00/0000:00:1a.0
    modalias = "pci:v00008086d00001C2Dsv00001043sd0000844Dbc0Csc03i20"
    class = 0xc0320
    vendor = 0x8086
    device = 0x1c2d
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 16
    res[0] = 0xf7d28000 0xf7d283ff 0x40200
    config[64]
  pci device: name = 0000:05:00.0
    path = /devices/pci0000:00/0000:00:1c.4/0000:05:00.0
    modalias = "pci:v00001B21d00001042sv00001043sd00008488bc0Csc03i30"
    class = 0xc0330
    vendor = 0x1b21
    device = 0x1042
    subvendor = 0x1043
    subdevice = 0x8488
    irq = 16
    res[0] = 0xf7a00000 0xf7a07fff 0x140204
    config[64]
  pci device: name = 0000:00:1d.0
    path = /devices/pci0000:00/0000:00:1d.0
    modalias = "pci:v00008086d00001C26sv00001043sd0000844Dbc0Csc03i20"
    class = 0xc0320
    vendor = 0x8086
    device = 0x1c26
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 23
    res[0] = 0xf7d27000 0xf7d273ff 0x40200
    config[64]
  pci device: name = 0000:00:1c.6
    path = /devices/pci0000:00/0000:00:1c.6
    modalias = "pci:v00008086d0000244Esv00001043sd0000844Dbc06sc04i01"
    class = 0x60401
    vendor = 0x8086
    device = 0x244e
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 31
    config[64]
  pci device: name = 0000:07:02.0
    path = /devices/pci0000:00/0000:00:1c.6/0000:06:00.0/0000:07:02.0
    modalias = "pci:v00001106d00003044sv00001043sd000081FEbc0Csc00i10"
    class = 0xc0010
    vendor = 0x1106
    device = 0x3044
    subvendor = 0x1043
    subdevice = 0x81fe
    irq = 17
    res[0] = 0xf7900000 0xf79007ff 0x40200
    res[1] = 0xd000 0xd07f 0x40101
    config[64]
  pci device: name = 0000:00:1c.4
    path = /devices/pci0000:00/0000:00:1c.4
    modalias = "pci:v00008086d00001C18sv00001043sd0000844Dbc06sc04i00"
    class = 0x60400
    vendor = 0x8086
    device = 0x1c18
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 30
    config[64]
  pci device: name = 0000:04:00.0
    path = /devices/pci0000:00/0000:00:1c.3/0000:04:00.0
    modalias = "pci:v0000197Bd00002362sv00001043sd00008460bc01sc06i01"
    class = 0x10601
    vendor = 0x197b
    device = 0x2362
    subvendor = 0x1043
    subdevice = 0x8460
    irq = 19
    res[0] = 0xe040 0xe047 0x40101
    res[1] = 0xe030 0xe033 0x40101
    res[2] = 0xe020 0xe027 0x40101
    res[3] = 0xe010 0xe013 0x40101
    res[4] = 0xe000 0xe00f 0x40101
    res[5] = 0xf7b10000 0xf7b101ff 0x40200
    res[6] = 0xf7b00000 0xf7b0ffff 0x46200
    config[64]
  pci device: name = 0000:00:02.0
    path = /devices/pci0000:00/0000:00:02.0
    modalias = "pci:v00008086d00000102sv00001043sd0000844Dbc03sc00i00"
    class = 0x30000
    vendor = 0x8086
    device = 0x102
    subvendor = 0x1043
    subdevice = 0x844d
    irq = 47
    label = "Onboard IGD"
    res[0] = 0xf7400000 0xf77fffff 0x140204
    res[2] = 0xe0000000 0xefffffff 0x14220c
    res[4] = 0xf000 0xf03f 0x40101
    res[6] = 0xc0000 0xdffff 0x212
    config[64]
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-HDMI-A-1/edid (size: 0)
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-VGA-1/edid (size: 0)
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/edid (size: 0)
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-HDMI-A-2/edid (size: 0)
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-3/edid (size: 0)
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-HDMI-A-3/edid (size: 128)
      00 ff ff ff ff ff ff 00 4d d9 01 c9 01 01 01 01  "........M......."
      01 13 01 03 80 a0 5a 78 0a 0d c9 a0 57 47 98 27  "......Zx....WG.'"
      12 48 4c 21 08 00 81 80 01 01 01 01 01 01 01 01  ".HL!............"
      01 01 01 01 01 01 02 3a 80 18 71 38 2d 40 58 2c  ".......:..q8-@X,"
      45 00 40 84 63 00 00 1e 01 1d 00 72 51 d0 1e 20  "E.@.c......rQ.. "
      6e 28 55 00 40 84 63 00 00 1e 00 00 00 fc 00 53  "n(U.@.c........S"
      4f 4e 59 20 54 56 0a 20 20 20 20 20 00 00 00 fd  "ONY TV.     ...."
      00 30 3e 0e 46 0f 00 0a 20 20 20 20 20 20 01 e4  ".0>.F...      .."
    found edid file at /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/edid (size: 0)
---------- PCI raw data ----------
bus 03, slot 00, func 0, vend:dev:s_vend:s_dev:rev 1b21:1042:1043:8488:00
class 0c, sub_class 03 prog_if 30, hdr 0, flags <>, irq 17
  addr0 f7c00000, size 00008000
  00: 21 1b 42 10 06 04 10 00 00 30 03 0c 10 00 00 00  "!.B......0......"
  10: 04 00 c0 f7 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 88 84  "............C..."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 00  "....P..........."

bus 00, slot 1f, func 2, vend:dev:s_vend:s_dev:rev 8086:1c02:1043:844d:05
class 01, sub_class 06 prog_if 01, hdr 0, flags <>, irq 33
  addr0 0000f0d0, size 00000008
  addr1 0000f0c0, size 00000004
  addr2 0000f0b0, size 00000008
  addr3 0000f0a0, size 00000004
  addr4 0000f060, size 00000020
  addr5 f7d26000, size 00000800
  00: 86 80 02 1c 07 04 b0 02 05 01 06 01 00 00 00 00  "................"
  10: d1 f0 00 00 c1 f0 00 00 b1 f0 00 00 a1 f0 00 00  "................"
  20: 61 f0 00 00 00 60 d2 f7 00 00 00 00 43 10 4d 84  "a....`......C.M."
  30: 00 00 00 00 80 00 00 00 00 00 00 00 0a 02 00 00  "................"

bus 00->02, slot 1c, func 0, vend:dev:s_vend:s_dev:rev 8086:1c10:1043:844d:b5
class 06, sub_class 04 prog_if 00, hdr 1, flags <>, irq 27
  00: 86 80 10 1c 07 04 10 00 b5 00 04 06 10 00 81 00  "................"
  10: 00 00 00 00 00 00 00 00 00 02 02 00 20 20 00 20  "............  . "
  20: b0 df c0 df d1 df e1 df 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 40 00 00 00 00 00 00 00 0b 01 12 00  "....@..........."

bus 00, slot 1f, func 0, vend:dev:s_vend:s_dev:rev 8086:1c44:1043:844d:05
class 06, sub_class 01 prog_if 00, hdr 0, flags <>, irq 0
  00: 86 80 44 1c 07 00 10 02 05 00 01 06 00 00 80 00  "..D............."
  10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "............C.M."
  30: 00 00 00 00 e0 00 00 00 00 00 00 00 00 00 00 00  "................"

bus 00->01, slot 01, func 0, vend:dev:s_vend:s_dev:rev 8086:0101:1043:844d:09
class 06, sub_class 04 prog_if 00, hdr 1, flags <>, irq 26
  00: 86 80 01 01 07 04 10 00 09 00 04 06 10 00 81 00  "................"
  10: 00 00 00 00 00 00 00 00 00 01 01 00 f0 00 00 00  "................"
  20: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 88 00 00 00 00 00 00 00 0b 01 12 00  "................"

bus 00->08, slot 1c, func 7, vend:dev:s_vend:s_dev:rev 8086:1c1e:1043:844d:b5
class 06, sub_class 04 prog_if 00, hdr 1, flags <>, irq 32
  00: 86 80 1e 1c 07 04 10 00 b5 00 04 06 10 00 81 00  "................"
  10: 00 00 00 00 00 00 00 00 00 08 08 00 c0 c0 00 00  "................"
  20: 80 f7 80 f7 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 40 00 00 00 00 00 00 00 0a 04 12 00  "....@..........."

bus 08, slot 00, func 0, vend:dev:s_vend:s_dev:rev 1b4b:9172:1043:8477:11
class 01, sub_class 06 prog_if 01, hdr 0, flags <>, irq 34
  addr0 0000c040, size 00000008
  addr1 0000c030, size 00000004
  addr2 0000c020, size 00000008
  addr3 0000c010, size 00000004
  addr4 0000c000, size 00000010
  addr5 f7810000, size 00000200
  00: 4b 1b 72 91 07 04 10 00 11 01 06 01 10 00 00 00  "K.r............."
  10: 41 c0 00 00 31 c0 00 00 21 c0 00 00 11 c0 00 00  "A...1...!......."
  20: 01 c0 00 00 00 00 81 f7 00 00 00 00 43 10 77 84  "............C.w."
  30: 00 00 80 f7 40 00 00 00 00 00 00 00 0a 01 00 00  "....@..........."

bus 00, slot 16, func 0, vend:dev:s_vend:s_dev:rev 8086:1c3a:1043:844d:04
class 07, sub_class 80 prog_if 00, hdr 0, flags <>, irq 46
  addr0 f7d2c000, size 00000010
  00: 86 80 3a 1c 06 04 10 00 04 00 80 07 00 00 80 00  "..:............."
  10: 04 c0 d2 f7 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "............C.M."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 00  "....P..........."

bus 00, slot 1b, func 0, vend:dev:s_vend:s_dev:rev 8086:1c20:1043:8410:05
class 04, sub_class 03 prog_if 00, hdr 0, flags <>, irq 48
  addr0 f7d20000, size 00004000
  00: 86 80 20 1c 06 04 10 00 05 00 03 04 10 00 00 00  ".. ............."
  10: 04 00 d2 f7 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 10 84  "............C..."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 04 01 00 00  "....P..........."

bus 00->04, slot 1c, func 3, vend:dev:s_vend:s_dev:rev 8086:1c16:1043:844d:b5
class 06, sub_class 04 prog_if 00, hdr 1, flags <>, irq 29
  00: 86 80 16 1c 07 04 10 00 b5 00 04 06 10 00 81 00  "................"
  10: 00 00 00 00 00 00 00 00 00 04 04 00 e0 e0 00 20  "............... "
  20: b0 f7 b0 f7 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 40 00 00 00 00 00 00 00 0a 04 12 00  "....@..........."

bus 00, slot 19, func 0, vend:dev:s_vend:s_dev:rev 8086:1503:1043:849c:05
class 02, sub_class 00 prog_if 00, hdr 0, flags <>, irq 45
  addr0 f7d00000, size 00020000
  addr1 f7d29000, size 00001000
  addr2 0000f080, size 00000020
  00: 86 80 03 15 07 04 10 00 05 00 00 02 00 00 00 00  "................"
  10: 00 00 d0 f7 00 90 d2 f7 81 f0 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 9c 84  "............C..."
  30: 00 00 00 00 c8 00 00 00 00 00 00 00 03 01 00 00  "................"

bus 00, slot 1f, func 3, vend:dev:s_vend:s_dev:rev 8086:1c22:1043:844d:05
class 0c, sub_class 05 prog_if 00, hdr 0, flags <>, irq 18
  addr0 f7d25000, size 00000100
  addr4 0000f040, size 00000020
  00: 86 80 22 1c 03 00 80 02 05 00 05 0c 00 00 00 00  ".."............."
  10: 04 50 d2 f7 00 00 00 00 00 00 00 00 00 00 00 00  ".P.............."
  20: 41 f0 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "A...........C.M."
  30: 00 00 00 00 00 00 00 00 00 00 00 00 05 03 00 00  "................"

bus 00, slot 00, func 0, vend:dev:s_vend:s_dev:rev 8086:0100:1043:844d:09
class 06, sub_class 00 prog_if 00, hdr 0, flags <>, irq 0
  00: 86 80 00 01 06 00 90 20 09 00 00 06 00 00 00 00  "....... ........"
  10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "............C.M."
  30: 00 00 00 00 e0 00 00 00 00 00 00 00 00 00 00 00  "................"

bus 00->03, slot 1c, func 1, vend:dev:s_vend:s_dev:rev 8086:1c12:1043:844d:b5
class 06, sub_class 04 prog_if 00, hdr 1, flags <>, irq 28
  00: 86 80 12 1c 07 04 10 00 b5 00 04 06 10 00 81 00  "................"
  10: 00 00 00 00 00 00 00 00 00 03 03 00 f0 00 00 00  "................"
  20: c0 f7 c0 f7 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 40 00 00 00 00 00 00 00 0b 02 12 00  "....@..........."

bus 06->07, slot 00, func 0, vend:dev:s_vend:s_dev:rev 1b21:1080:1b21:1080:01
class 06, sub_class 04 prog_if 01, hdr 1, flags <>, irq 18
  00: 21 1b 80 10 07 00 10 00 01 01 04 06 10 00 01 00  "!..............."
  10: 00 00 00 00 00 00 00 00 06 07 07 20 d1 d1 20 20  "........... ..  "
  20: 90 f7 90 f7 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 c0 00 00 00 00 00 00 00 05 01 12 00  "................"

bus 00, slot 1a, func 0, vend:dev:s_vend:s_dev:rev 8086:1c2d:1043:844d:05
class 0c, sub_class 03 prog_if 20, hdr 0, flags <>, irq 16
  addr0 f7d28000, size 00000400
  00: 86 80 2d 1c 06 00 90 02 05 20 03 0c 00 00 00 00  "..-...... ......"
  10: 00 80 d2 f7 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "............C.M."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 00  "....P..........."

bus 05, slot 00, func 0, vend:dev:s_vend:s_dev:rev 1b21:1042:1043:8488:00
class 0c, sub_class 03 prog_if 30, hdr 0, flags <>, irq 16
  addr0 f7a00000, size 00008000
  00: 21 1b 42 10 06 04 10 00 00 30 03 0c 10 00 00 00  "!.B......0......"
  10: 04 00 a0 f7 00 00 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 88 84  "............C..."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 00  "....P..........."

bus 00, slot 1d, func 0, vend:dev:s_vend:s_dev:rev 8086:1c26:1043:844d:05
class 0c, sub_class 03 prog_if 20, hdr 0, flags <>, irq 23
  addr0 f7d27000, size 00000400
  00: 86 80 26 1c 06 00 90 02 05 20 03 0c 00 00 00 00  "..&...... ......"
  10: 00 70 d2 f7 00 00 00 00 00 00 00 00 00 00 00 00  ".p.............."
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "............C.M."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 0a 01 00 00  "....P..........."

bus 00->06, slot 1c, func 6, vend:dev:s_vend:s_dev:rev 8086:244e:1043:844d:b5
class 06, sub_class 04 prog_if 01, hdr 1, flags <>, irq 31
  00: 86 80 4e 24 07 04 10 00 b5 01 04 06 10 00 81 00  "..N$............"
  10: 00 00 00 00 00 00 00 00 00 06 07 00 d0 d0 00 20  "............... "
  20: 90 f7 90 f7 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 40 00 00 00 00 00 00 00 05 03 12 00  "....@..........."

bus 07, slot 02, func 0, vend:dev:s_vend:s_dev:rev 1106:3044:1043:81fe:c0
class 0c, sub_class 00 prog_if 10, hdr 0, flags <>, irq 17
  addr0 f7900000, size 00000800
  addr1 0000d000, size 00000080
  00: 06 11 44 30 07 00 10 02 c0 10 00 0c 10 20 00 00  "..D0......... .."
  10: 00 00 90 f7 01 d0 00 00 00 00 00 00 00 00 00 00  "................"
  20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 fe 81  "............C..."
  30: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 20  "....P.......... "

bus 00->05, slot 1c, func 4, vend:dev:s_vend:s_dev:rev 8086:1c18:1043:844d:b5
class 06, sub_class 04 prog_if 00, hdr 1, flags <>, irq 30
  00: 86 80 18 1c 07 04 10 00 b5 00 04 06 10 00 81 00  "................"
  10: 00 00 00 00 00 00 00 00 00 05 05 00 f0 00 00 00  "................"
  20: a0 f7 a0 f7 f1 ff 01 00 00 00 00 00 00 00 00 00  "................"
  30: 00 00 00 00 40 00 00 00 00 00 00 00 0b 01 12 00  "....@..........."

bus 04, slot 00, func 0, vend:dev:s_vend:s_dev:rev 197b:2362:1043:8460:10
class 01, sub_class 06 prog_if 01, hdr 0, flags <>, irq 19
  addr0 0000e040, size 00000008
  addr1 0000e030, size 00000004
  addr2 0000e020, size 00000008
  addr3 0000e010, size 00000004
  addr4 0000e000, size 00000010
  addr5 f7b10000, size 00000200
  00: 7b 19 62 23 07 00 10 00 10 01 06 01 10 00 00 00  "{.b#............"
  10: 41 e0 00 00 31 e0 00 00 21 e0 00 00 11 e0 00 00  "A...1...!......."
  20: 01 e0 00 00 00 00 b1 f7 00 00 00 00 43 10 60 84  "............C.`."
  30: 00 00 00 00 8c 00 00 00 00 00 00 00 0a 01 00 00  "................"

bus 00, slot 02, func 0, vend:dev:s_vend:s_dev:rev 8086:0102:1043:844d:09
class 03, sub_class 00 prog_if 00, hdr 0, flags <>, irq 47
  addr0 f7400000, size 00400000
  addr2 e0000000, size 10000000
  addr4 0000f000, size 00000040
  00: 86 80 02 01 07 04 90 00 09 00 00 03 00 00 00 00  "................"
  10: 04 00 40 f7 00 00 00 00 0c 00 00 e0 00 00 00 00  "..@............."
  20: 01 f0 00 00 00 00 00 00 00 00 00 00 43 10 4d 84  "............C.M."
  30: 00 00 00 00 90 00 00 00 00 00 00 00 0b 01 00 00  "................"
---------- PCI raw data end ----------
>> pci.4: build list
>> pci.3: macio
sysfs: no such bus: macio
>> pci.4: vio
sysfs: no such bus: vio
>> pci.5: xen
sysfs: no such bus: xen
>> pci.6: ps3
sysfs: no such bus: ps3_system_bus
>> pci.7: platform
  platform device: name = PNP0C14:00
    path = /devices/pci0000:00/PNP0C14:00
    type = "", modalias = "acpi:PNP0C14:", driver = "acpi-wmi"
  platform device: name = alarmtimer.0.auto
    path = /devices/pnp0/00:02/rtc/rtc0/alarmtimer.0.auto
    type = "", modalias = "platform:alarmtimer", driver = "alarmtimer"
  platform device: name = reg-dummy
    path = /devices/platform/reg-dummy
    type = "", modalias = "platform:reg-dummy", driver = "reg-dummy"
  platform device: name = PNP0C09:00
    path = /devices/pci0000:00/0000:00:1f.0/PNP0C09:00
    type = "", modalias = "acpi:PNP0C09:", driver = ""
  platform device: name = PNP0C0B:03
    path = /devices/platform/PNP0C0B:03
    type = "", modalias = "acpi:PNP0C0B:", driver = "acpi-fan"
  platform device: name = PNP0C0B:01
    path = /devices/platform/PNP0C0B:01
    type = "", modalias = "acpi:PNP0C0B:", driver = "acpi-fan"
  platform device: name = platform-framebuffer.0
    path = /devices/platform/platform-framebuffer.0
    type = "", modalias = "platform:platform-framebuffer", driver = ""
  platform device: name = microcode
    path = /devices/platform/microcode
    type = "", modalias = "platform:microcode", driver = ""
  platform device: name = intel_rapl_msr.0
    path = /devices/platform/intel_rapl_msr.0
    type = "", modalias = "platform:intel_rapl_msr", driver = "intel_rapl_msr"
  platform device: name = Fixed MDIO bus.0
    path = /devices/platform/Fixed MDIO bus.0
    type = "", modalias = "platform:Fixed MDIO bus", driver = ""
  platform device: name = PNP0C0C:00
    path = /devices/platform/PNP0C0C:00
    type = "", modalias = "acpi:PNP0C0C:", driver = ""
  platform device: name = INT0800:00
    path = /devices/pci0000:00/0000:00:1f.0/INT0800:00
    type = "", modalias = "acpi:INT0800:", driver = ""
  platform device: name = PNP0C14:01
    path = /devices/platform/PNP0C14:01
    type = "", modalias = "acpi:PNP0C14:", driver = "acpi-wmi"
  platform device: name = PNP0C0B:04
    path = /devices/platform/PNP0C0B:04
    type = "", modalias = "acpi:PNP0C0B:", driver = "acpi-fan"
  platform device: name = PNP0C0B:02
    path = /devices/platform/PNP0C0B:02
    type = "", modalias = "acpi:PNP0C0B:", driver = "acpi-fan"
  platform device: name = coretemp.0
    path = /devices/platform/coretemp.0
    type = "", modalias = "platform:coretemp", driver = "coretemp"
  platform device: name = eeepc-wmi
    path = /devices/platform/eeepc-wmi
    type = "", modalias = "platform:eeepc-wmi", driver = "eeepc-wmi"
  platform device: name = PNP0C0B:00
    path = /devices/platform/PNP0C0B:00
    type = "", modalias = "acpi:PNP0C0B:", driver = "acpi-fan"
  platform device: name = PNP0103:00
    path = /devices/pci0000:00/0000:00:1f.0/PNP0103:00
    type = "", modalias = "acpi:PNP0103:", driver = ""
  platform device: name = PNP0C04:00
    path = /devices/pci0000:00/0000:00:1f.0/PNP0C04:00
    type = "", modalias = "acpi:PNP0C04:", driver = ""
  platform device: name = serial8250
    path = /devices/platform/serial8250
    type = "", modalias = "platform:serial8250", driver = "serial8250"
  platform device: name = i8042
    path = /devices/platform/i8042
    type = "", modalias = "platform:i8042", driver = "i8042"
  platform device: name = iTCO_wdt.1.auto
    path = /devices/pci0000:00/0000:00:1f.0/iTCO_wdt.1.auto
    type = "", modalias = "platform:iTCO_wdt", driver = "iTCO_wdt"
  platform device: name = pcspkr
    path = /devices/platform/pcspkr
    type = "", modalias = "platform:pcspkr", driver = "pcspkr"
>> pci.8: of_platform
sysfs: no such bus: of_platform
>> pci.9: vm
sysfs: no such bus: vm
>> pci.10: virtio
sysfs: no such bus: virtio
>> pci.11: ibmebus
sysfs: no such bus: ibmebus
>> pci.12: uisvirtpci
sysfs: no such bus: uisvirtpci
>> pci.13: mmc
sysfs: no such bus: mmc
>> pci.14: sdio
sysfs: no such bus: sdio
>> pci.15: nd
sysfs: no such bus: nd
>> pci.16: visorbus
sysfs: no such bus: visorbus
>> pci.17: mdio
  mdio device: name = fixed-0:1f
    path = /devices/platform/Fixed MDIO bus.0/mdio_bus/fixed-0/fixed-0:1f
>> monitor.1: ddc
>> monitor.2: bios
>> monitor.3: pci
  detailed timings:
  #0: 02 3a 80 18 71 38 2d 40 58 2c 45 00 40 84 63 00 00 1e  ".:..q8-@X,E.@.c..."
    h: 1920 2008 2052 2200 (+88 +132 +280)
    v: 1080 1084 1089 1125 (+4 +9 +45)
    +hsync +vsync
    148.5 MHz, 67.5 kHz, 60.0 Hz
  #1: 01 1d 00 72 51 d0 1e 20 6e 28 55 00 40 84 63 00 00 1e  "...rQ.. n(U.@.c..."
    h: 1280 1390 1430 1650 (+110 +150 +370)
    v:  720  725  730  750 (+5 +10 +30)
    +hsync +vsync
    74.2 MHz, 45.0 kHz, 60.0 Hz
  #2: 00 00 00 fc 00 53 4f 4e 59 20 54 56 0a 20 20 20 20 20  ".....SONY TV.     "
  #3: 00 00 00 fd 00 30 3e 0e 46 0f 00 0a 20 20 20 20 20 20  ".....0>.F...      "
----- DDC info -----
  model: "SONY TV"
  size: 1280 x 720
  size (mm): 1600 x 900
  clock: 74250 kHz
  hsync: 14-70 kHz
  vsync: 48-62 Hz
  manu. year: 2009
----- DDC info end -----
>> pcmcia.1: sysfs drivers
>> pcmcia.2: pcmcia
sysfs: no such bus: pcmcia
>> pcmcia.3: pcmcia ctrl
sysfs: no such class: pcmcia_socket
>> serial.1: read info
----- /proc/tty/driver/serial -----
  0: uart:unknown port:000003F8 irq:4
  1: uart:unknown port:000002F8 irq:3
  2: uart:unknown port:000003E8 irq:4
  3: uart:unknown port:000002E8 irq:3
  4: uart:unknown port:00000000 irq:0
  5: uart:unknown port:00000000 irq:0
  6: uart:unknown port:00000000 irq:0
  7: uart:unknown port:00000000 irq:0
  8: uart:unknown port:00000000 irq:0
  9: uart:unknown port:00000000 irq:0
  10: uart:unknown port:00000000 irq:0
  11: uart:unknown port:00000000 irq:0
  12: uart:unknown port:00000000 irq:0
  13: uart:unknown port:00000000 irq:0
  14: uart:unknown port:00000000 irq:0
  15: uart:unknown port:00000000 irq:0
----- /proc/tty/driver/serial end -----
----- serial info -----
----- serial info end -----
>> serial.2: build list
>> misc.5: misc data
----- misc resources -----
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:00"
i/o:1 0x0000 - 0x0000 (0x01) "dma1"
i/o:1 0x0000 - 0x0000 (0x01) "pic1"
i/o:0 0x0000 - 0x0000 (0x01) "timer0"
i/o:0 0x0000 - 0x0000 (0x01) "timer1"
i/o:1 0x0000 - 0x0000 (0x01) "keyboard"
i/o:0 0x0000 - 0x0000 (0x01) "PNP0C09:00"
i/o:0 0x0000 - 0x0000 (0x01) "EC data"
i/o:1 0x0000 - 0x0000 (0x01) "keyboard"
i/o:0 0x0000 - 0x0000 (0x01) "PNP0C09:00"
i/o:0 0x0000 - 0x0000 (0x01) "EC cmd"
i/o:0 0x0000 - 0x0000 (0x01) "rtc0"
i/o:1 0x0000 - 0x0000 (0x01) "dma page reg"
i/o:1 0x0000 - 0x0000 (0x01) "pic2"
i/o:1 0x0000 - 0x0000 (0x01) "dma2"
i/o:0 0x0000 - 0x0000 (0x01) "PNP0C04:00"
i/o:1 0x0000 - 0x0000 (0x01) "fpu"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:04"
i/o:1 0x0000 - 0x0000 (0x01) "vga+"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "ACPI PM1a_EVT_BLK"
i/o:0 0x0000 - 0x0000 (0x01) "ACPI PM1a_CNT_BLK"
i/o:0 0x0000 - 0x0000 (0x01) "ACPI PM_TMR"
i/o:0 0x0000 - 0x0000 (0x01) "ACPI GPE0_BLK"
i/o:0 0x0000 - 0x0000 (0x01) "iTCO_wdt.1.auto"
i/o:0 0x0000 - 0x0000 (0x01) "iTCO_wdt"
i/o:0 0x0000 - 0x0000 (0x01) "ACPI PM2_CNT_BLK"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:03"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "iTCO_wdt.1.auto"
i/o:0 0x0000 - 0x0000 (0x01) "iTCO_wdt"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:05"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "PCI conf1"
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:00"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:02"
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:08"
i/o:0 0x0000 - 0x0000 (0x01) "0000:08:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:08:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:08:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:08:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:08:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:06"
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:07"
i/o:0 0x0000 - 0x0000 (0x01) "0000:07:02.0"
i/o:0 0x0000 - 0x0000 (0x01) "PCI Bus 0000:04"
i/o:0 0x0000 - 0x0000 (0x01) "0000:04:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:04:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:04:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:04:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:04:00.0"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:02.0"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:1f.3"
i/o:0 0x0000 - 0x0000 (0x01) "i801_smbus"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:1f.2"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:19.0"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:1f.2"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:1f.2"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:1f.2"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "0000:00:1f.2"
i/o:0 0x0000 - 0x0000 (0x01) "ahci"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
i/o:0 0x0000 - 0x0000 (0x01) "pnp 00:01"
irq:0  0 (       23) "2-edge      timer"
irq:0  1 (        4) "1-edge      i8042"
irq:0  8 (        1) "8-edge      rtc0"
irq:0  9 (        4) "9-fasteoi   acpi"
irq:0 12 (        6) "12-edge      i8042"
irq:0 16 (       29) "16-fasteoi   ehci_hcd:usb1"
irq:0 17 (        2) "17-fasteoi   firewire_ohci"
irq:0 18 (        0) "18-fasteoi   i801_smbus"
irq:0 19 (        0) "19-fasteoi   ahci[0000:04:00.0]"
irq:0 23 (      238) "23-fasteoi   ehci_hcd:usb2"
irq:0 24 (        0) "0-edge      dmar0"
irq:0 25 (        0) "1-edge      dmar1"
irq:0 33 (    34873) "512000-edge      ahci[0000:00:1f.2]"
irq:0 34 (        0) "4194304-edge      ahci[0000:08:00.0]"
irq:0 35 (        0) "1572864-edge      xhci_hcd"
irq:0 36 (        0) "1572865-edge      xhci_hcd"
irq:0 37 (        0) "1572866-edge      xhci_hcd"
irq:0 38 (        0) "1572867-edge      xhci_hcd"
irq:0 39 (        0) "1572868-edge      xhci_hcd"
irq:0 40 (        0) "2621440-edge      xhci_hcd"
irq:0 41 (        0) "2621441-edge      xhci_hcd"
irq:0 42 (        0) "2621442-edge      xhci_hcd"
irq:0 43 (        0) "2621443-edge      xhci_hcd"
irq:0 44 (        0) "2621444-edge      xhci_hcd"
irq:0 45 (    20275) "409600-edge      eth0"
irq:0 46 (       18) "360448-edge      mei_me"
irq:0 47 (      727) "32768-edge      i915"
irq:0 48 (      543) "442368-edge      snd_hda_intel:card1"
dma:1 4 "cascade"
----- misc resources end -----
>> parallel.1: pp mod
----- exec: "/sbin/modprobe parport_pc" -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
----- exec: "/sbin/modprobe lp" -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> parallel.2.1: lp read info
>> parallel.2.2: lp read info
>> parallel.2.3: lp read info
----- parallel info -----
----- parallel info end -----
>> block.1: block modules
----- exec: "/sbin/modprobe ide-cd_mod " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
----- exec: "/sbin/modprobe ide-disk " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
----- exec: "/sbin/modprobe sr_mod " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
----- exec: "/sbin/modprobe sd_mod " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
----- exec: "/sbin/modprobe st " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> block.2: sysfs drivers
>> block.3: cdrom
----- /proc/sys/dev/cdrom/info -----
drive name:		sr0
drive speed:		48
drive # of slots:	1
Can close tray:		1
Can open tray:		1
Can lock tray:		1
Can change speed:	1
Can select disk:	0
Can read multisession:	1
Can read MCN:		1
Reports media changed:	1
Can play audio:		1
Can write CD-R:		0
Can write CD-RW:	0
Can read DVD:		1
Can write DVD-R:	0
Can write DVD-RAM:	0
Can read MRW:		1
Can write MRW:		1
Can write RAM:		1
----- /proc/sys/dev/cdrom/info end -----
>> block.4: partition
----- /proc/partitions -----
    11        0    1048575 sr0
     8        0  976762584 sda
     8        1     393216 sda1
     8        2     130048 sda2
     8        3       1024 sda3
     8        4  976237255 sda4
----- /proc/partitions end -----
disks:
  sda
partitions:
  sda1
  sda2
  sda3
  sda4
>> block.5: get sysfs block dev data
-----  lsscsi -----
-----  lsscsi end -----
  block: name = sda4, path = /class/block/sda4
    dev = 8:4
  block: name = sda2, path = /class/block/sda2
    dev = 8:2
  block: name = sr0, path = /class/block/sr0
    dev = 11:0
    range = 1
    block device: bus = scsi, bus_id = 4:0:0:0 driver = sr
      path = /devices/pci0000:00/0000:00:1f.2/ata5/host4/target4:0:0/4:0:0:0
    vendor = TSSTcorp
    model = DVD-ROM TS-H353B
    rev = D500
    type = 5
>> block.5: /dev/sr0
  block: name = sda3, path = /class/block/sda3
    dev = 8:3
  block: name = sda1, path = /class/block/sda1
    dev = 8:1
  block: name = sda, path = /class/block/sda
    dev = 8:0
    range = 16
    block device: bus = scsi, bus_id = 5:0:0:0 driver = sd
      path = /devices/pci0000:00/0000:00:1f.2/ata6/host5/target5:0:0/5:0:0:0
    vendor = ATA
    model = ST31000340NS
    rev = MA08
    type = 0
>> block.5: /dev/sda
>> scsi.1: scsi modules
----- exec: "/sbin/modprobe sg " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> scsi.2: scsi tape
sysfs: no such class: scsi_tape
>> scsi.3: scsi generic
  scsi: name = sg0, path = /class/scsi_generic/sg0
    dev = 21:0
    scsi device: bus_id = 4:0:0:0 driver = sr
      path = /devices/pci0000:00/0000:00:1f.2/ata5/host4/target4:0:0/4:0:0:0
  scsi: name = sg1, path = /class/scsi_generic/sg1
    dev = 21:1
    scsi device: bus_id = 5:0:0:0 driver = sd
      path = /devices/pci0000:00/0000:00:1f.2/ata6/host5/target5:0:0/5:0:0:0
>> usb.1: sysfs drivers
>> usb.2: usb
  usb dev: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5
  usb dev: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
  usb dev: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3
  usb dev: /devices/pci0000:00/0000:00:1d.0/usb2/2-1
  usb dev: /devices/pci0000:00/0000:00:1a.0/usb1
  usb dev: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7
  usb dev: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6
  usb dev: /devices/pci0000:00/0000:00:1a.0/usb1/1-1
  usb dev: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4
  usb dev: /devices/pci0000:00/0000:00:1d.0/usb2
  usb device: name = usb5
    path = /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5
  usb device: name = 2-1.2
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
  usb device: name = 2-1.2:1.4
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4
    modalias = "usb:v1D50p6122d0101dc00dsc00dp00ic03isc01ip02in04"
    bInterfaceNumber = 4
    bInterfaceClass = 3
    bInterfaceSubClass = 1
    bInterfaceProtocol = 2
    if: 2-1.2:1.4 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
    bDeviceClass = 0
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d50
    idProduct = 0x6122
    manufacturer = "Ultimate Gadget Laboratories"
    product = "Ultimate Hacking Keyboard"
    bcdDevice = 0101
    speed = "12"
  usb device: name = 6-0:1.0
    path = /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6/6-0:1.0
    modalias = "usb:v1D6Bp0003d0505dc09dsc00dp03ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 6-0:1.0 @ /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 3
    idVendor = 0x1d6b
    idProduct = 0x0003
    manufacturer = "Linux 5.5.15-200.fc31.x86_64 xhci-hcd"
    product = "xHCI Host Controller"
    serial = "0000:05:00.0"
    bcdDevice = 0505
    speed = "5000"
  usb device: name = usb3
    path = /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3
  usb device: name = 2-1.2:1.2
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2
    modalias = "usb:v1D50p6122d0101dc00dsc00dp00ic03isc00ip00in02"
    bInterfaceNumber = 2
    bInterfaceClass = 3
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 2-1.2:1.2 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
    bDeviceClass = 0
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d50
    idProduct = 0x6122
    manufacturer = "Ultimate Gadget Laboratories"
    product = "Ultimate Hacking Keyboard"
    bcdDevice = 0101
    speed = "12"
  usb device: name = 2-1
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1
  usb device: name = usb1
    path = /devices/pci0000:00/0000:00:1a.0/usb1
  usb device: name = 2-1:1.0
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1:1.0
    modalias = "usb:v8087p0024d0000dc09dsc00dp01ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 2-1:1.0 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 1
    idVendor = 0x8087
    idProduct = 0x0024
    bcdDevice = 0000
    speed = "480"
  usb device: name = 2-1.2:1.0
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0
    modalias = "usb:v1D50p6122d0101dc00dsc00dp00ic03isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 3
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 2-1.2:1.0 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
    bDeviceClass = 0
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d50
    idProduct = 0x6122
    manufacturer = "Ultimate Gadget Laboratories"
    product = "Ultimate Hacking Keyboard"
    bcdDevice = 0101
    speed = "12"
  usb device: name = 3-0:1.0
    path = /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3/3-0:1.0
    modalias = "usb:v1D6Bp0002d0505dc09dsc00dp01ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 3-0:1.0 @ /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 1
    idVendor = 0x1d6b
    idProduct = 0x0002
    manufacturer = "Linux 5.5.15-200.fc31.x86_64 xhci-hcd"
    product = "xHCI Host Controller"
    serial = "0000:03:00.0"
    bcdDevice = 0505
    speed = "480"
  usb device: name = 2-1.7
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7
  usb device: name = usb6
    path = /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6
  usb device: name = 1-1
    path = /devices/pci0000:00/0000:00:1a.0/usb1/1-1
  usb device: name = 4-0:1.0
    path = /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4/4-0:1.0
    modalias = "usb:v1D6Bp0003d0505dc09dsc00dp03ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 4-0:1.0 @ /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 3
    idVendor = 0x1d6b
    idProduct = 0x0003
    manufacturer = "Linux 5.5.15-200.fc31.x86_64 xhci-hcd"
    product = "xHCI Host Controller"
    serial = "0000:03:00.0"
    bcdDevice = 0505
    speed = "5000"
  usb device: name = 2-1.7:1.0
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0
    modalias = "usb:v0B05p179Cd0001dcE0dsc01dp01icE0isc01ip01in00"
    bInterfaceNumber = 0
    bInterfaceClass = 224
    bInterfaceSubClass = 1
    bInterfaceProtocol = 1
    if: 2-1.7:1.0 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7
    bDeviceClass = 224
    bDeviceSubClass = 1
    bDeviceProtocol = 1
    idVendor = 0x0b05
    idProduct = 0x179c
    bcdDevice = 0001
    speed = "12"
  usb device: name = usb4
    path = /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4
  usb device: name = 2-1.2:1.3
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3
    modalias = "usb:v1D50p6122d0101dc00dsc00dp00ic03isc00ip00in03"
    bInterfaceNumber = 3
    bInterfaceClass = 3
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 2-1.2:1.3 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
    bDeviceClass = 0
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d50
    idProduct = 0x6122
    manufacturer = "Ultimate Gadget Laboratories"
    product = "Ultimate Hacking Keyboard"
    bcdDevice = 0101
    speed = "12"
  usb device: name = usb2
    path = /devices/pci0000:00/0000:00:1d.0/usb2
  usb device: name = 1-0:1.0
    path = /devices/pci0000:00/0000:00:1a.0/usb1/1-0:1.0
    modalias = "usb:v1D6Bp0002d0505dc09dsc00dp00ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 1-0:1.0 @ /devices/pci0000:00/0000:00:1a.0/usb1
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d6b
    idProduct = 0x0002
    manufacturer = "Linux 5.5.15-200.fc31.x86_64 ehci_hcd"
    product = "EHCI Host Controller"
    serial = "0000:00:1a.0"
    bcdDevice = 0505
    speed = "480"
  usb device: name = 2-1.2:1.1
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1
    modalias = "usb:v1D50p6122d0101dc00dsc00dp00ic03isc01ip01in01"
    bInterfaceNumber = 1
    bInterfaceClass = 3
    bInterfaceSubClass = 1
    bInterfaceProtocol = 1
    if: 2-1.2:1.1 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2
    bDeviceClass = 0
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d50
    idProduct = 0x6122
    manufacturer = "Ultimate Gadget Laboratories"
    product = "Ultimate Hacking Keyboard"
    bcdDevice = 0101
    speed = "12"
  usb device: name = 5-0:1.0
    path = /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5/5-0:1.0
    modalias = "usb:v1D6Bp0002d0505dc09dsc00dp01ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 5-0:1.0 @ /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 1
    idVendor = 0x1d6b
    idProduct = 0x0002
    manufacturer = "Linux 5.5.15-200.fc31.x86_64 xhci-hcd"
    product = "xHCI Host Controller"
    serial = "0000:05:00.0"
    bcdDevice = 0505
    speed = "480"
  usb device: name = 1-1:1.0
    path = /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0
    modalias = "usb:v8087p0024d0000dc09dsc00dp01ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 1-1:1.0 @ /devices/pci0000:00/0000:00:1a.0/usb1/1-1
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 1
    idVendor = 0x8087
    idProduct = 0x0024
    bcdDevice = 0000
    speed = "480"
  usb device: name = 2-0:1.0
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-0:1.0
    modalias = "usb:v1D6Bp0002d0505dc09dsc00dp00ic09isc00ip00in00"
    bInterfaceNumber = 0
    bInterfaceClass = 9
    bInterfaceSubClass = 0
    bInterfaceProtocol = 0
    if: 2-0:1.0 @ /devices/pci0000:00/0000:00:1d.0/usb2
    bDeviceClass = 9
    bDeviceSubClass = 0
    bDeviceProtocol = 0
    idVendor = 0x1d6b
    idProduct = 0x0002
    manufacturer = "Linux 5.5.15-200.fc31.x86_64 ehci_hcd"
    product = "EHCI Host Controller"
    serial = "0000:00:1d.0"
    bcdDevice = 0505
    speed = "480"
  usb device: name = 2-1.7:1.1
    path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.1
    modalias = "usb:v0B05p179Cd0001dcE0dsc01dp01icE0isc01ip01in01"
    bInterfaceNumber = 1
    bInterfaceClass = 224
    bInterfaceSubClass = 1
    bInterfaceProtocol = 1
    if: 2-1.7:1.1 @ /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7
    bDeviceClass = 224
    bDeviceSubClass = 1
    bDeviceProtocol = 1
    idVendor = 0x0b05
    idProduct = 0x179c
    bcdDevice = 0001
    speed = "12"
removed: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0
removed: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3
removed: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.1
>> usb.3.1: joydev mod
>> usb.3.2: evdev mod
----- exec: "/sbin/modprobe evdev " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> usb.3.3: input
  input: name = input9, path = /devices/platform/eeepc-wmi/input/input9
    no dev - ignored
  input: name = event17, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input20/event17
    dev = 13:81
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input14, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input14
    no dev - ignored
  input: name = event9, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input12/event9
    dev = 13:73
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input7, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3/0003:1D50:6122.0004/input/input7
    no dev - ignored
  input: name = event15, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input18/event15
    dev = 13:79
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = mice, path = /devices/virtual/input/mice
    dev = 13:63
  input: name = input12, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input12
    no dev - ignored
  input: name = event7, path = /devices/platform/pcspkr/input/input10/event7
    dev = 13:71
    input device: bus = platform, bus_id = pcspkr driver = pcspkr
      path = /devices/platform/pcspkr
  input: name = input5, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:1D50:6122.0002/input/input5
    no dev - ignored
  input: name = event13, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input16/event13
    dev = 13:77
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input20, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input20
    no dev - ignored
  input: name = input10, path = /devices/platform/pcspkr/input/input10
    no dev - ignored
  input: name = event5, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005/input/input8/event5
    dev = 13:69
    input device: bus = hid, bus_id = 0003:1D50:6122.0005 driver = hid-generic
      path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005
  input: name = event11, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input14/event11
    dev = 13:75
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input19, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input19
    no dev - ignored
  input: name = event3, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2/0003:1D50:6122.0003/input/input6/event3
    dev = 13:67
    input device: bus = hid, bus_id = 0003:1D50:6122.0003 driver = hid-generic
      path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2/0003:1D50:6122.0003
  input: name = input1, path = /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
    no dev - ignored
  input: name = input17, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input17
    no dev - ignored
  input: name = event1, path = /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1
    dev = 13:65
    input device: bus = acpi, bus_id = LNXPWRBN:00 driver = button
      path = /devices/LNXSYSTM:00/LNXPWRBN:00
  input: name = mouse0, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005/input/input8/mouse0
    dev = 13:32
    input device: bus = hid, bus_id = 0003:1D50:6122.0005 driver = hid-generic
      path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005
  input: name = input15, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input15
    no dev - ignored
  input: name = input8, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005/input/input8
    no dev - ignored
  input: name = event16, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input19/event16
    dev = 13:80
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input13, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input13
    no dev - ignored
  input: name = event8, path = /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11/event8
    dev = 13:72
    input device: bus = acpi, bus_id = LNXVIDEO:00 driver = video
      path = /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00
  input: name = input6, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2/0003:1D50:6122.0003/input/input6
    no dev - ignored
  input: name = event14, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input17/event14
    dev = 13:78
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input11, path = /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
    no dev - ignored
  input: name = event6, path = /devices/platform/eeepc-wmi/input/input9/event6
    dev = 13:70
    input device: bus = platform, bus_id = eeepc-wmi driver = eeepc-wmi
      path = /devices/platform/eeepc-wmi
  input: name = event12, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input15/event12
    dev = 13:76
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = event4, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3/0003:1D50:6122.0004/input/input7/event4
    dev = 13:68
    input device: bus = hid, bus_id = 0003:1D50:6122.0004 driver = hid-generic
      path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3/0003:1D50:6122.0004
  input: name = event10, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input13/event10
    dev = 13:74
    input device: bus = sound, bus_id = card1 driver = (null)
      path = /devices/pci0000:00/0000:00:1b.0/sound/card1
  input: name = input18, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input18
    no dev - ignored
  input: name = event2, path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:1D50:6122.0002/input/input5/event2
    dev = 13:66
    input device: bus = hid, bus_id = 0003:1D50:6122.0002 driver = hid-generic
      path = /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:1D50:6122.0002
  input: name = input0, path = /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
    no dev - ignored
  input: name = input16, path = /devices/pci0000:00/0000:00:1b.0/sound/card1/input16
    no dev - ignored
  input: name = event0, path = /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0
    dev = 13:64
    input device: bus = acpi, bus_id = PNP0C0C:00 driver = button
      path = /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00
>> usb.3.4: lp
sysfs: no such class: usb
>> usb.3.5: serial
>> edd.1: edd mod
----- exec: "/sbin/modprobe edd " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> edd.2: edd info
>> modem.1: serial
******  started child process 25 (15s/120s)  ******
******  stopped child process 25 (120s)  ******
>> mouse.2: serial
******  started child process 26 (20s/20s)  ******
******  stopped child process 26 (20s)  ******
>> input.1: joydev mod
>> input.1.1: evdev mod
----- exec: "/sbin/modprobe evdev " -----
  modprobe: can't change directory to '/lib/modules': No such file or directory
----- return code: ? -----
>> input.2: input
----- /proc/bus/input/devices -----
  I: Bus=0019 Vendor=0000 Product=0001 Version=0000
  N: Name="Power Button"
  P: Phys=PNP0C0C/button/input0
  S: Sysfs=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
  U: Uniq=
  H: Handlers=kbd event0 
  B: PROP=0
  B: EV=3
  B: KEY=10000000000000 0
  
  I: Bus=0019 Vendor=0000 Product=0001 Version=0000
  N: Name="Power Button"
  P: Phys=LNXPWRBN/button/input0
  S: Sysfs=/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
  U: Uniq=
  H: Handlers=kbd event1 
  B: PROP=0
  B: EV=3
  B: KEY=10000000000000 0
  
  I: Bus=0003 Vendor=1d50 Product=6122 Version=0110
  N: Name="Ultimate Gadget Laboratories Ultimate Hacking Keyboard"
  P: Phys=usb-0000:00:1d.0-1.2/input1
  S: Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:1D50:6122.0002/input/input5
  U: Uniq=
  H: Handlers=sysrq kbd leds event2 
  B: PROP=0
  B: EV=120013
  B: KEY=1000000000007 ff9f207ac14057ff febeffdfffefffff fffffffffffffffe
  B: MSC=10
  B: LED=1f
  
  I: Bus=0003 Vendor=1d50 Product=6122 Version=0110
  N: Name="Ultimate Gadget Laboratories Ultimate Hacking Keyboard"
  P: Phys=usb-0000:00:1d.0-1.2/input2
  S: Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2/0003:1D50:6122.0003/input/input6
  U: Uniq=
  H: Handlers=kbd event3 
  B: PROP=0
  B: EV=1f
  B: KEY=3f000301ff 0 0 483ffff17aff32d bfd4444600000000 1 130ff38b17c000 677bfad9415fed 19ed68000004400 10000002
  B: REL=1040
  B: ABS=100000000
  B: MSC=10
  
  I: Bus=0003 Vendor=1d50 Product=6122 Version=0110
  N: Name="Ultimate Gadget Laboratories Ultimate Hacking Keyboard"
  P: Phys=usb-0000:00:1d.0-1.2/input3
  S: Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3/0003:1D50:6122.0004/input/input7
  U: Uniq=
  H: Handlers=kbd event4 
  B: PROP=0
  B: EV=13
  B: KEY=c000 10000000000000 0
  B: MSC=10
  
  I: Bus=0003 Vendor=1d50 Product=6122 Version=0110
  N: Name="Ultimate Gadget Laboratories Ultimate Hacking Keyboard"
  P: Phys=usb-0000:00:1d.0-1.2/input4
  S: Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4/0003:1D50:6122.0005/input/input8
  U: Uniq=
  H: Handlers=mouse0 event5 
  B: PROP=0
  B: EV=17
  B: KEY=ff0000 0 0 0 0
  B: REL=1943
  B: MSC=10
  
  I: Bus=0019 Vendor=0000 Product=0000 Version=0000
  N: Name="Eee PC WMI hotkeys"
  P: Phys=eeepc-wmi/input0
  S: Sysfs=/devices/platform/eeepc-wmi/input/input9
  U: Uniq=
  H: Handlers=kbd event6 rfkill 
  B: PROP=0
  B: EV=100013
  B: KEY=7e40000 0 800000000000 0 0 1400b00100000 300180001100800 e000000000000 2
  B: MSC=10
  
  I: Bus=0010 Vendor=001f Product=0001 Version=0100
  N: Name="PC Speaker"
  P: Phys=isa0061/input0
  S: Sysfs=/devices/platform/pcspkr/input/input10
  U: Uniq=
  H: Handlers=kbd event7 
  B: PROP=0
  B: EV=40001
  B: SND=6
  
  I: Bus=0019 Vendor=0000 Product=0006 Version=0000
  N: Name="Video Bus"
  P: Phys=LNXVIDEO/video/input0
  S: Sysfs=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input11
  U: Uniq=
  H: Handlers=kbd event8 
  B: PROP=0
  B: EV=3
  B: KEY=3e000b00000000 0 0 0
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Front Mic"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input12
  U: Uniq=
  H: Handlers=event9 
  B: PROP=0
  B: EV=21
  B: SW=10
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Rear Mic"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input13
  U: Uniq=
  H: Handlers=event10 
  B: PROP=0
  B: EV=21
  B: SW=10
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Line"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input14
  U: Uniq=
  H: Handlers=event11 
  B: PROP=0
  B: EV=21
  B: SW=2000
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Line Out Front"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input15
  U: Uniq=
  H: Handlers=event12 
  B: PROP=0
  B: EV=21
  B: SW=40
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Line Out Surround"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input16
  U: Uniq=
  H: Handlers=event13 
  B: PROP=0
  B: EV=21
  B: SW=40
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Line Out CLFE"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input17
  U: Uniq=
  H: Handlers=event14 
  B: PROP=0
  B: EV=21
  B: SW=40
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Line Out Side"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input18
  U: Uniq=
  H: Handlers=event15 
  B: PROP=0
  B: EV=21
  B: SW=40
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH Front Headphone"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input19
  U: Uniq=
  H: Handlers=event16 
  B: PROP=0
  B: EV=21
  B: SW=4
  
  I: Bus=0000 Vendor=0000 Product=0000 Version=0000
  N: Name="HDA Intel PCH HDMI/DP,pcm=3"
  P: Phys=ALSA
  S: Sysfs=/devices/pci0000:00/0000:00:1b.0/sound/card1/input20
  U: Uniq=
  H: Handlers=event17 
  B: PROP=0
  B: EV=21
  B: SW=140
  
----- /proc/bus/input/devices end -----
bus = 25, name = Power Button
  handlers = kbd event0
  key = 00100000000000000000000000000000
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 25, name = Power Button
  handlers = kbd event1
  key = 00100000000000000000000000000000
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 3, name = Ultimate Gadget Laboratories Ultimate Hacking Keyboard
  handlers = sysrq kbd leds event2
  key = 0001000000000007ff9f207ac14057fffebeffdfffeffffffffffffffffffffe
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
bus = 3, name = Ultimate Gadget Laboratories Ultimate Hacking Keyboard
  handlers = kbd event3
  key = 0000003f000301ff000000000000000000000000000000000483ffff17aff32dbfd4444600000000000000000000000100130ff38b17c00000677bfad9415fed019ed680000044000000000010000002
  rel = 0000000000001040
  abs = 0000000100000000
  mouse buttons = 0
  mouse wheels = 2
  is_mouse = 0
  is_joystick = 0
bus = 3, name = Ultimate Gadget Laboratories Ultimate Hacking Keyboard
  handlers = kbd event4
  key = 000000000000c00000100000000000000000000000000000
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
bus = 3, name = Ultimate Gadget Laboratories Ultimate Hacking Keyboard
  handlers = mouse0 event5
  key = 0000000000ff00000000000000000000000000000000000000000000000000000000000000000000
  rel = 0000000000001943
  mouse buttons = 8
  mouse wheels = 4
  is_mouse = 1
  is_joystick = 0
bus = 25, name = Eee PC WMI hotkeys
  handlers = kbd event6 rfkill
  key = 0000000007e4000000000000000000000000800000000000000000000000000000000000000000000001400b001000000300180001100800000e0000000000000000000000000002
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 16, name = PC Speaker
  handlers = kbd event7
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 25, name = Video Bus
  handlers = kbd event8
  key = 003e000b00000000000000000000000000000000000000000000000000000000
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Front Mic
  handlers = event9
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Rear Mic
  handlers = event10
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Line
  handlers = event11
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Line Out Front
  handlers = event12
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Line Out Surround
  handlers = event13
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Line Out CLFE
  handlers = event14
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Line Out Side
  handlers = event15
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH Front Headphone
  handlers = event16
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
bus = 0, name = HDA Intel PCH HDMI/DP,pcm=3
  handlers = event17
  mouse buttons = 0
  mouse wheels = 0
  is_mouse = 0
  is_joystick = 0
unknown non-USB input device
>> kbd.2: uml
>> cpu.1: cpuinfo
----- /proc/cpuinfo -----
  processor	: 0
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 2917.037
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 0
  cpu cores	: 4
  apicid		: 0
  initial apicid	: 0
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
  processor	: 1
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 2654.607
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 1
  cpu cores	: 4
  apicid		: 2
  initial apicid	: 2
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
  processor	: 2
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 3154.960
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 2
  cpu cores	: 4
  apicid		: 4
  initial apicid	: 4
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
  processor	: 3
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 42
  model name	: Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz
  stepping	: 7
  microcode	: 0x2f
  cpu MHz		: 2389.762
  cache size	: 8192 KB
  physical id	: 0
  siblings	: 4
  core id		: 3
  cpu cores	: 4
  apicid		: 6
  initial apicid	: 6
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx lahf_lm epb pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
  bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit
  bogomips	: 6822.03
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 36 bits physical, 48 bits virtual
  power management:
  
----- /proc/cpuinfo end -----
>> kbd.3: serial console
>> fb.1: read info
>> net.1: get network data
  net interface: name = lo, path = /class/net/lo
    type = 772
    carrier = 1
    hw_addr = 00:00:00:00:00:00
  lo: ethtool permanent hw address[6]: 00:00:00:00:00:00
    GDRVINFO ethtool error: Not supported
    ethtool private flags: 0
  net interface: name = eth0, path = /class/net/eth0
    type = 1
    carrier = 1
    hw_addr = 02:42:ac:11:00:02
  eth0: ethtool permanent hw address[6]: 00:00:00:00:00:00
    ethtool driver: veth
    ethtool    bus: 
    ethtool private flags: 0
>> pppoe.1: looking for pppoe
>> pppoe.2: discovery
Attempt number 1
eth0: Sending PADI packet
Timeout waiting for PADO packets
Attempt number 2
eth0: Sending PADI packet
Timeout waiting for PADO packets
>> wlan.1: detecting wlan features
>> isdn.1: list
>> dsl.1: list
>> int.2: cdrom
>> int.3: media
>> int.4.1: /dev/sda
  read_block0: open(/dev/sda) failed
>> int.4: floppy
>> int.5: edd
>> int.5.1: bios
  bios ctrl 0: 13
>> int.6: mouse
>> int.15: system info
  system type:
  acpi: 1
>> int.7: hdb
>> int.7.1: modules
>> int.8: usbscsi
>> int.9: hotplug
>> int.10: modem
>> int.11: wlan
>> int.12: udev
-----  udevinfo -----
-----  udevinfo end -----
>> int.13: device names
>> int.14: soft raid
----- soft raid devices -----
----- soft raid devices end -----
>> int.15: geo
>> int.16: parent
  prop read: rdCR.lZF+r4EgHp4 (failed)
  old prop read: rdCR.lZF+r4EgHp4 (failed)
  prop read: rdCR.n_7QNeEnh23 (failed)
  old prop read: rdCR.n_7QNeEnh23 (failed)
  prop read: rdCR.EMpH5pjcahD (failed)
  old prop read: rdCR.EMpH5pjcahD (failed)
  prop read: rdCR.f5u1ucRm+H9 (failed)
  old prop read: rdCR.f5u1ucRm+H9 (failed)
  prop read: rdCR.8uRK7LxiIA2 (failed)
  old prop read: rdCR.8uRK7LxiIA2 (failed)
  prop read: rdCR.9N+EecqykME (failed)
  old prop read: rdCR.9N+EecqykME (failed)
  prop read: rdCR.CxwsZFjVASF (failed)
  old prop read: rdCR.CxwsZFjVASF (failed)
  prop read: svHJ.8cmnBHRnQdA (failed)
  old prop read: svHJ.8cmnBHRnQdA (failed)
  prop read: w7Y8.PwL6QhrcKc7 (failed)
  old prop read: w7Y8.PwL6QhrcKc7 (failed)
  prop read: z8Q3.PybyPiv0JtF (failed)
  old prop read: z8Q3.PybyPiv0JtF (failed)
  prop read: BUZT.wRs+dhty1W3 (failed)
  old prop read: BUZT.wRs+dhty1W3 (failed)
  prop read: vSkL.hCwIhm6dY1F (failed)
  old prop read: vSkL.hCwIhm6dY1F (failed)
  prop read: 0Rrv.dlpR8dv6hp3 (failed)
  old prop read: 0Rrv.dlpR8dv6hp3 (failed)
  prop read: GBI1.qVzhvlxo6tC (failed)
  old prop read: GBI1.qVzhvlxo6tC (failed)
  prop read: WnlC.lnaWSLq39x5 (failed)
  old prop read: WnlC.lnaWSLq39x5 (failed)
  prop read: u1Nb.vJoKilYFVk8 (failed)
  old prop read: u1Nb.vJoKilYFVk8 (failed)
  prop read: Z7uZ.VRGSI7dFTA2 (failed)
  old prop read: Z7uZ.VRGSI7dFTA2 (failed)
  prop read: kpGf.4SWBtWsvg96 (failed)
  old prop read: kpGf.4SWBtWsvg96 (failed)
  prop read: nS1_.Y6ssQ7vTbYD (failed)
  old prop read: nS1_.Y6ssQ7vTbYD (failed)
  prop read: qLht.6yCj95_hCA2 (failed)
  old prop read: qLht.6yCj95_hCA2 (failed)
  prop read: qTvu.RnUSNr8RMe0 (failed)
  old prop read: qTvu.RnUSNr8RMe0 (failed)
  prop read: vTuk.ulR5c185+GC (failed)
  old prop read: vTuk.ulR5c185+GC (failed)
  prop read: pwJ7.hFysTvgtVM8 (failed)
  old prop read: pwJ7.hFysTvgtVM8 (failed)
  prop read: Ddhb.8cmnBHRnQdA (failed)
  old prop read: Ddhb.8cmnBHRnQdA (failed)
  prop read: 1GTX.4MLd6wrxpg5 (failed)
  old prop read: 1GTX.4MLd6wrxpg5 (failed)
  prop read: 96M4.Wvn1VRdvGwC (failed)
  old prop read: 96M4.Wvn1VRdvGwC (failed)
  prop read: kYBq.j4k03DdbYFA (failed)
  old prop read: kYBq.j4k03DdbYFA (failed)
  prop read: QSNP.XG9yFCCuWW1 (failed)
  old prop read: QSNP.XG9yFCCuWW1 (failed)
  prop read: YmUS.Cw47iGKkO1A (failed)
  old prop read: YmUS.Cw47iGKkO1A (failed)
  prop read: _Znp.5KRTaPXMxLE (failed)
  old prop read: _Znp.5KRTaPXMxLE (failed)
  prop read: rdCR.l96Wplqi0fC (failed)
  old prop read: rdCR.l96Wplqi0fC (failed)
  prop read: KD9E.bSjhFrTjQf2 (failed)
  old prop read: KD9E.bSjhFrTjQf2 (failed)
  prop read: 3OOL.AIyo6nkjXe0 (failed)
  old prop read: 3OOL.AIyo6nkjXe0 (failed)
  prop read: bdUI.SE1wIdpsiiC (failed)
  old prop read: bdUI.SE1wIdpsiiC (failed)
  prop read: 2pkM.SE1wIdpsiiC (failed)
  old prop read: 2pkM.SE1wIdpsiiC (failed)
  prop read: W__Q.SE1wIdpsiiC (failed)
  old prop read: W__Q.SE1wIdpsiiC (failed)
  prop read: z9FV.SE1wIdpsiiC (failed)
  old prop read: z9FV.SE1wIdpsiiC (failed)
  prop read: h_rc.fJQVhV8Q7J1 (failed)
  old prop read: h_rc.fJQVhV8Q7J1 (failed)
  prop read: 7eqy.B2sJIkct3XB (failed)
  old prop read: 7eqy.B2sJIkct3XB (failed)
  prop read: ndLU.6IzIaJpm7T3 (failed)
  old prop read: ndLU.6IzIaJpm7T3 (failed)
  prop read: FKGF.4Nx_qoDfSd7 (failed)
  old prop read: FKGF.4Nx_qoDfSd7 (failed)
  prop read: uIhY.029GFTetOb3 (failed)
  old prop read: uIhY.029GFTetOb3 (failed)
  prop read: zPk0.vNHThQQZKpC (failed)
  old prop read: zPk0.vNHThQQZKpC (failed)
  prop read: o2Ga.NbJBKWxMNPB (failed)
  old prop read: o2Ga.NbJBKWxMNPB (failed)
  prop read: k4bc.FHd55n4xKo7 (failed)
  old prop read: k4bc.FHd55n4xKo7 (failed)
  prop read: KS5Q.NBu8Dn+ADQ9 (failed)
  old prop read: KS5Q.NBu8Dn+ADQ9 (failed)
  prop read: 2XnU.Iij6smqB8J2 (failed)
  old prop read: 2XnU.Iij6smqB8J2 (failed)
  prop read: ADDn.4Nx_qoDfSd7 (failed)
  old prop read: ADDn.4Nx_qoDfSd7 (failed)
  prop read: pBe4.oLWCeziExdF (failed)
  old prop read: pBe4.oLWCeziExdF (failed)
  prop read: rdCR.j8NaKXDZtZ6 (failed)
  old prop read: rdCR.j8NaKXDZtZ6 (failed)
  prop read: wkFv.j8NaKXDZtZ6 (failed)
  old prop read: wkFv.j8NaKXDZtZ6 (failed)
  prop read: +rIN.j8NaKXDZtZ6 (failed)
  old prop read: +rIN.j8NaKXDZtZ6 (failed)
  prop read: 4zLr.j8NaKXDZtZ6 (failed)
  old prop read: 4zLr.j8NaKXDZtZ6 (failed)
  prop read: Fyby.5lXXuQkv_C5 (failed)
  old prop read: Fyby.5lXXuQkv_C5 (failed)
  prop read: ZsBS.GQNx7L4uPNA (failed)
  old prop read: ZsBS.GQNx7L4uPNA (failed)
  prop read: usDW.ndpeucax6V1 (failed)
  old prop read: usDW.ndpeucax6V1 (failed)
----- /proc/modules -----
  veth 32768 0 - Live 0x0000000000000000
  xt_MASQUERADE 20480 1 - Live 0x0000000000000000
  nf_conntrack_netlink 53248 0 - Live 0x0000000000000000
  nfnetlink 16384 2 nf_conntrack_netlink, Live 0x0000000000000000
  iptable_nat 16384 1 - Live 0x0000000000000000
  xt_addrtype 16384 2 - Live 0x0000000000000000
  iptable_filter 16384 1 - Live 0x0000000000000000
  xt_conntrack 16384 1 - Live 0x0000000000000000
  nf_nat 53248 2 xt_MASQUERADE,iptable_nat, Live 0x0000000000000000
  nf_conntrack 163840 4 xt_MASQUERADE,nf_conntrack_netlink,xt_conntrack,nf_nat, Live 0x0000000000000000
  nf_defrag_ipv6 24576 1 nf_conntrack, Live 0x0000000000000000
  nf_defrag_ipv4 16384 1 nf_conntrack, Live 0x0000000000000000
  br_netfilter 28672 0 - Live 0x0000000000000000
  bridge 208896 1 br_netfilter, Live 0x0000000000000000
  stp 16384 1 bridge, Live 0x0000000000000000
  llc 16384 2 bridge,stp, Live 0x0000000000000000
  overlay 135168 1 - Live 0x0000000000000000
  vfat 20480 1 - Live 0x0000000000000000
  fat 86016 1 vfat, Live 0x0000000000000000
  snd_hda_codec_hdmi 73728 1 - Live 0x0000000000000000
  snd_hda_codec_realtek 126976 1 - Live 0x0000000000000000
  snd_hda_codec_generic 94208 1 snd_hda_codec_realtek, Live 0x0000000000000000
  ledtrig_audio 16384 2 snd_hda_codec_realtek,snd_hda_codec_generic, Live 0x0000000000000000
  intel_rapl_msr 20480 0 - Live 0x0000000000000000
  intel_rapl_common 32768 1 intel_rapl_msr, Live 0x0000000000000000
  x86_pkg_temp_thermal 20480 0 - Live 0x0000000000000000
  intel_powerclamp 20480 0 - Live 0x0000000000000000
  i915 2453504 2 - Live 0x0000000000000000
  coretemp 20480 0 - Live 0x0000000000000000
  snd_hda_intel 53248 0 - Live 0x0000000000000000
  btusb 57344 0 - Live 0x0000000000000000
  btrtl 24576 1 btusb, Live 0x0000000000000000
  btbcm 16384 1 btusb, Live 0x0000000000000000
  snd_intel_dspcfg 28672 1 snd_hda_intel, Live 0x0000000000000000
  btintel 32768 1 btusb, Live 0x0000000000000000
  snd_pcsp 16384 0 - Live 0x0000000000000000
  snd_hda_codec 163840 4 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel, Live 0x0000000000000000
  bluetooth 634880 5 btusb,btrtl,btbcm,btintel, Live 0x0000000000000000
  i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
  snd_hda_core 102400 5 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec, Live 0x0000000000000000
  drm_kms_helper 233472 1 i915, Live 0x0000000000000000
  snd_hwdep 16384 1 snd_hda_codec, Live 0x0000000000000000
  ecdh_generic 16384 1 bluetooth, Live 0x0000000000000000
  ecc 36864 1 ecdh_generic, Live 0x0000000000000000
  snd_pcm 126976 5 snd_hda_codec_hdmi,snd_hda_intel,snd_pcsp,snd_hda_codec,snd_hda_core, Live 0x0000000000000000
  drm 585728 3 i915,drm_kms_helper, Live 0x0000000000000000
  snd_timer 40960 1 snd_pcm, Live 0x0000000000000000
  kvm 802816 0 - Live 0x0000000000000000
  irqbypass 16384 1 kvm, Live 0x0000000000000000
  iTCO_wdt 16384 0 - Live 0x0000000000000000
  intel_cstate 20480 0 - Live 0x0000000000000000
  iTCO_vendor_support 16384 1 iTCO_wdt, Live 0x0000000000000000
  intel_uncore 147456 0 - Live 0x0000000000000000
  eeepc_wmi 16384 0 - Live 0x0000000000000000
  intel_rapl_perf 20480 0 - Live 0x0000000000000000
  asus_wmi 36864 1 eeepc_wmi, Live 0x0000000000000000
  mei_hdcp 24576 0 - Live 0x0000000000000000
  sparse_keymap 16384 1 asus_wmi, Live 0x0000000000000000
  rfkill 28672 3 bluetooth,asus_wmi, Live 0x0000000000000000
  wmi_bmof 16384 0 - Live 0x0000000000000000
  snd 102400 9 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel,snd_pcsp,snd_hda_codec,snd_hwdep,snd_pcm,snd_timer, Live 0x0000000000000000
  soundcore 16384 1 snd, Live 0x0000000000000000
  i2c_i801 32768 0 - Live 0x0000000000000000
  mxm_wmi 16384 0 - Live 0x0000000000000000
  joydev 28672 0 - Live 0x0000000000000000
  lpc_ich 28672 0 - Live 0x0000000000000000
  mei_me 45056 1 - Live 0x0000000000000000
  mei 122880 3 mei_hdcp,mei_me, Live 0x0000000000000000
  ip_tables 32768 2 iptable_nat,iptable_filter, Live 0x0000000000000000
  xfs 1642496 1 - Live 0x0000000000000000
  crct10dif_pclmul 16384 1 - Live 0x0000000000000000
  crc32_pclmul 16384 0 - Live 0x0000000000000000
  ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
  firewire_ohci 49152 0 - Live 0x0000000000000000
  serio_raw 20480 0 - Live 0x0000000000000000
  firewire_core 81920 1 firewire_ohci, Live 0x0000000000000000
  e1000e 290816 0 - Live 0x0000000000000000
  crc_itu_t 16384 1 firewire_core, Live 0x0000000000000000
  wmi 36864 3 asus_wmi,wmi_bmof,mxm_wmi, Live 0x0000000000000000
  video 53248 2 i915,asus_wmi, Live 0x0000000000000000
  btrfs 1486848 0 - Live 0x0000000000000000
  blake2b_generic 20480 0 - Live 0x0000000000000000
  xor 24576 1 btrfs, Live 0x0000000000000000
  zstd_compress 188416 1 btrfs, Live 0x0000000000000000
  raid6_pq 122880 1 btrfs, Live 0x0000000000000000
  libcrc32c 16384 4 nf_nat,nf_conntrack,xfs,btrfs, Live 0x0000000000000000
  crc32c_intel 24576 3 - Live 0x0000000000000000
  zstd_decompress 90112 1 btrfs, Live 0x0000000000000000
  fuse 139264 1 - Live 0x0000000000000000
----- /proc/modules end -----
  used irqs: 0,1,8,9,12,16,17,18,19,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48
=========== end debug info ============
01: None 00.0: 10105 BIOS
  [Created at bios.186]
  Unique ID: rdCR.lZF+r4EgHp4
  Hardware Class: bios
  BIOS Keyboard LED Status:
    Scroll Lock: off
    Num Lock: off
    Caps Lock: off
  Config Status: cfg=new, avail=yes, need=no, active=unknown

02: None 00.0: 10107 System
  [Created at sys.64]
  Unique ID: rdCR.n_7QNeEnh23
  Hardware Class: system
  Model: "System"
  Formfactor: "desktop"
  Driver Info #0:
    Driver Status: thermal,fan are not active
    Driver Activation Cmd: "modprobe thermal; modprobe fan"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

03: None 00.0: 10104 FPU
  [Created at misc.191]
  Unique ID: rdCR.EMpH5pjcahD
  Hardware Class: unknown
  Model: "FPU"
  I/O Port: 0x00 (rw)
  Config Status: cfg=new, avail=yes, need=no, active=unknown

04: None 00.0: 0801 DMA controller (8237)
  [Created at misc.205]
  Unique ID: rdCR.f5u1ucRm+H9
  Hardware Class: unknown
  Model: "DMA controller"
  I/O Port: 0x00 (rw)
  I/O Port: 0x00 (rw)
  I/O Port: 0x00 (rw)
  DMA: 4
  Config Status: cfg=new, avail=yes, need=no, active=unknown

05: None 00.0: 0800 PIC (8259)
  [Created at misc.218]
  Unique ID: rdCR.8uRK7LxiIA2
  Hardware Class: unknown
  Model: "PIC"
  I/O Port: 0x00 (rw)
  I/O Port: 0x00 (rw)
  Config Status: cfg=new, avail=yes, need=no, active=unknown

06: None 00.0: 0900 Keyboard controller
  [Created at misc.250]
  Unique ID: rdCR.9N+EecqykME
  Hardware Class: unknown
  Model: "Keyboard controller"
  I/O Port: 0x00 (rw)
  I/O Port: 0x00 (rw)
  Config Status: cfg=new, avail=yes, need=no, active=unknown

11: None 00.0: 10102 Main Memory
  [Created at memory.74]
  Unique ID: rdCR.CxwsZFjVASF
  Hardware Class: memory
  Model: "Main Memory"
  Memory Range: 0x00000000-0x3e1fc6fff (rw)
  Memory Size: 16 GB
  Config Status: cfg=new, avail=yes, need=no, active=unknown

12: PCI 300.0: 0c03 USB Controller (XHCI)
  [Created at pci.386]
  Unique ID: svHJ.8cmnBHRnQdA
  Parent ID: qTvu.RnUSNr8RMe0
  SysFS ID: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0
  SysFS BusID: 0000:03:00.0
  Hardware Class: usb controller
  Model: "ASMedia ASM1042 SuperSpeed USB Host Controller"
  Vendor: pci 0x1b21 "ASMedia Technology Inc."
  Device: pci 0x1042 "ASM1042 SuperSpeed USB Host Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x8488 "P8B WS Motherboard"
  Driver: "xhci_hcd"
  Memory Range: 0xf7c00000-0xf7c07fff (rw,non-prefetchable)
  IRQ: 17 (2 events)
  Module Alias: "pci:v00001B21d00001042sv00001043sd00008488bc0Csc03i30"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #25 (PCI bridge)

13: PCI 1f.2: 0106 SATA controller (AHCI 1.0)
  [Created at pci.386]
  Unique ID: w7Y8.PwL6QhrcKc7
  SysFS ID: /devices/pci0000:00/0000:00:1f.2
  SysFS BusID: 0000:00:1f.2
  Hardware Class: storage
  Model: "Intel 6 Series/C200 Series Chipset Family SATA AHCI Controller"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c02 "6 Series/C200 Series Chipset Family SATA AHCI Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0x05
  Driver: "ahci"
  Driver Modules: "ahci"
  I/O Ports: 0xf0d0-0xf0d7 (rw)
  I/O Ports: 0xf0c0-0xf0c3 (rw)
  I/O Ports: 0xf0b0-0xf0b7 (rw)
  I/O Ports: 0xf0a0-0xf0a3 (rw)
  I/O Ports: 0xf060-0xf07f (rw)
  Memory Range: 0xf7d26000-0xf7d267ff (rw,non-prefetchable)
  IRQ: 33 (34873 events)
  Module Alias: "pci:v00008086d00001C02sv00001043sd0000844Dbc01sc06i01"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

14: PCI 1c.0: 0604 PCI bridge (Normal decode)
  [Created at pci.386]
  Unique ID: z8Q3.PybyPiv0JtF
  SysFS ID: /devices/pci0000:00/0000:00:1c.0
  SysFS BusID: 0000:00:1c.0
  Hardware Class: bridge
  Model: "Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 1"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c10 "6 Series/C200 Series Chipset Family PCI Express Root Port 1"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0xb5
  Driver: "pcieport"
  IRQ: 27 (no events)
  Module Alias: "pci:v00008086d00001C10sv00001043sd0000844Dbc06sc04i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

15: PCI 1f.0: 0601 ISA bridge
  [Created at pci.386]
  Unique ID: BUZT.wRs+dhty1W3
  SysFS ID: /devices/pci0000:00/0000:00:1f.0
  SysFS BusID: 0000:00:1f.0
  Hardware Class: bridge
  Model: "Intel Z68 Express Chipset Family LPC Controller"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c44 "Z68 Express Chipset Family LPC Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d 
  Revision: 0x05
  Driver: "lpc_ich"
  Driver Modules: "lpc_ich"
  Module Alias: "pci:v00008086d00001C44sv00001043sd0000844Dbc06sc01i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

16: PCI 01.0: 0604 PCI bridge (Normal decode)
  [Created at pci.386]
  Unique ID: vSkL.hCwIhm6dY1F
  SysFS ID: /devices/pci0000:00/0000:00:01.0
  SysFS BusID: 0000:00:01.0
  Hardware Class: bridge
  Model: "Intel Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x0101 "Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root Port"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d 
  Revision: 0x09
  Driver: "pcieport"
  IRQ: 26 (no events)
  Module Alias: "pci:v00008086d00000101sv00001043sd0000844Dbc06sc04i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

17: PCI 1c.7: 0604 PCI bridge (Normal decode)
  [Created at pci.386]
  Unique ID: 0Rrv.dlpR8dv6hp3
  SysFS ID: /devices/pci0000:00/0000:00:1c.7
  SysFS BusID: 0000:00:1c.7
  Hardware Class: bridge
  Model: "Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 8"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c1e "6 Series/C200 Series Chipset Family PCI Express Root Port 8"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0xb5
  Driver: "pcieport"
  IRQ: 32 (no events)
  Module Alias: "pci:v00008086d00001C1Esv00001043sd0000844Dbc06sc04i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

18: PCI 800.0: 0106 SATA controller (AHCI 1.0)
  [Created at pci.386]
  Unique ID: GBI1.qVzhvlxo6tC
  Parent ID: 0Rrv.dlpR8dv6hp3
  SysFS ID: /devices/pci0000:00/0000:00:1c.7/0000:08:00.0
  SysFS BusID: 0000:08:00.0
  Hardware Class: storage
  Model: "Marvell 88SE9172 SATA 6Gb/s Controller"
  Vendor: pci 0x1b4b "Marvell Technology Group Ltd."
  Device: pci 0x9172 "88SE9172 SATA 6Gb/s Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x8477 
  Revision: 0x11
  Driver: "ahci"
  Driver Modules: "ahci"
  I/O Ports: 0xc040-0xc047 (rw)
  I/O Ports: 0xc030-0xc033 (rw)
  I/O Ports: 0xc020-0xc027 (rw)
  I/O Ports: 0xc010-0xc013 (rw)
  I/O Ports: 0xc000-0xc00f (rw)
  Memory Range: 0xf7810000-0xf78101ff (rw,non-prefetchable)
  Memory Range: 0xf7800000-0xf780ffff (ro,non-prefetchable,disabled)
  IRQ: 34 (no events)
  Module Alias: "pci:v00001B4Bd00009172sv00001043sd00008477bc01sc06i01"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #17 (PCI bridge)

19: PCI 16.0: 0780 Communication controller
  [Created at pci.386]
  Unique ID: WnlC.lnaWSLq39x5
  SysFS ID: /devices/pci0000:00/0000:00:16.0
  SysFS BusID: 0000:00:16.0
  Hardware Class: unknown
  Model: "Intel 6 Series/C200 Series Chipset Family MEI Controller #1"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c3a "6 Series/C200 Series Chipset Family MEI Controller #1"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0x04
  Driver: "mei_me"
  Driver Modules: "mei_me"
  Memory Range: 0xf7d2c000-0xf7d2c00f (rw,non-prefetchable)
  IRQ: 46 (18 events)
  Module Alias: "pci:v00008086d00001C3Asv00001043sd0000844Dbc07sc80i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

20: PCI 1b.0: 0403 Audio device
  [Created at pci.386]
  Unique ID: u1Nb.vJoKilYFVk8
  SysFS ID: /devices/pci0000:00/0000:00:1b.0
  SysFS BusID: 0000:00:1b.0
  Hardware Class: sound
  Model: "Intel 6 Series/C200 Series Chipset Family High Definition Audio Controller"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c20 "6 Series/C200 Series Chipset Family High Definition Audio Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x8410 
  Revision: 0x05
  Driver: "snd_hda_intel"
  Driver Modules: "snd_hda_intel"
  Memory Range: 0xf7d20000-0xf7d23fff (rw,non-prefetchable)
  IRQ: 48 (543 events)
  Module Alias: "pci:v00008086d00001C20sv00001043sd00008410bc04sc03i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

21: PCI 1c.3: 0604 PCI bridge (Normal decode)
  [Created at pci.386]
  Unique ID: Z7uZ.VRGSI7dFTA2
  SysFS ID: /devices/pci0000:00/0000:00:1c.3
  SysFS BusID: 0000:00:1c.3
  Hardware Class: bridge
  Model: "Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 4"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c16 "6 Series/C200 Series Chipset Family PCI Express Root Port 4"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d 
  Revision: 0xb5
  Driver: "pcieport"
  IRQ: 29 (no events)
  Module Alias: "pci:v00008086d00001C16sv00001043sd0000844Dbc06sc04i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

22: PCI 19.0: 0200 Ethernet controller
  [Created at pci.386]
  Unique ID: kpGf.4SWBtWsvg96
  SysFS ID: /devices/pci0000:00/0000:00:19.0
  SysFS BusID: 0000:00:19.0
  Hardware Class: network
  Device Name: "Onboard LAN"
  Model: "Intel 82579V Gigabit Network Connection"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1503 "82579V Gigabit Network Connection"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x849c "P8P67 Deluxe Motherboard"
  Revision: 0x05
  Driver: "e1000e"
  Driver Modules: "e1000e"
  Memory Range: 0xf7d00000-0xf7d1ffff (rw,non-prefetchable)
  Memory Range: 0xf7d29000-0xf7d29fff (rw,non-prefetchable)
  I/O Ports: 0xf080-0xf09f (rw)
  IRQ: 45 (20275 events)
  Module Alias: "pci:v00008086d00001503sv00001043sd0000849Cbc02sc00i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

23: PCI 1f.3: 0c05 SMBus
  [Created at pci.386]
  Unique ID: nS1_.Y6ssQ7vTbYD
  SysFS ID: /devices/pci0000:00/0000:00:1f.3
  SysFS BusID: 0000:00:1f.3
  Hardware Class: unknown
  Model: "Intel 6 Series/C200 Series Chipset Family SMBus Controller"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c22 "6 Series/C200 Series Chipset Family SMBus Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0x05
  Driver: "i801_smbus"
  Driver Modules: "i2c_i801"
  Memory Range: 0xf7d25000-0xf7d250ff (rw,non-prefetchable)
  I/O Ports: 0xf040-0xf05f (rw)
  IRQ: 18 (no events)
  Module Alias: "pci:v00008086d00001C22sv00001043sd0000844Dbc0Csc05i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

24: PCI 00.0: 0600 Host bridge
  [Created at pci.386]
  Unique ID: qLht.6yCj95_hCA2
  SysFS ID: /devices/pci0000:00/0000:00:00.0
  SysFS BusID: 0000:00:00.0
  Hardware Class: bridge
  Model: "Intel 2nd Generation Core Processor Family DRAM Controller"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x0100 "2nd Generation Core Processor Family DRAM Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8P67/P8H67 Series Motherboard"
  Revision: 0x09
  Driver: "snb_uncore"
  Driver Modules: "intel_uncore"
  Module Alias: "pci:v00008086d00000100sv00001043sd0000844Dbc06sc00i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

25: PCI 1c.1: 0604 PCI bridge (Normal decode)
  [Created at pci.386]
  Unique ID: qTvu.RnUSNr8RMe0
  SysFS ID: /devices/pci0000:00/0000:00:1c.1
  SysFS BusID: 0000:00:1c.1
  Hardware Class: bridge
  Model: "Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 2"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c12 "6 Series/C200 Series Chipset Family PCI Express Root Port 2"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d 
  Revision: 0xb5
  Driver: "pcieport"
  IRQ: 28 (no events)
  Module Alias: "pci:v00008086d00001C12sv00001043sd0000844Dbc06sc04i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

26: PCI 600.0: 0604 PCI bridge (Subtractive decode)
  [Created at pci.386]
  Unique ID: vTuk.ulR5c185+GC
  Parent ID: 96M4.Wvn1VRdvGwC
  SysFS ID: /devices/pci0000:00/0000:00:1c.6/0000:06:00.0
  SysFS BusID: 0000:06:00.0
  Hardware Class: bridge
  Model: "ASMedia ASM1083/1085 PCIe to PCI Bridge"
  Vendor: pci 0x1b21 "ASMedia Technology Inc."
  Device: pci 0x1080 "ASM1083/1085 PCIe to PCI Bridge"
  SubVendor: pci 0x1b21 "ASMedia Technology Inc."
  SubDevice: pci 0x1080 
  Revision: 0x01
  IRQ: 18 (no events)
  Module Alias: "pci:v00001B21d00001080sv00001B21sd00001080bc06sc04i01"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #30 (PCI bridge)

27: PCI 1a.0: 0c03 USB Controller (EHCI)
  [Created at pci.386]
  Unique ID: pwJ7.hFysTvgtVM8
  SysFS ID: /devices/pci0000:00/0000:00:1a.0
  SysFS BusID: 0000:00:1a.0
  Hardware Class: usb controller
  Model: "Intel 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c2d "6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0x05
  Driver: "ehci-pci"
  Memory Range: 0xf7d28000-0xf7d283ff (rw,non-prefetchable)
  IRQ: 16 (29 events)
  Module Alias: "pci:v00008086d00001C2Dsv00001043sd0000844Dbc0Csc03i20"
  Driver Info #0:
    Driver Status: ehci-hcd is not active
    Driver Activation Cmd: "modprobe ehci-hcd"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

28: PCI 500.0: 0c03 USB Controller (XHCI)
  [Created at pci.386]
  Unique ID: Ddhb.8cmnBHRnQdA
  Parent ID: QSNP.XG9yFCCuWW1
  SysFS ID: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0
  SysFS BusID: 0000:05:00.0
  Hardware Class: usb controller
  Model: "ASMedia ASM1042 SuperSpeed USB Host Controller"
  Vendor: pci 0x1b21 "ASMedia Technology Inc."
  Device: pci 0x1042 "ASM1042 SuperSpeed USB Host Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x8488 "P8B WS Motherboard"
  Driver: "xhci_hcd"
  Memory Range: 0xf7a00000-0xf7a07fff (rw,non-prefetchable)
  IRQ: 16 (29 events)
  Module Alias: "pci:v00001B21d00001042sv00001043sd00008488bc0Csc03i30"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #32 (PCI bridge)

29: PCI 1d.0: 0c03 USB Controller (EHCI)
  [Created at pci.386]
  Unique ID: 1GTX.4MLd6wrxpg5
  SysFS ID: /devices/pci0000:00/0000:00:1d.0
  SysFS BusID: 0000:00:1d.0
  Hardware Class: usb controller
  Model: "Intel 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c26 "6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0x05
  Driver: "ehci-pci"
  Memory Range: 0xf7d27000-0xf7d273ff (rw,non-prefetchable)
  IRQ: 23 (238 events)
  Module Alias: "pci:v00008086d00001C26sv00001043sd0000844Dbc0Csc03i20"
  Driver Info #0:
    Driver Status: ehci-hcd is not active
    Driver Activation Cmd: "modprobe ehci-hcd"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

30: PCI 1c.6: 0604 PCI bridge (Subtractive decode)
  [Created at pci.386]
  Unique ID: 96M4.Wvn1VRdvGwC
  SysFS ID: /devices/pci0000:00/0000:00:1c.6
  SysFS BusID: 0000:00:1c.6
  Hardware Class: bridge
  Model: "Intel 82801 PCI Bridge"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x244e "82801 PCI Bridge"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d "P8 series motherboard"
  Revision: 0xb5
  Driver: "pcieport"
  IRQ: 31 (no events)
  Module Alias: "pci:v00008086d0000244Esv00001043sd0000844Dbc06sc04i01"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

31: PCI 702.0: 0c00 FireWire (IEEE 1394) (OHCI)
  [Created at pci.386]
  Unique ID: kYBq.j4k03DdbYFA
  Parent ID: vTuk.ulR5c185+GC
  SysFS ID: /devices/pci0000:00/0000:00:1c.6/0000:06:00.0/0000:07:02.0
  SysFS BusID: 0000:07:02.0
  Hardware Class: firewire controller
  Model: "VIA VT6306/7/8 [Fire II(M)] IEEE 1394 OHCI Controller"
  Vendor: pci 0x1106 "VIA Technologies, Inc."
  Device: pci 0x3044 "VT6306/7/8 [Fire II(M)] IEEE 1394 OHCI Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x81fe "Motherboard"
  Revision: 0xc0
  Driver: "firewire_ohci"
  Driver Modules: "firewire_ohci"
  Memory Range: 0xf7900000-0xf79007ff (rw,non-prefetchable)
  I/O Ports: 0xd000-0xd07f (rw)
  IRQ: 17 (2 events)
  Module Alias: "pci:v00001106d00003044sv00001043sd000081FEbc0Csc00i10"
  Driver Info #0:
    Driver Status: ohci1394 is not active
    Driver Activation Cmd: "modprobe ohci1394"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #26 (PCI bridge)

32: PCI 1c.4: 0604 PCI bridge (Normal decode)
  [Created at pci.386]
  Unique ID: QSNP.XG9yFCCuWW1
  SysFS ID: /devices/pci0000:00/0000:00:1c.4
  SysFS BusID: 0000:00:1c.4
  Hardware Class: bridge
  Model: "Intel 6 Series/C200 Series Chipset Family PCI Express Root Port 5"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x1c18 "6 Series/C200 Series Chipset Family PCI Express Root Port 5"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d 
  Revision: 0xb5
  Driver: "pcieport"
  IRQ: 30 (no events)
  Module Alias: "pci:v00008086d00001C18sv00001043sd0000844Dbc06sc04i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

33: PCI 400.0: 0106 SATA controller (AHCI 1.0)
  [Created at pci.386]
  Unique ID: YmUS.Cw47iGKkO1A
  Parent ID: Z7uZ.VRGSI7dFTA2
  SysFS ID: /devices/pci0000:00/0000:00:1c.3/0000:04:00.0
  SysFS BusID: 0000:04:00.0
  Hardware Class: storage
  Model: "JMicron JMB362 SATA Controller"
  Vendor: pci 0x197b "JMicron Technology Corp."
  Device: pci 0x2362 "JMB362 SATA Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x8460 "P8P67 Deluxe Motherboard"
  Revision: 0x10
  Driver: "ahci"
  Driver Modules: "ahci"
  I/O Ports: 0xe040-0xe047 (rw)
  I/O Ports: 0xe030-0xe033 (rw)
  I/O Ports: 0xe020-0xe027 (rw)
  I/O Ports: 0xe010-0xe013 (rw)
  I/O Ports: 0xe000-0xe00f (rw)
  Memory Range: 0xf7b10000-0xf7b101ff (rw,non-prefetchable)
  Memory Range: 0xf7b00000-0xf7b0ffff (ro,non-prefetchable,disabled)
  IRQ: 19 (no events)
  Module Alias: "pci:v0000197Bd00002362sv00001043sd00008460bc01sc06i01"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #21 (PCI bridge)

34: PCI 02.0: 0300 VGA compatible controller (VGA)
  [Created at pci.386]
  Unique ID: _Znp.5KRTaPXMxLE
  SysFS ID: /devices/pci0000:00/0000:00:02.0
  SysFS BusID: 0000:00:02.0
  Hardware Class: graphics card
  Device Name: "Onboard IGD"
  Model: "Intel 2nd Generation Core Processor Family Integrated Graphics Controller"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x0102 "2nd Generation Core Processor Family Integrated Graphics Controller"
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x844d 
  Revision: 0x09
  Driver: "i915"
  Driver Modules: "i915"
  Memory Range: 0xf7400000-0xf77fffff (rw,non-prefetchable)
  Memory Range: 0xe0000000-0xefffffff (ro,non-prefetchable)
  I/O Ports: 0xf000-0xf03f (rw)
  Memory Range: 0x000c0000-0x000dffff (rw,non-prefetchable,disabled)
  IRQ: 47 (727 events)
  I/O Port: 0x00 (rw)
  Module Alias: "pci:v00008086d00000102sv00001043sd0000844Dbc03sc00i00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown

35: None 00.0: 10002 LCD Monitor
  [Created at monitor.125]
  Unique ID: rdCR.l96Wplqi0fC
  Parent ID: _Znp.5KRTaPXMxLE
  Hardware Class: monitor
  Model: "SONY TV"
  Vendor: SNY "SONY"
  Device: eisa 0xc901 "SONY TV"
  Resolution: 640x480@60Hz
  Resolution: 800x600@60Hz
  Resolution: 1024x768@60Hz
  Resolution: 1280x1024@60Hz
  Resolution: 1280x720@60Hz
  Resolution: 1920x1080@60Hz
  Size: 1600x900 mm
  Year of Manufacture: 2009
  Week of Manufacture: 1
  Detailed Timings #0:
     Resolution: 1920x1080
     Horizontal: 1920 2008 2052 2200 (+88 +132 +280) +hsync
       Vertical: 1080 1084 1089 1125 (+4 +9 +45) +vsync
    Frequencies: 148.50 MHz, 67.50 kHz, 60.00 Hz
  Year of Manufacture: 2009
  Week of Manufacture: 1
  Detailed Timings #1:
     Resolution: 1280x720
     Horizontal: 1280 1390 1430 1650 (+110 +150 +370) +hsync
       Vertical:  720  725  730  750 (+5 +10 +30) +vsync
    Frequencies: 74.25 MHz, 45.00 kHz, 60.00 Hz
  Driver Info #0:
    Max. Resolution: 1920x1080
    Vert. Sync Range: 48-62 Hz
    Hor. Sync Range: 14-70 kHz
    Bandwidth: 148 MHz
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #34 (VGA compatible controller)

36: SCSI 400.0: 10602 CD-ROM (DVD)
  [Created at block.249]
  Unique ID: KD9E.bSjhFrTjQf2
  Parent ID: w7Y8.PwL6QhrcKc7
  SysFS ID: /class/block/sr0
  SysFS BusID: 4:0:0:0
  SysFS Device Link: /devices/pci0000:00/0000:00:1f.2/ata5/host4/target4:0:0/4:0:0:0
  Hardware Class: cdrom
  Model: "TSSTcorp DVD-ROM TS-H353B"
  Vendor: "TSSTcorp"
  Device: "DVD-ROM TS-H353B"
  Revision: "D500"
  Driver: "ahci", "sr"
  Driver Modules: "ahci"
  Device File: /dev/sr0 (/dev/sg0)
  Device Number: block 11:0 (char 21:0)
  Features: DVD
  Drive status: no medium
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #13 (SATA controller)
  Drive Speed: 48

37: IDE 500.0: 10600 Disk
  [Created at block.245]
  Unique ID: 3OOL.AIyo6nkjXe0
  Parent ID: w7Y8.PwL6QhrcKc7
  SysFS ID: /class/block/sda
  SysFS BusID: 5:0:0:0
  SysFS Device Link: /devices/pci0000:00/0000:00:1f.2/ata6/host5/target5:0:0/5:0:0:0
  Hardware Class: disk
  Model: "ST31000340NS"
  Device: "ST31000340NS"
  Revision: "MA08"
  Driver: "ahci", "sd"
  Driver Modules: "ahci"
  Device File: /dev/sda
  Device Number: block 8:0-8:15
  BIOS id: 0x80
  Drive status: no medium
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #13 (SATA controller)

38: None 00.0: 11300 Partition
  [Created at block.434]
  Unique ID: bdUI.SE1wIdpsiiC
  Parent ID: 3OOL.AIyo6nkjXe0
  SysFS ID: /class/block/sda/sda1
  Hardware Class: partition
  Model: "Partition"
  Device File: /dev/sda1
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #37 (Disk)

39: None 00.0: 11300 Partition
  [Created at block.434]
  Unique ID: 2pkM.SE1wIdpsiiC
  Parent ID: 3OOL.AIyo6nkjXe0
  SysFS ID: /class/block/sda/sda2
  Hardware Class: partition
  Model: "Partition"
  Device File: /dev/sda2
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #37 (Disk)

40: None 00.0: 11300 Partition
  [Created at block.434]
  Unique ID: W__Q.SE1wIdpsiiC
  Parent ID: 3OOL.AIyo6nkjXe0
  SysFS ID: /class/block/sda/sda3
  Hardware Class: partition
  Model: "Partition"
  Device File: /dev/sda3
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #37 (Disk)

41: None 00.0: 11300 Partition
  [Created at block.434]
  Unique ID: z9FV.SE1wIdpsiiC
  Parent ID: 3OOL.AIyo6nkjXe0
  SysFS ID: /class/block/sda/sda4
  Hardware Class: partition
  Model: "Partition"
  Device File: /dev/sda4
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #37 (Disk)

42: USB 00.4: 10503 USB Mouse
  [Created at usb.122]
  Unique ID: h_rc.fJQVhV8Q7J1
  Parent ID: FKGF.4Nx_qoDfSd7
  SysFS ID: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.4
  SysFS BusID: 2-1.2:1.4
  Hardware Class: mouse
  Model: "OpenMoko Ultimate Hacking Keyboard"
  Hotplug: USB
  Vendor: usb 0x1d50 "OpenMoko, Inc."
  Device: usb 0x6122 "Ultimate Hacking Keyboard"
  Revision: "1.01"
  Compatible to: int 0x0210 0x0048
  Driver: "usbhid"
  Driver Modules: "usbhid"
  Device File: /dev/input/mice (/dev/input/mouse0)
  Device Files: /dev/input/mice, /dev/input/mouse0, /dev/input/event5
  Device Number: char 13:63 (char 13:32)
  Speed: 12 Mbps
  Module Alias: "usb:v1D50p6122d0101dc00dsc00dp00ic03isc01ip02in04"
  Driver Info #0:
    Buttons: 8
    Wheels: 4
    XFree86 Protocol: explorerps/2
    GPM Protocol: exps2
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #45 (Hub)

43: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: 7eqy.B2sJIkct3XB
  Parent ID: Ddhb.8cmnBHRnQdA
  SysFS ID: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb6/6-0:1.0
  SysFS BusID: 6-0:1.0
  Hardware Class: hub
  Model: "Linux Foundation 3.0 root hub"
  Hotplug: USB
  Vendor: usb 0x1d6b "Linux Foundation"
  Device: usb 0x0003 "3.0 root hub"
  Revision: "5.05"
  Serial ID: "0000:05:00.0"
  Driver: "hub"
  Driver Modules: "usbcore"
  Module Alias: "usb:v1D6Bp0003d0505dc09dsc00dp03ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #28 (USB Controller)

44: USB 00.2: 0000 Unclassified device
  [Created at usb.122]
  Unique ID: ndLU.6IzIaJpm7T3
  Parent ID: FKGF.4Nx_qoDfSd7
  SysFS ID: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.2
  SysFS BusID: 2-1.2:1.2
  Hardware Class: unknown
  Model: "OpenMoko Ultimate Hacking Keyboard"
  Hotplug: USB
  Vendor: usb 0x1d50 "OpenMoko, Inc."
  Device: usb 0x6122 "Ultimate Hacking Keyboard"
  Revision: "1.01"
  Driver: "usbhid"
  Driver Modules: "usbhid"
  Device File: /dev/input/event3
  Device Number: char 13:67
  Speed: 12 Mbps
  Module Alias: "usb:v1D50p6122d0101dc00dsc00dp00ic03isc00ip00in02"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #45 (Hub)

45: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: FKGF.4Nx_qoDfSd7
  Parent ID: pBe4.oLWCeziExdF
  SysFS ID: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1:1.0
  SysFS BusID: 2-1:1.0
  Hardware Class: hub
  Model: "Intel Integrated Rate Matching Hub"
  Hotplug: USB
  Vendor: usb 0x8087 "Intel Corp."
  Device: usb 0x0024 "Integrated Rate Matching Hub"
  Driver: "hub"
  Driver Modules: "usbcore"
  Speed: 480 Mbps
  Module Alias: "usb:v8087p0024d0000dc09dsc00dp01ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #55 (Hub)

47: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: uIhY.029GFTetOb3
  Parent ID: svHJ.8cmnBHRnQdA
  SysFS ID: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb3/3-0:1.0
  SysFS BusID: 3-0:1.0
  Hardware Class: hub
  Model: "Linux Foundation 2.0 root hub"
  Hotplug: USB
  Vendor: usb 0x1d6b "Linux Foundation"
  Device: usb 0x0002 "2.0 root hub"
  Revision: "5.05"
  Serial ID: "0000:03:00.0"
  Driver: "hub"
  Driver Modules: "usbcore"
  Speed: 480 Mbps
  Module Alias: "usb:v1D6Bp0002d0505dc09dsc00dp01ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #12 (USB Controller)

48: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: zPk0.vNHThQQZKpC
  Parent ID: svHJ.8cmnBHRnQdA
  SysFS ID: /devices/pci0000:00/0000:00:1c.1/0000:03:00.0/usb4/4-0:1.0
  SysFS BusID: 4-0:1.0
  Hardware Class: hub
  Model: "Linux Foundation 3.0 root hub"
  Hotplug: USB
  Vendor: usb 0x1d6b "Linux Foundation"
  Device: usb 0x0003 "3.0 root hub"
  Revision: "5.05"
  Serial ID: "0000:03:00.0"
  Driver: "hub"
  Driver Modules: "usbcore"
  Module Alias: "usb:v1D6Bp0003d0505dc09dsc00dp03ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #12 (USB Controller)

49: USB 00.0: 11500 Bluetooth Device
  [Created at usb.122]
  Unique ID: o2Ga.NbJBKWxMNPB
  Parent ID: FKGF.4Nx_qoDfSd7
  SysFS ID: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.7/2-1.7:1.0
  SysFS BusID: 2-1.7:1.0
  Hardware Class: bluetooth
  Model: "ASUSTek Bluetooth Device"
  Hotplug: USB
  Vendor: usb 0x0b05 "ASUSTek Computer, Inc."
  Device: usb 0x179c 
  Revision: "0.01"
  Driver: "btusb"
  Driver Modules: "btusb"
  Speed: 12 Mbps
  Module Alias: "usb:v0B05p179Cd0001dcE0dsc01dp01icE0isc01ip01in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #45 (Hub)

51: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: k4bc.FHd55n4xKo7
  Parent ID: pwJ7.hFysTvgtVM8
  SysFS ID: /devices/pci0000:00/0000:00:1a.0/usb1/1-0:1.0
  SysFS BusID: 1-0:1.0
  Hardware Class: hub
  Model: "Linux Foundation 2.0 root hub"
  Hotplug: USB
  Vendor: usb 0x1d6b "Linux Foundation"
  Device: usb 0x0002 "2.0 root hub"
  Revision: "5.05"
  Serial ID: "0000:00:1a.0"
  Driver: "hub"
  Driver Modules: "usbcore"
  Speed: 480 Mbps
  Module Alias: "usb:v1D6Bp0002d0505dc09dsc00dp00ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #27 (USB Controller)

52: USB 00.1: 10800 Keyboard
  [Created at usb.122]
  Unique ID: KS5Q.NBu8Dn+ADQ9
  Parent ID: FKGF.4Nx_qoDfSd7
  SysFS ID: /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1
  SysFS BusID: 2-1.2:1.1
  Hardware Class: keyboard
  Model: "OpenMoko Ultimate Hacking Keyboard"
  Hotplug: USB
  Vendor: usb 0x1d50 "OpenMoko, Inc."
  Device: usb 0x6122 "Ultimate Hacking Keyboard"
  Revision: "1.01"
  Driver: "usbhid"
  Driver Modules: "usbhid"
  Device File: /dev/input/event2
  Device Number: char 13:66
  Speed: 12 Mbps
  Module Alias: "usb:v1D50p6122d0101dc00dsc00dp00ic03isc01ip01in01"
  Driver Info #0:
    XkbRules: xfree86
    XkbModel: pc104
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #45 (Hub)

53: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: 2XnU.Iij6smqB8J2
  Parent ID: Ddhb.8cmnBHRnQdA
  SysFS ID: /devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb5/5-0:1.0
  SysFS BusID: 5-0:1.0
  Hardware Class: hub
  Model: "Linux Foundation 2.0 root hub"
  Hotplug: USB
  Vendor: usb 0x1d6b "Linux Foundation"
  Device: usb 0x0002 "2.0 root hub"
  Revision: "5.05"
  Serial ID: "0000:05:00.0"
  Driver: "hub"
  Driver Modules: "usbcore"
  Speed: 480 Mbps
  Module Alias: "usb:v1D6Bp0002d0505dc09dsc00dp01ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #28 (USB Controller)

54: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: ADDn.4Nx_qoDfSd7
  Parent ID: k4bc.FHd55n4xKo7
  SysFS ID: /devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1:1.0
  SysFS BusID: 1-1:1.0
  Hardware Class: hub
  Model: "Intel Integrated Rate Matching Hub"
  Hotplug: USB
  Vendor: usb 0x8087 "Intel Corp."
  Device: usb 0x0024 "Integrated Rate Matching Hub"
  Driver: "hub"
  Driver Modules: "usbcore"
  Speed: 480 Mbps
  Module Alias: "usb:v8087p0024d0000dc09dsc00dp01ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #51 (Hub)

55: USB 00.0: 10a00 Hub
  [Created at usb.122]
  Unique ID: pBe4.oLWCeziExdF
  Parent ID: 1GTX.4MLd6wrxpg5
  SysFS ID: /devices/pci0000:00/0000:00:1d.0/usb2/2-0:1.0
  SysFS BusID: 2-0:1.0
  Hardware Class: hub
  Model: "Linux Foundation 2.0 root hub"
  Hotplug: USB
  Vendor: usb 0x1d6b "Linux Foundation"
  Device: usb 0x0002 "2.0 root hub"
  Revision: "5.05"
  Serial ID: "0000:00:1d.0"
  Driver: "hub"
  Driver Modules: "usbcore"
  Speed: 480 Mbps
  Module Alias: "usb:v1D6Bp0002d0505dc09dsc00dp00ic09isc00ip00in00"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #29 (USB Controller)

57: None 00.0: 10103 CPU
  [Created at cpu.462]
  Unique ID: rdCR.j8NaKXDZtZ6
  Hardware Class: cpu
  Arch: X86-64
  Vendor: "GenuineIntel"
  Model: 6.42.7 "Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz"
  Features: fpu,vme,de,pse,tsc,msr,pae,mce,cx8,apic,sep,mtrr,pge,mca,cmov,pat,pse36,clflush,dts,acpi,mmx,fxsr,sse,sse2,ht,tm,pbe,syscall,nx,rdtscp,lm,constant_tsc,arch_perfmon,pebs,bts,rep_good,nopl,xtopology,nonstop_tsc,cpuid,aperfmperf,pni,pclmulqdq,dtes64,monitor,ds_cpl,vmx,smx,est,tm2,ssse3,cx16,xtpr,pdcm,pcid,sse4_1,sse4_2,x2apic,popcnt,tsc_deadline_timer,aes,xsave,avx,lahf_lm,epb,pti,ssbd,ibrs,ibpb,stibp,tpr_shadow,vnmi,flexpriority,ept,vpid,xsaveopt,dtherm,ida,arat,pln,pts,md_clear,flush_l1d
  Clock: 2917 MHz
  BogoMips: 6822.03
  Cache: 8192 kb
  Units/Processor: 16
  Config Status: cfg=new, avail=yes, need=no, active=unknown

58: None 01.0: 10103 CPU
  [Created at cpu.462]
  Unique ID: wkFv.j8NaKXDZtZ6
  Hardware Class: cpu
  Arch: X86-64
  Vendor: "GenuineIntel"
  Model: 6.42.7 "Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz"
  Features: fpu,vme,de,pse,tsc,msr,pae,mce,cx8,apic,sep,mtrr,pge,mca,cmov,pat,pse36,clflush,dts,acpi,mmx,fxsr,sse,sse2,ht,tm,pbe,syscall,nx,rdtscp,lm,constant_tsc,arch_perfmon,pebs,bts,rep_good,nopl,xtopology,nonstop_tsc,cpuid,aperfmperf,pni,pclmulqdq,dtes64,monitor,ds_cpl,vmx,smx,est,tm2,ssse3,cx16,xtpr,pdcm,pcid,sse4_1,sse4_2,x2apic,popcnt,tsc_deadline_timer,aes,xsave,avx,lahf_lm,epb,pti,ssbd,ibrs,ibpb,stibp,tpr_shadow,vnmi,flexpriority,ept,vpid,xsaveopt,dtherm,ida,arat,pln,pts,md_clear,flush_l1d
  Clock: 2654 MHz
  BogoMips: 6822.03
  Cache: 8192 kb
  Units/Processor: 16
  Config Status: cfg=new, avail=yes, need=no, active=unknown

59: None 02.0: 10103 CPU
  [Created at cpu.462]
  Unique ID: +rIN.j8NaKXDZtZ6
  Hardware Class: cpu
  Arch: X86-64
  Vendor: "GenuineIntel"
  Model: 6.42.7 "Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz"
  Features: fpu,vme,de,pse,tsc,msr,pae,mce,cx8,apic,sep,mtrr,pge,mca,cmov,pat,pse36,clflush,dts,acpi,mmx,fxsr,sse,sse2,ht,tm,pbe,syscall,nx,rdtscp,lm,constant_tsc,arch_perfmon,pebs,bts,rep_good,nopl,xtopology,nonstop_tsc,cpuid,aperfmperf,pni,pclmulqdq,dtes64,monitor,ds_cpl,vmx,smx,est,tm2,ssse3,cx16,xtpr,pdcm,pcid,sse4_1,sse4_2,x2apic,popcnt,tsc_deadline_timer,aes,xsave,avx,lahf_lm,epb,pti,ssbd,ibrs,ibpb,stibp,tpr_shadow,vnmi,flexpriority,ept,vpid,xsaveopt,dtherm,ida,arat,pln,pts,md_clear,flush_l1d
  Clock: 3154 MHz
  BogoMips: 6822.03
  Cache: 8192 kb
  Units/Processor: 16
  Config Status: cfg=new, avail=yes, need=no, active=unknown

60: None 03.0: 10103 CPU
  [Created at cpu.462]
  Unique ID: 4zLr.j8NaKXDZtZ6
  Hardware Class: cpu
  Arch: X86-64
  Vendor: "GenuineIntel"
  Model: 6.42.7 "Intel(R) Core(TM) i7-2600 CPU @ 3.40GHz"
  Features: fpu,vme,de,pse,tsc,msr,pae,mce,cx8,apic,sep,mtrr,pge,mca,cmov,pat,pse36,clflush,dts,acpi,mmx,fxsr,sse,sse2,ht,tm,pbe,syscall,nx,rdtscp,lm,constant_tsc,arch_perfmon,pebs,bts,rep_good,nopl,xtopology,nonstop_tsc,cpuid,aperfmperf,pni,pclmulqdq,dtes64,monitor,ds_cpl,vmx,smx,est,tm2,ssse3,cx16,xtpr,pdcm,pcid,sse4_1,sse4_2,x2apic,popcnt,tsc_deadline_timer,aes,xsave,avx,lahf_lm,epb,pti,ssbd,ibrs,ibpb,stibp,tpr_shadow,vnmi,flexpriority,ept,vpid,xsaveopt,dtherm,ida,arat,pln,pts,md_clear,flush_l1d
  Clock: 2389 MHz
  BogoMips: 6822.03
  Cache: 8192 kb
  Units/Processor: 16
  Config Status: cfg=new, avail=yes, need=no, active=unknown

61: Serial 00.0: 10801 Console
  [Created at kbd.165]
  Unique ID: Fyby.5lXXuQkv_C5
  Hardware Class: keyboard
  Model: "serial console"
  Device: "serial console"
  Device File: /dev/ttyS0
  Speed: 115.2 kbps
  Config: 8 bits, parity n
  Config Status: cfg=new, avail=yes, need=no, active=unknown

62: None 00.0: 10700 Loopback
  [Created at net.126]
  Unique ID: ZsBS.GQNx7L4uPNA
  SysFS ID: /class/net/lo
  Hardware Class: network interface
  Model: "Loopback network interface"
  Device File: lo
  Link detected: yes
  Config Status: cfg=new, avail=yes, need=no, active=unknown

63: None 00.0: 10701 Ethernet
  [Created at net.126]
  Unique ID: usDW.ndpeucax6V1
  SysFS ID: /class/net/eth0
  Hardware Class: network interface
  Model: "Ethernet network interface"
  Driver: "veth"
  Device File: eth0
  HW Address: 02:42:ac:11:00:02
  Link detected: yes
  Config Status: cfg=new, avail=yes, need=no, active=unknown
```

# Compatibility

https://www.pc-specs.com/gpu/ATI/R-500_Series/Radeon_RX_570_4GB/3875/Compatible_Motherboards