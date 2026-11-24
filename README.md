# :computer: WinRar-Packer

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Description](https://github.com/user-attachments/assets/dbf330e0-633c-4b31-a0ef-b1edb9ed5aa7) <img width="91" height="20" alt="WinRarPacker" src="https://github.com/user-attachments/assets/cb4202db-5b8e-48f4-b982-ec6945886bee" />  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) <img width="57" height="20" alt="112026" src="https://github.com/user-attachments/assets/b307d88a-9d77-4853-9ec4-93a24b7cc151" />  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

<img width="500" height="142" alt="logo" src="https://github.com/user-attachments/assets/e40b53b6-45c1-4f2e-8f2e-58d654ad1047" />

<br><br>

WinRAR is a trialware [file archiver](https://en.wikipedia.org/wiki/File_archiver) and [compression](https://en.wikipedia.org/wiki/Data_compression) utility for Microsoft Windows, developed by [Eugene Roshal](https://en.wikipedia.org/wiki/Eugene_Roshal) of win.rar GmbH (RARLAB) since 1995. It can create and view archives in [RAR](https://en.wikipedia.org/wiki/RAR_(file_format)) (a format created by Roshal) or [ZIP](https://en.wikipedia.org/wiki/ZIP_(file_format)) file formats, and unpack numerous archive file formats. To enable the user to test the integrity of archives, WinRAR embeds [CRC-32](https://en.wikipedia.org/wiki/Computation_of_cyclic_redundancy_checks#CRC-32_example) or [BLAKE2](https://en.wikipedia.org/wiki/BLAKE_(hash_function)#BLAKE2) checksums for each file in each archive. WinRAR supports creating encrypted, multi-part and [self-extracting archives](https://en.wikipedia.org/wiki/Self-extracting_archive).

<br>

<img width="700" height="463" alt="WinRar Packer" src="https://github.com/user-attachments/assets/db86fe5d-8e12-4735-9569-e650d020e2ce" />

<br><br>

RARLAB also offers a mobile version as freeware for Android under the name RAR for Android. Related programs include [command-line](https://en.wikipedia.org/wiki/Command-line) utilities RAR and UNRAR which are also released for macOS, Linux, FreeBSD, and in the past for Windows CE, MS-DOS and OS/2.

<br>

<img width="700" height="463" alt="WinRar options" src="https://github.com/user-attachments/assets/e130f0ee-eb73-48c8-ba47-05db48ec4374" />

<br><br>

# :wrench: Features
### Unpacking
* Creation of packed RAR or ZIP archives.
* Ability to create self-extracting files (multi-volume self-extracting archives are supported; the self-extractor can execute commands, such as running a specified program before or after self-extraction
* Unpacking of
    * RAR, tar, ARJ, LHA, ZIP (and its subsed JAR) and WinZip ZIPX archives
    * [Windows Cabinet files](https://en.wikipedia.org/wiki/Cabinet_(file_format)) (.CAB)
    * [ISO 9660](https://en.wikipedia.org/wiki/ISO_9660)) optical disk images
    * [Unix compress](https://en.wikipedia.org/wiki/Compress_(software)) (.Z), gzip, bzip2, lzip, xz, 7z and zstandard compressed files
    * [uuencoded files](https://en.wikipedia.org/wiki/Uuencoding), as well as split files
    * Some of [self-extracting archive](https://en.wikipedia.org/wiki/Self-extracting_archive) formats stored as .exe files
* [Checksum](https://en.wikipedia.org/wiki/Checksum) (integrity) verification for ARJ, bzip2, Cabinet file, gzip, lzip, RAR, xz, ZIP and 7z archives
* [Multithreaded CPU](https://en.wikipedia.org/wiki/Simultaneous_multithreading) compression and decompression

### When creating RAR archives:
* Support for maximum file size of 16 [EiB](https://en.wikipedia.org/wiki/Byte#Multiple-byte_units), about 1.8 × 1019 bytes or 18 million TB
* Compression dictionary from 1 MiB to 64 GiB (it is limited to 256 MiB on 32-bit editions, although 32-bit editions still can decompress archives with 1 GiB dictionary; default size is 32 MiB)
* Optional 256-bit [BLAKE2](https://en.wikipedia.org/wiki/BLAKE_(hash_function)#BLAKE2) file hashing that can replace the default 32-bit [CRC-32](https://en.wikipedia.org/wiki/Cyclic_redundancy_check) file checksum

<br>

# :wrench: Self-extracting archive
A self-extracting archive (SFX or SEA) is a computer executable program which combines compressed data in an [archive file](https://en.wikipedia.org/wiki/Archive_file) with machine-executable code to extract the information. Running on a compatible operating system, it does not need a suitable extractor in the target computer to extract the data. The executable part of the file is known as a [decompressor stub](https://en.wikipedia.org/wiki/Method_stub).

<br>

<img width="523" height="396" alt="self-extract" src="https://github.com/user-attachments/assets/cfc027f7-6089-4a7a-bd82-b2335b0e2004" />

<br><br>

Self-extracting files are used to share compressed files with a party that may not have the software needed to decompress a regular archive. Users can also use self-extracting archives to distribute their own software. For example, the WinRAR installation program is made using the graphical GUI RAR self-extracting module Default.sfx. 

<br>

# :speech_balloon: Paramaters

Example command : winrar.exe <command> -<Switches 1> -<Switches N> <Archive> <Files...>
               <@File list files...> <Target directory path\>

Character combination specifying the function to be performed by WinRAR. See the list of WinRAR commands

| Commands | Description |
| :------------ | :------------ |
| ```a```	| add files to an archive |
| ```c```	| add an archive comment |
| ```ch```	| change archive parameters |
| ```cv```	| convert archives |
| ```cw```	| write an archive comment to file |
| ```d```	| delete files from an archive |
| ```e```	| extract files from an archive, ignoring paths |
| ```f```	| freshen files within an archive |
| ```i```	| find string in archives |
| ```k```	| lock an archive |
| ```m```	| move files and folders to an archive |
| ```r```	| repair a damaged archive |
| ```rc```	| reconstruct missing volumes |
| ```rn```	| rename archived files |
| ```rr[N]```	| add data recovery record |
| ```rv[N]```	| create recovery volumes |
| ```s[name]```	| convert an archive to a self-extracting type |
| ```s-```	| remove SFX module |
| ```t```	| test archive files |
| ```u```	| update files within an archive |
| ```x```	| extract files from an archive with full paths |

<br>

Switches are used to define a specific type of operation, compression strength, type of archive, etc. See the list of WinRAR switches

| Switches | Description |
| :------------ | :------------ |
| ```a```	| add files to an archive |

