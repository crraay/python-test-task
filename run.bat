@echo off

echo all matches:
script.py "\w+@[\w.-_]+" file.txt
echo.

echo all matches count:
script.py -c "\w+@[\w.-_]+" file.txt
echo.

echo only unique matches:
script.py -u "\w+@[\w.-_]+" file.txt
echo.

echo only unique matches count:
script.py -u -c "\w+@[\w.-_]+" file.txt
echo.

echo count of total lines with matches:
script.py -l "\w+@[\w.-_]+" file.txt
echo.

echo count of total lines with matches (only unique lines):
script.py -l -u "\w+@[\w.-_]+" file.txt
echo.

echo unique matches sorted by alphabet(default) asc (default):
script.py -u "\w+@[\w.-_]+" file.txt
echo.

echo unique matches sorted by alphabet(default) desc:
script.py -u -o desc "\w+@[\w.-_]+" file.txt
echo.

echo unique matches sorted by frequency asc:
script.py -u -s freq "\w+@[\w.-_]+" file.txt
echo.

echo unique matches sorted by frequency desc:
script.py -u -s freq -o desc "\w+@[\w.-_]+" file.txt
echo.

echo first 10 matches (not unique):
script.py -n 10 "\w+@[\w.-_]+" file.txt
echo.

echo first 3 unique matches:
script.py -u -n 3 "\w+@[\w.-_]+" file.txt
echo.

echo 4 most frequent matches:
script.py -u -n 4 -s freq "\w+@[\w.-_]+" file.txt
echo.

echo 4 least frequent matches:
script.py -u -n 4 -s freq -o desc "\w+@[\w.-_]+" file.txt
echo.

echo ----STAT----
echo stat count:
script.py --stat count "\w+@[\w.-_]+" file.txt
echo.

echo stat count sorted by freq:
script.py --stat count -s freq "\w+@[\w.-_]+" file.txt
echo.

echo stat count for 3 matches sorted by freq:
script.py --stat count -s freq -n 3 "\w+@[\w.-_]+" file.txt
echo.

echo stat freq:
script.py --stat freq "\w+@[\w.-_]+" file.txt
echo.

echo stat freq sorted by freq desc:
script.py --stat freq -s freq -o desc "\w+@[\w.-_]+" file.txt
echo.

echo stat freq for 3 matches sorted by freq desc:
script.py --stat freq -s freq -o desc -n 3 "\w+@[\w.-_]+" file.txt
echo.

echo ----groupping also supported----
echo all matches: 
script.py "\w+@([\w.-_]+)" file.txt
echo.

echo all unique matches:
script.py -u "\w+@([\w.-_]+)" file.txt
echo.

echo all unique matches count:
script.py -u -c "\w+@([\w.-_]+)" file.txt
echo.

echo stat count:
script.py --stat count "\w+@([\w.-_]+)" file.txt
echo.

echo ----do you need help?----
script.py --help

pause