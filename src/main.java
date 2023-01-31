import animals.Animals;
import animals.menu.Menu;
import animals.packAnimals.Camel;
import animals.packAnimals.Donkey;
import animals.packAnimals.Horse;
import animals.petAnimals.Cat;
import animals.petAnimals.Dog;
import animals.petAnimals.Hamster;
import animals.animalNursery.animalNursery;

public class main {
    public static void main(String[] args) {
        animalNursery nursery = new animalNursery();
        Menu main_menu = new Menu();
        while (true) {
            switch (main_menu.menuChoice("""
                    1 - Show all animals\s
                    2 - Add an animal\s
                    3 - Choice an animal\s
                    4 - Train the command\s
                    5 - View animal commands\s
                    6 - Delete an animal\s
                    0 - Exit""", 6)){
                case 1:
                    nursery.printInfo();
                    break;
                case 2:
                    nursery.addAnimal(addAnimal());
                    break;
                case 3:
                    System.out.println("Enter the number: ");
                    nursery.selectAnimal(main_menu.readInt());
                    break;
                case 4:
                    System.out.println("Enter the command: ");
                    nursery.addCommand(main_menu.readString());
                    break;
                case 5:
                    nursery.getCommands();
                    break;
                case 6:
                    nursery.deleteAnimal();
                    break;
                case 0:
                    return;
            }
        }
    }
    private static Animals addAnimal() {
        Menu select_animal = new Menu();
        int species = select_animal.menuChoice("""
                    1 - Cat\s
                    2 - Dog\s
                    3 - Hamster\s
                    4 - Horse\s
                    5 - Donkey\s
                    6 - Camel\s
                    0 - Exit""", 6);
        if (species == 0) return null;
        System.out.print("Animal`s name: ");
        String name = select_animal.readString();
        System.out.print("Date of birth: ");
        String birth_date = select_animal.readString();
        return switch (species) {
            case 1 -> new Cat(name, birth_date);
            case 2 -> new Dog(name, birth_date);
            case 3 -> new Hamster(name, birth_date);
            case 4 -> new Horse(name, birth_date);
            case 5 -> new Donkey(name, birth_date);
            case 6 -> new Camel(name, birth_date);
            default -> null;
        };
    }
}
