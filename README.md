
# TruncatingDatabreach

Truncate a data breach into two files.

This can the be used as two wordlists for a brute-force attack

Example : this will be put into two 
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
```bash
In the first lines of the you will define the input file path, the two output file paths, the separators and the number of separators.
Then in two async jobs the files will be written.
That's all. 
```

## Warning
- This will used a lot of CPU power
- The script will kill all runnings and completed powershell jobs. 

## Author
- [@lurto](https://www.github.com/lurto)
