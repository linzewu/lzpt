package com.kteam.lzpt.test;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import com.kteam.lzpt.common.MD5Encrypt;

public class TestUUID {
	
	public static void main(String[] ages){
		
		///System.out.println(UUID.randomUUID());
		try {
			System.out.println(MD5Encrypt.encodingMD5("a123456"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
