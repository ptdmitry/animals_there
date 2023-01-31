package animals.petAnimals;

public class Hamster extends petAnimals {
    public Hamster(String name, String birthDate) {
        super(name, birthDate);
    }

    @Override
    public String species() {
        return "Hamster";
    }
}
