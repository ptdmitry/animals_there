package animals.petAnimals;

public class Cat extends petAnimals {
    public Cat(String name, String birthDate) {
        super(name, birthDate);
    }

    @Override
    public String species() {
        return "Cat";
    }
}
