#!/bin/bash
case $1 in
    pa01.c)
	rm -f -- pa01
	gcc pa01.c  -o pa01
	if [ $? -ne 0 ]; then 
	    echo "Compile of pa01.c failed"
	    echo "Good bye!"
	    exit 1 
	fi
	EXE="./pa01"
	;;
    pa01.cpp)
	rm -f -- pa01
	g++ pa01.cpp -o pa01
	if [ $? -ne 0 ]; then 
	    echo "Compile of pa01.cpp failed"
	    echo "Good bye!"
	    exit 1 
	fi
	EXE="./pa01"
	;;
    pa01.go)
	rm -f -- pa01
	go build pa01.go
	if [ $? -ne 0 ]; then 
	    echo "Compile of pa01.go failed"
	    echo "Good bye!"
	    exit 1 
	fi
	EXE="./pa01"
	;;
    pa01.java)
	rm -f -- pa01.class
	javac pa01.java
	if [ $? -ne 0 ]; then 
	    echo "Compile of pa01.java failed"
	    echo "Good bye!"
	    exit 1 
	fi
	EXE="java pa01"
	;;
    pa01.py)
	EXE="python pa01.py"
	;;
    pa01.rs)
	rm -f -- pa01
    	rustc pa01.rs
    	if [ $? -ne 0 ]; then
       	 echo "Compile of pa01.rs failed"
       	 echo "Good bye!"
        	exit 1
    	fi
    EXE="./pa01"
    ;;
*)
    echo "Invalid source file name"
    echo "->  should be pa01.c, pa01.cpp, pa01.go, pa01.java, pa01.py or pa01.rs"
    exit 1
esac

echo "Compile of pa01 succeded."

echo "Case #1 - in10A.txt -  8 bit checksum"
eval $EXE in10A.txt 8 >s10A-Output8.txt
diff -w s10A-Output8.txt s10A-Base8.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #1 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s10A-Output8.txt s10A-Base8.txt
   echo "Case #1 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #1 - in10A.txt - 16 bit checksum"
eval $EXE in10A.txt 16 >s10A-Output16.txt
diff -w s10A-Output16.txt s10A-Base16.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #1 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s10A-Output16.txt s10A-Base16.txt
   echo "Case #1 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "-> Case #1 - in10A.txt - 32 bit checksum"
eval $EXE in10A.txt 32 >s10A-Output32.txt
diff -w s10A-Output32.txt s10A-Base32.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #1 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s10A-Output32.txt s10A-Base32.txt
   echo "Case #1 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #2 - in17A.txt -  8 bit checksum"
eval $EXE in17A.txt 8 >s17A-Output8.txt
diff -w s17A-Output8.txt s17A-Base8.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #2 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s17A-Output8.txt s17A-Base8.txt
   echo "Case #2 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #2 - in17A.txt - 16 bit checksum"
eval $EXE in17A.txt 16 >s17A-Output16.txt
diff -w s17A-Output16.txt s17A-Base16.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #2 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s17A-Output16.txt s17A-Base16.txt
   echo "Case #2 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #2 - in17A.txt - 32 bit checksum"
eval $EXE in17A.txt 32 >s17A-Output32.txt
diff -w s17A-Output32.txt s17A-Base32.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #2 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s17A-Output32.txt s17A-Base32.txt
   echo "Case #2 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #3 - in18A.txt -  8 bit checksum"
eval $EXE in18A.txt 8 >s18A-Output8.txt
diff -w s18A-Output8.txt s18A-Base8.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #3 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s18A-Output8.txt s18A-Base8.txt
   echo "Case #3 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #3 - in18A.txt - 16 bit checksum"
eval $EXE in18A.txt 16 >s18A-Output16.txt
diff -w s18A-Output16.txt s18A-Base16.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #3 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s18A-Output16.txt s18A-Base16.txt
   echo "Case #3 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #3 - in18A.txt - 32 bit checksum"
eval $EXE in18A.txt 32 >s18A-Output32.txt
diff -w s18A-Output32.txt s18A-Base32.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #3 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side s18A-Output32.txt s18A-Base32.txt
   echo "Case #3 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #4 - inRF2.txt -  8 bit checksum"
eval $EXE inRF2.txt 8 >sRF2-Output8.txt
diff -w sRF2-Output8.txt sRF2-Base8.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #4 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side sRF2-Output8.txt sRF2-Base8.txt
   echo "Case #4 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #4 - inRF2.txt - 16 bit checksum"
eval $EXE inRF2.txt 16 >sRF2-Output16.txt
diff -w sRF2-Output16.txt sRF2-Base16.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #4 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side sRF2-Output16.txt sRF2-Base16.txt
   echo "Case #4 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #4 - inRF2.txt - 32 bit checksum"
eval $EXE inRF2.txt 32 >sRF2-Output32.txt
diff -w sRF2-Output32.txt sRF2-Base32.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #4 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side sRF2-Output32.txt sRF2-Base32.txt
   echo "Case #4 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #5 - inWC2.txt -  8 bit checksum"
eval $EXE inWC2.txt 8 >sWC2-Output8.txt
diff -w sWC2-Output8.txt sWC2-Base8.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #5 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side sWC2-Output8.txt sWC2-Base8.txt
   echo "Case #5 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #5 - inWC2.txt - 16 bit checksum"
eval $EXE inWC2.txt 16 >sWC2-Output16.txt
diff -w sWC2-Output16.txt sWC2-Base16.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #5 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side sWC2-Output16.txt sWC2-Base16.txt
   echo "Case #5 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi


echo "Case #5 - inWC2.txt - 32 bit checksum"
eval $EXE inWC2.txt 32 >sWC2-Output32.txt
diff -w sWC2-Output32.txt sWC2-Base32.txt
error=$?
if [ $error -eq 0 ]
then
   echo "  -> program output matched expected"
   echo "  -> Case #5 - complete"
elif [ $error -eq 1 ]
then
   echo "Output on the left, expected on the right"
   echo "Output mismatch -> "
   echo "    check for errors in formatting & encryption"
   diff -w --side-by-side sWC2-Output32.txt sWC2-Base32.txt
   echo "Case #5 - failed"
   exit
else
   echo "There was something wrong with the diff command"
   exit
fi

echo "Checksum testing completed"

