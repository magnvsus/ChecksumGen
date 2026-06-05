/*============================================================================
 
 Assignment: pa01- Calculate the checksum of an input file given:
				-> the name of the input file
				-> the checksum size of either 8, 16, or 32 bits
 Author: Michael Wang (mi993440)
 Language: java
 To Compile: javac pa01.java
 To Execute: java pa01 inputFilename.txt checksumSize
 where inputFilename.txt is the input file
 and checksumSize is either 8, 16, or 32
 All input files are simple 8 bit ASCII input
 All execute commands above have been tested on Eustis
 Class: CIS3360- Security in Computing- Spring 2025
 Instructor: McAlpin
 Due Date: per assignment
 +===========================================================================*/

import java.util.*;
import java.io.*;
import java.lang.Math;

public class pa01 {

	
	public static void main(String[] args) {
		
		//	Command line arguments:
		String fileName = args[0];
		int checksumSize = 0;
		
		
		//	Checks for valid checksum size.
		try {
			checksumSize = Integer.valueOf(args[1]);
			if(checksumSize != 8 && checksumSize != 16 && checksumSize != 32)
				throw new Exception("Wrong checksum size");
		}
		catch(Exception e)
		{
			System.err.println("Valid checksum sizes are 8, 16, or 32\n");
			System.exit(0);
		}
		//	Convert to bytes for easier arithmetic.
		checksumSize /= 8;
		
		
		//	Variables for file reading
		File file = new File(fileName);
		FileInputStream iStream; 
		
		
		//	Array for byte data of file.
		byte[] data = new byte[(int)file.length()];
		
		
		//	Handle file reading exceptions.
		try 
		{
			iStream = new FileInputStream(file);
			iStream.read(data);
		}
		catch(FileNotFoundException e)
		{
			System.out.println("File not found.");
			e.printStackTrace();	
		} 
		catch(IOException e) {
			
			System.out.println("Error reading from file.");
			e.printStackTrace();
		}
		
		//	Output 1 - Echo the text from the input file.
		//	Only 80 characters per line
		int count = 80;
		for(byte i: data)
		{
			System.out.print((char)i);
			if(count == 0)
			{
				System.out.println();
				count = 80;
			}
			else --count;
			
		}
		
		//	Creates an array of the checksum words
		//	Size is dependent on checksum size. 
		String bin = "";
		count = checksumSize - 1;
		
		//	Calculate if padding is required
		int rem = (int)file.length()%checksumSize;
		int padding = (rem==0)? 0 : (checksumSize - rem);
		
		ArrayList<Integer> words = new ArrayList<Integer>();
		//	Iterate through raw byte data
		for(int i = 0; i < data.length+padding; i++)
		{
			//	Create a string of binary data and append each string to create the "word"
			//	Use 'X' if its padding, else use data from file.
			if(i >= data.length) bin += (String.format("%8s", Integer.toBinaryString('X'))).replace(' ', '0');
			else bin += (String.format("%8s", Integer.toBinaryString(data[i]))).replace(' ', '0');
			if(count == 0)
			{	//	Store new "word"'s binary value into array.
			
				words.add(Integer.parseInt(bin,2));
				bin = "";
				count = checksumSize - 1;
			}
			else --count;
			//
		}

		
		
		//	Add together all words
		// 	Uses bitwise XOR, to maintain word size, and ignore overflow.
		int checksum = words.get(0);
		for(int i = 1; i < words.size(); i++) {
			checksum = checksum + words.get(i);
			checksum = checksum & ((byte)Math.pow(2,checksumSize*8)-1);
		}
		checksum = checksum & ((byte)Math.pow(2,checksumSize*8)-1);
		
		//	Extract individual bytes from checksum
		//	Uses bitwise shifts and ANDs to extract right-most byte
		ArrayList<Byte> checksumArr = new ArrayList<Byte>();
		checksumArr.add((byte)(checksum & 255));
		for(int i = 0; i < checksumSize - 1; i++)
		{
			checksumArr.add(0,(byte)((checksum >> 8) & 255));
			checksum = checksum >> 8;

		}
		
		//	Output 2 - Print the checksum
		//  Print checksum using hex characters 
		String hex = "";
		for(byte i: checksumArr)
		{
			hex += String.format("%02X", i);
		}
		System.out.println(hex);
		
		//
		
		/*byte sum = 0b00000000;
		for(int i = 0; i < data.length; i++)
		{
			sum = (byte)(sum ^ data[i]);
			--count;
			++i;
		}
		//System.out.println(Arrays.toString(data));
		System.out.println(hex);
		*/

	}

}


/*=============================================================================
| I, Michael Wang (mi993440) affirm that this program is
| entirely my own work and that I have neither developed my code together with
| any another person, nor copied any code from any other person, nor permitted
| my code to be copied or otherwise used by any other person, nor have I
| copied, modified, or otherwise used programs created by others. I acknowledge
| that any violation of the above terms will be treated as academic dishonesty.
+=============================================================================*/