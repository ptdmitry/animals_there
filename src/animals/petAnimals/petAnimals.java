package animals.petAnimals;

import animals.Animals;

public abstract class petAnimals extends Animals {
    public petAnimals(String name, String birthDate) {
        super(name, birthDate);
    }

    @Override
    public String type() {
        return "Pet animal";
    }

    public abstract String species();
}
