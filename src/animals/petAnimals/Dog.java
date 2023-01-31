package animals.petAnimals;

public class Dog extends petAnimals {
    public Dog(String name, String birthDate) {
        super(name, birthDate);
    }

    @Override
    public String species() {
        return "Dog";
    }
}
