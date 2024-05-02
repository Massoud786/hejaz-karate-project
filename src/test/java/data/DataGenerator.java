package data;

import java.util.Random;

public class DataGenerator {
    public static String getEmail(){
        String prefix = "hejaz.ahmady_";
        String emailProvider = "@gmail.com";

        Random random = new Random();
        int randomNumber = random.nextInt(1000);
        return prefix + randomNumber + emailProvider;
    }
}
