
# TruncatingDatabreach

Truncate a data breach into two files.

### 1 000 000 lines in about 25 seconds (on I5-6500)

This can then be used as two wordlists for a brute-force attack

Example : this will be put into two files
```bash
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
woman@icloud.com:;rockyou
hello@gmail.com:;Pa$$w0rd
hi@outlook.com:;Pass
man@hotmail:;123456789
```

## How it works
- In the first lines of the scipt you have to define the input file path, the two output file paths, the separators and the number of separators.
- Then in two async jobs the files will be written.
- That's all. 

## Warning
- The script will remove all runnings and completed powershell jobs. 
- Work in the folder with the files

## Author
- [@lurto](https://www.github.com/lurto)
