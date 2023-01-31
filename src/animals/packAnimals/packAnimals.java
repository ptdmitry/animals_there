package animals.packAnimals;

import animals.Animals;

public abstract class packAnimals extends Animals {
    protected packAnimals(String name, String birthDate) {
        super(name, birthDate);
    }

    @Override
    public String type() {
        return "Pack animal";
    }
    public abstract String species();
}
