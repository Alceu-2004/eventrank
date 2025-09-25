package com.example.demo;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GerarHash {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        String senhaAlice = "1234";
        String senhaBob = "abcd";
        String senhaAdmin = "1846";

        String hashAlice = encoder.encode(senhaAlice);
        String hashBob = encoder.encode(senhaBob);
        String hashAdmin = encoder.encode(senhaAdmin);

        System.out.println("Hash de Alice: " + hashAlice);
        System.out.println("Hash de Bob: " + hashBob);
        System.out.println("Hash de Admin: " + hashAdmin);
    }
}
