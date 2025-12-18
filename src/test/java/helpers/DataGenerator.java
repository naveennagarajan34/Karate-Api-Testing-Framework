package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {
    
    public static String getRandomEmail() {
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + "@naveen.in";
        return email;
    }
        public static String getRandomUserName() {
        Faker faker = new Faker();
        String username = faker.name().username().toLowerCase();
        return username;
    }

    public static String getRandomTitle() {
        Faker faker = new Faker();
        String title = faker.gameOfThrones().character();
        return title;
    }
}
