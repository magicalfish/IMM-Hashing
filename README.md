# IMM-Hashing
Implementation of our paper: IMM-Hashing
----------------------------
How to Run:
Create folder of IMM-Hashing and subfolder of data,Gscore, Iscore, minmaxout and Result.
The unprotected real-valued fixed-length fingerprint feature vector of FVC2002 DB1(copy this file into the data folder) can be downloaded at https://drive.google.com/drive/folders/15ID9bVVADw8bRwlznjgoBM1B2lAlYbri?usp=sharing

Run Min_Max_hash.m to get the EER of the proposed method.
Note that,  EERs are obtained by calculating the average
of the EERs repeated five times because the random partial
Hadamard projection is applied.
